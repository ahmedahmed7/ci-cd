module.exports = {
    apps: [
        {
            name: "my-app",
            script: "npm",
            args: "start",
            env: {
                port:4000,
                NODE_ENV: "production"
            }
        }
    ]
};
