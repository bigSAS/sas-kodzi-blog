<script>
export default {
  name: 'BlogPostPreview',
  props: {
    post: {
      type: Object,
      required: true
    }
  }
}
</script>

<template>
  <section class="blog-post">
    <time class="blog-post__time">{{ post.when }}</time>
    <!-- todo: difficulty component -->
    <h5 class="text-left">Poziom trudności: {{ post.difficulty }}/5</h5>
    <h2 class="blog-post__title">
      <a :href="post.path" class="blog-post__link">{{ post.title }}</a>
    </h2>
    <p v-if="post.excerpt" class="blog-post__excerpt">{{ post.excerpt }}</p>
    <nuxt-link class="button blog-post__button " :to="post.path">
      Czytaj >
    </nuxt-link>
  </section>
</template>

<style lang="scss" scoped>
@import '../styles/_settings.scss';
$primary-color: #22aaff;

.blog-post {
  margin-bottom: 2.5rem;
}

.blog-post__button {
  display: inline-block;
}

.blog-post__excerpt {
  margin-top: 0;
  @apply mb-3;
  font-size: 1rem;
  font-family: 'Montserrat', sans-serif;
}

.blog-post__link {
  font-weight: 700;
  color: #2c3e50;

  &:hover {
    text-decoration: underline;
  }
}

.blog-post__time {
  font-family: 'Poppins';
  font-weight: 500;
}

.blog-post__title {
  margin-top: 0.5rem;
  margin-bottom: 0.75rem;
  @apply font-bold;
  font-family: $ff-sans;
  @apply text-2xl;
}

.button {
  font-family: 'Poppins';
  font-weight: 500;
  border: 1px solid $c-primary;
  border-radius: 4px;
  color: $c-primary;
  font-size: 0.9rem;
  padding: 0.3rem 0.6rem;
  text-transform: uppercase;
  box-shadow: 0 0;
  transition: background-color 0.2s ease-in, color 0.2s ease-in;
}

.button:hover {
  color: #fff;
  text-decoration: none;
  background-color: $c-primary;
}

.tag-list {
  list-style: none;
  padding-left: 0;
  display: flex;
  margin-bottom: 25px;
}

.tag-list__item {
  margin-left: 10px;
}

.tag-list__item:first-child {
  margin-left: 0;
}

.tag-list__btn {
  padding: 5px;
  font-size: 0.9rem;
  background-color: #fff;
}
</style>
