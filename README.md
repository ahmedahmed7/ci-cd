# Vue CI/CD Demo

A modern Vue 3 application with a comprehensive CI/CD pipeline using GitHub Actions.

## 🚀 Features

- **Vue 3** with Composition API
- **Vite** for fast development and building
- **ESLint** for code quality
- **Vitest** for unit testing
- **GitHub Actions** for automated CI/CD
- **GitHub Pages** deployment
- **Security scanning** with npm audit and Snyk
- **Modern UI** with beautiful design

## 📋 Prerequisites

- Node.js 18.x or higher
- npm or yarn package manager

## 🛠️ Setup

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd ci-cd
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start development server**
   ```bash
   npm run dev
   ```

4. **Open your browser**
   Navigate to `http://localhost:5173`

## 📜 Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build
- `npm run lint` - Run ESLint
- `npm run test` - Run unit tests
- `npm run test:ui` - Run tests with UI

## 🧪 Testing

The project includes comprehensive unit tests for the Counter component:

```bash
npm run test
```

Tests cover:
- Component rendering
- Props handling
- User interactions (increment, decrement, reset)
- Edge cases

## 🔄 CI/CD Pipeline

The GitHub Actions workflow includes:

### 1. **Test Job**
- Runs on Node.js 18.x and 20.x
- Installs dependencies
- Runs ESLint for code quality
- Executes unit tests
- Uploads test coverage to Codecov

### 2. **Build Job**
- Triggers on main and develop branches
- Builds the application
- Uploads build artifacts

### 3. **Deploy Job**
- Deploys to GitHub Pages (main branch only)
- Uses GitHub Pages for hosting
- Automatic deployment on successful build

### 4. **Security Job**
- Runs npm audit for vulnerability scanning
- Integrates with Snyk for additional security checks
- Only runs on main branch

### 5. **Notification Job**
- Provides failure notifications
- Helps identify which stage failed

## 🌐 Deployment

The application is automatically deployed to GitHub Pages when code is pushed to the main branch. The deployment URL will be available in the GitHub Actions logs.

## 📁 Project Structure

```
ci-cd/
├── .github/
│   └── workflows/
│       └── ci-cd.yml          # GitHub Actions workflow
├── src/
│   ├── components/
│   │   └── Counter.vue        # Reusable counter component
│   ├── __tests__/
│   │   └── Counter.test.js    # Unit tests
│   ├── App.vue               # Main application component
│   └── main.js               # Application entry point
├── index.html                # HTML template
├── package.json              # Dependencies and scripts
├── vite.config.js           # Vite configuration
├── .eslintrc.js             # ESLint configuration
├── .gitignore               # Git ignore rules
└── README.md                # Project documentation
```

## 🔧 Configuration

### ESLint
The project uses ESLint with Vue 3 specific rules. Configuration is in `.eslintrc.js`.

### Vite
Vite is configured for Vue 3 with testing support. Configuration is in `vite.config.js`.

### GitHub Actions
The CI/CD pipeline is configured in `.github/workflows/ci-cd.yml`.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License.

## 🆘 Support

If you encounter any issues or have questions, please open an issue on GitHub.

---

Built with ❤️ using Vue 3 and GitHub Actions 