<template>
  <div class="student">
    <Nav></Nav>
      <router-view></router-view>
  </div>
</template>
<script setup>
import Nav from "./child/Nav.vue";
</script>
<style lang="less" scoped>
</style>
