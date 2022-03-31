<template>
  <div class="login">
    <div class="box">
      <div class="login_mode">
        <el-select v-model="identity" size="small">
          <el-option
            v-for="item in config.identity"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
      </div>
      <el-form
        label-width="100px"
        :model="loginForm"
        ref="formRef"
        :rules="rules"
      >
        <el-form-item label="账号" prop="account">
          <el-input v-model="loginForm.account"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input
            v-model="loginForm.password"
            type="password"
            @keyup.enter="submitForm"
          ></el-input>
        </el-form-item>
        <el-form-item class="btns">
          <el-button type="primary" @click="submitForm" :loading="isLoading"
            >提交</el-button
          >
          <el-button type="success" @click="registerForm"> 注册</el-button>
          <el-button @click="resetForm">重置</el-button>
        </el-form-item>
      </el-form>
      <el-button type="text" class="forget">忘记密码</el-button>
    </div>
  </div>
</template>

<script setup>
import { ref, inject } from "vue";
import { useRouter } from "vue-router";
//导入登录方式相关配置
import config from "@/config";
//导入登录相关请求
import { studentLogin } from "@/network/api/user";
//表单数据
const loginForm = ref({
  account: "admin",
  password: "123456",
});
//选择登录方式
const identity = ref("student");
//表单规则
const rules = ref({
  account: [
    {
      required: true,
      message: "请输入账号",
      trigger: "blur",
    },
  ],
  password: [
    {
      required: true,
      message: "请输入密码",
      trigger: "blur",
    },
  ],
});
//获取表单实例
const formRef = ref();
//获取全局消息组件
const message = inject("message");
const isLoading = ref(false);
//提交表单
const Router = useRouter();
function submitForm() {
  formRef.value.validate(async (valid) => {
    if (valid) {
      isLoading.value = true;
      const res = await studentLogin(
        loginForm.value.account,
        loginForm.value.password,
        identity.value
      );
      console.log(res);
      isLoading.value = false;
      if (res.code === 201) {
        message.success("登录成功");
        window.sessionStorage.setItem("token", res.data);
        // window.
        if (identity.value === "student") Router.push("/student/home");
        else if (identity.value === "teacher") Router.push("/teacher");
        else if (identity.value === "manager") Router.push("/manager");
      } else {
        message.error(res.msg);
      }
    } else message.error("登陆失败 请稍后重试");
  });
}
//重置表单
function resetForm() {
  formRef.value.resetFields();
}

//注册表单
function registerForm(){
  Router.push("/register")
}
</script>
<style lang="less" scoped>
.login {
  width: 60%;
  height: 35%;
  margin: 0 auto;
  min-width: 500px;
  .box {
    width: 480px;
    height: 300px;
    margin: 15% auto;
    position: relative;
    border-radius: 20px;
    background-color: #fff;
    box-shadow: 5px 0px 10px rgb(66 75 174 / 10%);
    .login_mode {
      position: absolute;
      width: 93px;
      right: 10px;
      top: 10px;
    }
    .el-form {
      position: absolute;
      padding: 0;
      margin: 60px;
      .btns {
        margin-top: 60px;
      }
    }
    .forget {
      position: absolute;
      right: 15px;
      bottom: 10px;
      color: #909399;
      // #909399; #e6e6e6
      &:active {
        color: #e6e6e6;
      }
    }
  }
}
</style>
