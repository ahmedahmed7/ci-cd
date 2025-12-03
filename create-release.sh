#!/bin/bash

# Script to create a new release when merging to master
# This can be used manually or integrated into CI/CD pipelines

set -e  # Exit on any error

echo "🚀 Creating new release..."

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not a git repository"
    exit 1
fi

# Check if we're on master or main branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$CURRENT_BRANCH" != "master" ] && [ "$CURRENT_BRANCH" != "main" ]; then
    echo "⚠️  Warning: Not on master/main branch. Current branch: $CURRENT_BRANCH"
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Get current version from package.json
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json not found"
    exit 1
fi

CURRENT_VERSION=$(node -p "require('./package.json').version")
echo "📦 Current version in package.json: $CURRENT_VERSION"

# Check if tag already exists
TAG_NAME="v$CURRENT_VERSION"
if git rev-parse "$TAG_NAME" >/dev/null 2>&1; then
    echo "⚠️  Tag $TAG_NAME already exists. Generating new version..."
    
    # Get the latest tag
    LATEST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
    echo "Latest tag: $LATEST_TAG"
    
    # Extract version number and increment patch version
    VERSION=$(echo $LATEST_TAG | sed 's/v//')
    IFS='.' read -r -a VERSION_PARTS <<< "$VERSION"
    MAJOR=${VERSION_PARTS[0]:-0}
    MINOR=${VERSION_PARTS[1]:-0}
    PATCH=${VERSION_PARTS[2]:-0}
    
    # Increment patch version
    PATCH=$((PATCH + 1))
    NEW_VERSION="$MAJOR.$MINOR.$PATCH"
    TAG_NAME="v$NEW_VERSION"
    
    echo "🆕 New version: $NEW_VERSION"
    
    # Update package.json
    npm version "$NEW_VERSION" --no-git-tag
    git add package.json package-lock.json
    git commit -m "chore: bump version to $NEW_VERSION" || true
else
    NEW_VERSION=$CURRENT_VERSION
    echo "✅ Using version from package.json: $NEW_VERSION"
fi

# Get commit information
COMMIT_SHA=$(git rev-parse --short HEAD)
COMMIT_MSG=$(git log -1 --pretty=%B)
COMMIT_AUTHOR=$(git log -1 --pretty=%an)

echo ""
echo "📝 Release Information:"
echo "   Tag: $TAG_NAME"
echo "   Commit: $COMMIT_SHA"
echo "   Author: $COMMIT_AUTHOR"
echo "   Message: $COMMIT_MSG"
echo ""

# Ask for confirmation
read -p "Create release tag and push to remote? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Release creation cancelled"
    exit 1
fi

# Create and push tag
echo "🏷️  Creating tag: $TAG_NAME"
git tag -a "$TAG_NAME" -m "Release $TAG_NAME

Commit: $COMMIT_SHA
Author: $COMMIT_AUTHOR

$COMMIT_MSG"

echo "📤 Pushing tag to remote..."
git push origin "$TAG_NAME"

# Push version update if it was changed
if [ "$NEW_VERSION" != "$CURRENT_VERSION" ]; then
    echo "📤 Pushing version update to remote..."
    git push origin "$CURRENT_BRANCH"
fi

echo ""
echo "✅ Release $TAG_NAME created successfully!"
echo ""
echo "📋 Next steps:"
echo "   1. Go to your GitHub repository"
echo "   2. Navigate to Releases"
echo "   3. Edit the draft release (if using GitHub Actions) or create a new release with tag $TAG_NAME"
echo ""

