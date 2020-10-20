<script>
import BlogPostList from '~/components/BlogPostList'
import BlogPostFilters from '~/components/BlogPostFilters'

export default {
  components: {
    BlogPostList,
    BlogPostFilters
  },
  async asyncData({ $content, query }) {
    const tags = query.tags ? query.tags.split(',') : []
    const posts = await $content('blog')
      .where({ hide: { $eq: "no" }, tags: { $contains: tags } })
      .sortBy('date', 'desc')
      .fetch()

    return {
      posts
    }
  }
}
</script>

<template>
  <div class="content">
    <BlogPostFilters :tags="['foo', 'bar', 'baz']" />
    <BlogPostList :posts="posts" />
  </div>
</template>

<style></style>
