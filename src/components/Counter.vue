<template>
  <div class="counter-component">
    <h3>{{ title }}</h3>
    <p>Count: {{ count }}</p>
    <div class="buttons">
      <button @click="increment" class="btn">+</button>
      <button @click="decrement" class="btn btn-secondary">-</button>
      <button @click="reset" class="btn btn-reset">Reset</button>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const props = defineProps({
  title: {
    type: String,
    default: 'Counter'
  },
  initialValue: {
    type: Number,
    default: 0
  }
})

const count = ref(props.initialValue)

const increment = () => {
  count.value++
}

const decrement = () => {
  count.value--
}

const reset = () => {
  count.value = props.initialValue
}
</script>

<style scoped>
.counter-component {
  text-align: center;
  padding: 1rem;
}

.counter-component h3 {
  margin: 0 0 1rem 0;
  color: #333;
}

.counter-component p {
  font-size: 1.5rem;
  font-weight: bold;
  margin: 0 0 1rem 0;
}

.buttons {
  display: flex;
  gap: 0.5rem;
  justify-content: center;
}

.btn {
  padding: 0.5rem 1rem;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 1rem;
  transition: all 0.3s ease;
}

.btn:hover {
  transform: translateY(-1px);
}

.btn-secondary {
  background: #2196F3;
  color: white;
}

.btn-reset {
  background: #f44336;
  color: white;
}
</style> 