<template>
  <div class="info tag" @mouseover="mouseover" @mouseout="mouseout">
    <div class="avator">个人信息</div>
    <div class="float" v-show="flag === 1">
      <el-descriptions class="margin-top" :column="1">
        <el-descriptions-item label="姓名">黄京旺</el-descriptions-item>
        <el-descriptions-item label="ID">18100000000</el-descriptions-item>
        <el-descriptions-item label="--">最近一次练习 --</el-descriptions-item>
        <el-descriptions-item label="练习类别">自主练习</el-descriptions-item>
        <el-descriptions-item label="分数">
          <el-tag size="medium">90</el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="练习时长">136分钟</el-descriptions-item>
      </el-descriptions>
    </div>
  </div>
  <div class="logout tag" @click="logout">退出</div>
</template>
<script setup>
import { ref } from "vue";
import { ElMessageBox } from "element-plus";
import { useRouter } from "vue-router";
const Router = useRouter();
function logout() {
  ElMessageBox.confirm("你确定要退出么?", {
    confirmButtonText: "确定",
    cancelButtonText: "取消",
    type: "warning",
  })
    .then(() => {
      Router.push("/login");
    })
    .catch(() => {});
}
// 标志位 判断是否显示信息表
const flag = ref(0);
function mouseover() {
  flag.value = 1;
}
function mouseout() {
  flag.value = 0;
}

//获取后端学生信息



//express方法
// var express = require('express')  //载入express
// var apiServer = express()
// var bodyParser=require('body-parser') //获取请求body-parser
// apiServer.use(bodyParser.urlencoded({extended:true}))
// apiServer.use(bodyParser.json())
// var apiRouter = express.Router()
// var fs = require('fs') //node自带的fs
// apiRouter.route('/getSelfInfo') //指的是/api 下一级的路由路径名字
//     .all(function (req, res) { //all只得是get post都支持
//       fs.readFile('./db.json', 'utf8', function (err, data) {
//         if (err) throw err
//         var data = JSON.parse(data)
//         if (data[req.params.apiName]) {
//           res.json(data[req.params.apiName])
//         }
//         else {
//           res.send('no such api name')
//         }
//
//       })
//     })
// apiServer.use('/getSelfInfo', apiRouter);
// apiServer.listen(8001, function (err) {
//   if (err) {
//     console.log(err)
//     return
//   }
//   console.log('Listening at http://localhost:' + 8001 + '\n')
// })

</script>
<style lang="less" scoped>
.tag {
  position: absolute;
  top: 10px;
  cursor: pointer;
  .float {
    position: absolute;
    left: -40px;
    top: 30px;
    width: 200px;
  }
}
.info {
  right: 50px;
  height: 40px;
}
.logout {
  right: 0px;
  &:hover {
    color: #e7dfcf;
  }
}
</style>
