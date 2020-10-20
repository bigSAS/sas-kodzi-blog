<script>
import BlogPostList from '~/components/BlogPostList'
import BlogPostFilters from '~/components/BlogPostFilters'

export default {
  components: {
    BlogPostList,
    BlogPostFilters
  },
  async asyncData({ $content, query }) {
    const queryTags = query.tags ? query.tags.split(',') : []
    const allTagedDocs = await $content('blog')
      .where({ hide: { $eq: "no" } })
      .only(['tags']).fetch()
    const allTags = []
    for (let taggedDoc of allTagedDocs) {
      for (let tag of taggedDoc.tags) {
        if (allTags.indexOf(tag) === -1) {
          allTags.push(tag)
        }
      }
    }
    const posts = await $content('blog')
      .where({ hide: { $eq: "no" }, tags: { $contains: queryTags } })
      .sortBy('date', 'desc')
      .fetch()

    return {
      posts,
      allTags,
      queryTags
    }
  }
}
</script>

<template>
  <div class="content">
    <!-- <BlogPostFilters :tags="allTags" :applied-tags="queryTags" /> -->
    <BlogPostList :posts="posts" />
  </div>
</template>

<style></style>
