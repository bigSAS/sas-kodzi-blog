<script>
import Tag from '~/components/Tag'
export default {
  components: {
    Tag
  },
  props: ['tags', 'appliedTags'],
  data: function() {
    return {
      chosenTags: []
    }
  },
  mounted: function () {
    this.chosenTags = this.appliedTags
  },
  methods: {
    apply: function () {
      window.location.href = `/blog?tags=${this.chosenTags.join()}`
    },
    clear: function () {
      this.chosenTags = []
    },
    addTag: function (tag) {
      if (this.chosenTags.indexOf(tag) === -1) {
        this.chosenTags.push(tag)
      }
    }
  }
}
</script>

<template>
  <div>
    <Tag class="tagged" :label="tag" @clicked="addTag" v-for="(tag, i) in tags" :key="i" />
    <br><br><br>

    chosen: {{chosenTags}} <br>
    <button class="tagged button--load-more" @click="apply">apply tags</button>
    <button class="tagged button--load-more" @click="clear">wyczysc wybor</button>
  </div>
</template>

<style>
.tagged {
  margin: 5px;
}
</style>
