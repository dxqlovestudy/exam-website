const config = {
  //登录方式，身份
  loginMode: [
    {
      label: "学生",
      value: "student",
    },
    {
      label: "教师",
      value: "teacher",
    },
    {
      label: "管理员",
      value: "manager",
    },
  ],
  dev: {
    baseURL: "http://api",
  },
  product: {
    baseURL: "http://localhost:8080",
  },
  // 练习的类别
  contestCategory: [
    "网络系统管理",
    "大数据",
    "云计算",
    "......",
    "......",
    "......",
  ],
  // 试卷类型
  contestType: ["自主练习", "赛事模拟"],
  // 自主练习的四个模块
  selfExercise: ["随机组卷", "智能组卷", "针对训练", "错题专项"],
};

export default config;
