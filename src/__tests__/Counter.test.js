import { describe, it, expect } from 'vitest'
import { mount } from '@vue/test-utils'
import Counter from '../components/Counter.vue'

describe('Counter', () => {
  it('renders properly', () => {
    const wrapper = mount(Counter)
    expect(wrapper.find('h3').text()).toBe('Counter')
    expect(wrapper.find('p').text()).toBe('Count: 0')
  })

  it('renders with custom title', () => {
    const wrapper = mount(Counter, {
      props: {
        title: 'Custom Counter'
      }
    })
    expect(wrapper.find('h3').text()).toBe('Custom Counter')
  })

  it('renders with custom initial value', () => {
    const wrapper = mount(Counter, {
      props: {
        initialValue: 5
      }
    })
    expect(wrapper.find('p').text()).toBe('Count: 5')
  })

  it('increments count when + button is clicked', async () => {
    const wrapper = mount(Counter)
    const incrementBtn = wrapper.findAll('button')[0]
    
    await incrementBtn.trigger('click')
    expect(wrapper.find('p').text()).toBe('Count: 1')
  })

  it('decrements count when - button is clicked', async () => {
    const wrapper = mount(Counter, {
      props: {
        initialValue: 5
      }
    })
    const decrementBtn = wrapper.findAll('button')[1]
    
    await decrementBtn.trigger('click')
    expect(wrapper.find('p').text()).toBe('Count: 4')
  })

  it('resets count when reset button is clicked', async () => {
    const wrapper = mount(Counter, {
      props: {
        initialValue: 10
      }
    })
    const incrementBtn = wrapper.findAll('button')[0]
    const resetBtn = wrapper.findAll('button')[2]
    
    await incrementBtn.trigger('click')
    expect(wrapper.find('p').text()).toBe('Count: 11')
    
    await resetBtn.trigger('click')
    expect(wrapper.find('p').text()).toBe('Count: 10')
  })
}) 