<template>
  <img src="/img/avatar.jpg" alt="Your Logo" :class="$style.logo" />
</template>

<style lang="scss" module>
.logo {
  width: 200px;
  @apply mx-auto;
  animation: 1s appear;
}

@keyframes appear {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
</style>
