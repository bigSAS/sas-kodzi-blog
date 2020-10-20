<script>
export default {
  props: ['tags'],
  data: function() {
    return {
      chosenTags: []
    }
  },
  methods: {
    apply: function () {
      window.location.href = `/blog?tags=selenium`
    }
  }
}
</script>

<template>
  <div>
    tags: {{tags}} <br>
    chosen: {{chosenTags}} <br>
    ...<br>
    <button class="button--load-more" @click="apply">test</button>
  </div>
</template>

<style></style>
