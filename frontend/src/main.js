import { createApp } from "vue";
import App from "./App.vue";
import "element-plus/dist/index.css";
import router from "./router";
import store from "./store";
//dev环境下模拟后台数据
// import "@/assets/mock/user";
// 引入字体图标库文件
import "@/assets/font/icon.css";

//3/23 Mercurio add
import axios from "axios";
// Vue.prototype.$ajax = axios
const app = createApp(App);
app.use(router);
app.use(store);

app.mount("#app");
