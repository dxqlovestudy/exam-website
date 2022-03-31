const config = {
  //登录方式，身份
  identity: [
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
    baseURL: "http://localhost:8080/api",
  },
  // 练习的类别
  contestCategory: [
    {
      name: "网络系统管理",
      children: [
        {
          name: "自主练习",
          children: [
            {
              name: "随机组卷",
              children: [],
            },
            {
              name: "智能组卷",
              children: [],
            },
            {
              name: "针对训练",
              children: [],
            },
            {
              name: "错题专项",
              children: [],
            },
          ],
        },
        {
          name: "赛事模拟",
          children: [],
        },
      ],
    },
    {
      name: "大数据",
      children: [],
    },
    {
      name: "云计算",
      children: [],
    },
  ],
  studentCategory: ["首页", "排行榜", "社区"],

  // 做题状态颜色
  statusColor: {
    info: "#909399",
    finish: "#1afa29",
    warning: "#faad14",
    error: "#FF0000",
  },
  exerciseSize: 60,
};

export default config;
