module.exports = {
  apps: [
    {
      name: 'vue-cicd-demo',
      script: 'npm',
      args: 'run dev',
      cwd: './',
      instances: 1,
      autorestart: true,
      watch: false,
      max_memory_restart: '1G',
      env: {
        NODE_ENV: 'development',
        PORT: 4000
      },
      error_file: './logs/vue-cicd-demo-error.log',
      out_file: './logs/vue-cicd-demo-out.log',
      log_file: './logs/vue-cicd-demo-combined.log',
      time: true
    }
  ],
};