<template>
  <div class="app">
    <header class="header">
      <h1>🚀 Vue CI/CD Demo</h1>
      <p>Welcome to our automated deployment pipeline!</p>
    </header>
    
    <main class="main">
      <div class="card">
        <h2>Features</h2>
        <ul class="features">
          <li>✅ Vue 3 with Composition API</li>
          <li>✅ Vite for fast development</li>
          <li>✅ ESLint for code quality</li>
          <li>✅ Vitest for testing</li>
          <li>✅ GitHub Actions CI/CD</li>
        </ul>
      </div>
      
      <div class="card">
        <h2>Counter Example</h2>
        <div class="counter">
          <p>Count: {{ count }}</p>
          <button @click="increment" class="btn">Increment</button>
          <button @click="decrement" class="btn btn-secondary">Decrement</button>
        </div>
      </div>
      
      <div class="card">
        <h2>Pipeline Status</h2>
        <div class="status">
          <span class="status-badge success">✅ Build Passing</span>
          <span class="status-badge success">✅ Tests Passing</span>
          <span class="status-badge success">✅ Lint Passing</span>
        </div>
      </div>
    </main>
    
    <footer class="footer">
      <p>Built with ❤️ using Vue 3 and GitHub Actions</p>
    </footer>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const count = ref(0)

const increment = () => {
  count.value++
}

const decrement = () => {
  count.value--
}
</script>

<style scoped>
.app {
  min-height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  color: white;
}

.header {
  text-align: center;
  padding: 3rem 1rem;
}

.header h1 {
  font-size: 3rem;
  margin: 0 0 1rem 0;
  text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
}

.header p {
  font-size: 1.2rem;
  opacity: 0.9;
  margin: 0;
}

.main {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 1rem;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  margin-bottom: 3rem;
}

.card {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: 15px;
  padding: 2rem;
  border: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.card h2 {
  margin: 0 0 1.5rem 0;
  font-size: 1.5rem;
  color: #fff;
}

.features {
  list-style: none;
  padding: 0;
  margin: 0;
}

.features li {
  padding: 0.5rem 0;
  font-size: 1.1rem;
}

.counter {
  text-align: center;
}

.counter p {
  font-size: 2rem;
  font-weight: bold;
  margin: 0 0 1rem 0;
}

.btn {
  background: #4CAF50;
  color: white;
  border: none;
  padding: 0.75rem 1.5rem;
  margin: 0 0.5rem;
  border-radius: 25px;
  cursor: pointer;
  font-size: 1rem;
  transition: all 0.3s ease;
}

.btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0,0,0,0.2);
}

.btn-secondary {
  background: #2196F3;
}

.status {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.status-badge {
  padding: 0.5rem 1rem;
  border-radius: 20px;
  font-size: 0.9rem;
  font-weight: bold;
  text-align: center;
}

.status-badge.success {
  background: rgba(76, 175, 80, 0.2);
  border: 1px solid rgba(76, 175, 80, 0.5);
  color: #4CAF50;
}

.footer {
  text-align: center;
  padding: 2rem;
  opacity: 0.8;
}

@media (max-width: 768px) {
  .header h1 {
    font-size: 2rem;
  }
  
  .main {
    grid-template-columns: 1fr;
  }
  
  .btn {
    display: block;
    width: 100%;
    margin: 0.5rem 0;
  }
}
</style> 