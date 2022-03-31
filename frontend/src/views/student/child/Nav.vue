<template>
  <div class="nav">
    <div class="container">
      <div class="logo">LOGO</div>
      <div class="main-nav">
        <div
          :class="['nav-item', { active: currentIndex === i }]"
          v-for="(item, i) in studentCategory"
          @click="handleClick"
        >
          {{ item }}
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import { ref } from "vue";
import config from "@/config";
// 分类
const studentCategory = config.studentCategory;
// 下标
const currentIndex = ref(0);
</script>
<style lang="less" scoped>
.nav {
  position: fixed;
  top: 0;
  right: 0;
  left: 0;
  height: 4rem;
  background-color: #fff;
  box-shadow: 0 1px 2px 0 rgb(0 0 0 / 5%);
  z-index: 999;
  .container {
    width: 80%;
    min-width: 1000px;
    margin: auto;
    line-height: 4rem;
    display: flex;
    align-items: center;
    .logo {
      margin-left: 40px;
      font-size: 20px;
      margin-right: 2rem;
    }
    .main-nav {
      color: #909090;
      display: flex;
      .nav-item {
        margin: 0 2rem;
        cursor: pointer;
        &:hover {
          color: #74dbfa;
        }
      }
      .active {
        color: #74dbfa;
      }
    }
  }
}
</style>
