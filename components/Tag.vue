<script>
export default {
  props: ['label'],
  methods: {
    clicked: function () {
      this.$emit('clicked', this.label)
    }
  }
}
</script>

<template>
  <button @click="clicked" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">{{label}}</button>
</template>

<style></style>
