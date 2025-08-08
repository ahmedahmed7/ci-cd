<template>
  <div class="app">
    <header class="header">
      <h1>📝 Todo List</h1>
      <p>Gérez vos tâches facilement</p>
    </header>
    
    <main class="main">
      <div class="todo-container">
        <!-- Add new todo -->
        <div class="add-todo">
          <input 
            v-model="newTodo" 
            @keyup.enter="addTodo"
            placeholder="Ajouter une nouvelle tâche..."
            class="todo-input"
          />
          <button @click="addTodo" class="add-btn">+</button>
        </div>

        <!-- Todo list -->
        <div class="todo-list">
          <div 
            v-for="(todo, index) in todos" 
            :key="index"
            class="todo-item"
            :class="{ completed: todo.completed }"
          >
            <input 
              type="checkbox" 
              :checked="todo.completed"
              @change="toggleTodo(index)"
              class="todo-checkbox"
            />
            <span class="todo-text">{{ todo.text }}</span>
            <button @click="removeTodo(index)" class="delete-btn">🗑️</button>
          </div>
        </div>

        <!-- Stats -->
        <div class="stats">
          <p>Total: {{ todos.length }} | Complétées: {{ completedCount }}</p>
          <button @click="clearCompleted" class="clear-btn">Effacer complétées</button>
        </div>
      </div>
    </main>
    
    <footer class="footer">
      <p>Built with ❤️❤❤ using Vue 3 and PM2</p>
    </footer>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

const newTodo = ref('')
const todos = ref([
  { text: 'Apprendre Vue 3', completed: false },
  { text: 'Configurer PM2', completed: true },
  { text: 'Déployer sur VPS', completed: false }
])

const completedCount = computed(() => {
  return todos.value.filter(todo => todo.completed).length
})

const addTodo = () => {
  if (newTodo.value.trim()) {
    todos.value.push({
      text: newTodo.value.trim(),
      completed: false
    })
    newTodo.value = ''
  }
}

const toggleTodo = (index) => {
  todos.value[index].completed = !todos.value[index].completed
}

const removeTodo = (index) => {
  todos.value.splice(index, 1)
}

const clearCompleted = () => {
  todos.value = todos.value.filter(todo => !todo.completed)
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
  padding: 2rem 1rem;
}

.header h1 {
  font-size: 2.5rem;
  margin: 0 0 0.5rem 0;
  text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
}

.header p {
  font-size: 1.1rem;
  opacity: 0.9;
  margin: 0;
}

.main {
  max-width: 600px;
  margin: 0 auto;
  padding: 0 1rem;
}

.todo-container {
  background: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: 15px;
  padding: 2rem;
  border: 1px solid rgba(255, 255, 255, 0.2);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.add-todo {
  display: flex;
  gap: 0.5rem;
  margin-bottom: 2rem;
}

.todo-input {
  flex: 1;
  padding: 0.75rem 1rem;
  border: none;
  border-radius: 25px;
  font-size: 1rem;
  background: rgba(255, 255, 255, 0.9);
  color: #333;
}

.todo-input:focus {
  outline: none;
  box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.5);
}

.add-btn {
  width: 50px;
  height: 50px;
  border: none;
  border-radius: 50%;
  background: #4CAF50;
  color: white;
  font-size: 1.5rem;
  cursor: pointer;
  transition: all 0.3s ease;
}

.add-btn:hover {
  transform: scale(1.1);
  background: #45a049;
}

.todo-list {
  margin-bottom: 2rem;
}

.todo-item {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 1rem;
  margin-bottom: 0.5rem;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 10px;
  transition: all 0.3s ease;
}

.todo-item:hover {
  background: rgba(255, 255, 255, 0.15);
}

.todo-item.completed {
  opacity: 0.6;
}

.todo-item.completed .todo-text {
  text-decoration: line-through;
}

.todo-checkbox {
  width: 20px;
  height: 20px;
  cursor: pointer;
}

.todo-text {
  flex: 1;
  font-size: 1.1rem;
}

.delete-btn {
  background: none;
  border: none;
  font-size: 1.2rem;
  cursor: pointer;
  opacity: 0.7;
  transition: opacity 0.3s ease;
}

.delete-btn:hover {
  opacity: 1;
}

.stats {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-top: 1rem;
  border-top: 1px solid rgba(255, 255, 255, 0.2);
}

.clear-btn {
  padding: 0.5rem 1rem;
  border: none;
  border-radius: 20px;
  background: rgba(244, 67, 54, 0.8);
  color: white;
  cursor: pointer;
  transition: all 0.3s ease;
}

.clear-btn:hover {
  background: rgba(244, 67, 54, 1);
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
  
  .todo-container {
    padding: 1.5rem;
  }
  
  .stats {
    flex-direction: column;
    gap: 1rem;
  }
}
</style> 