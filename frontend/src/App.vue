<template>
  <!--  返回到上一页按钮-->
  <el-button
          class="go-home"
          type="success"
          @click="this.$router.push({path:'/student/home'})"
          v-show="this.$route.path !== '/login'"
  >返回首页</el-button>
  <!--  退出登录-->
  <el-button
          class="quit-login"
          type="warning"
          @click="quitLogin"
          v-show="this.$route.path === '/student/home'"
  >退出登录</el-button>
  <!-- <router-view v-slot="{ Component }">
    <keep-alive>
      <component :is="Component" />
    </keep-alive>
  </router-view> -->
  <router-view></router-view>
</template>
<script setup>
// This starter template is using Vue 3 <script setup> SFCs
// Check out https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup
import { provide } from "vue";
import Login from "@/views/login/Login.vue";
import { ElMessage } from "element-plus";
import * as echarts from "echarts";
import { getCurrentInstance } from 'vue';
//在全局找到this
const instance = getCurrentInstance()
const _this= instance.appContext.config.globalProperties;
const quitLogin = ()=>{
  window.sessionStorage.clear()
  _this.$router.push({path:'/login'})
}
const goHome = ()=>{
  _this.$router.push({path:'/student/home'})
}
//全局注入消息提示功能
provide("message", ElMessage);
// 全局注入echarts
provide("echarts", echarts);
</script>
<style lang="less">
@import "@/assets/css/style.less";
body,
html {
  background-color: @primaty-color;
  margin: 0;
  padding: 0;
}
.go-home{
  z-index: 9999;
  position: absolute;
  top:10px;
  left:0
}
.quit-login{
  z-index: 9999;
  position: fixed;
  top:10px;
  right: 0;
}
</style>
