<script>
export default {
  props: {
    name: {
      type: String,
      required: true
    }
  }
}
</script>

<template>
  <img :src="`/icons/${name}.svg`" :alt="`${name} icon`" :class="$style.small" />
</template>

<style lang="scss" module>
.small {
  width: 30px;
  display: inline-block;
}
</style>
