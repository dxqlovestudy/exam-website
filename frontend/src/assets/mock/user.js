import Mock, { Random } from "mockjs";

Mock.setup({
  timeout: "400-1000",
});

Mock.mock(/api\/login/, "post", {
  code: 201,
  name: "@first @last",
});

// 随机生成考试题目
const questions = [
  {
    questionId: "-46505886112954320",
    questionContent:
      "企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "-32377424962168800",
    questionContent: "确定项目组成员是实施阶段的工作内容",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "-20082709465895080",
    questionContent:
      "企业为了提高互联出口的可靠性， 常常采用多条链路连接不同运营商的方式，采用这种方式时，需要同时关注出方向和入方向的流量路径， 否则可能会影响网络质量",
    optionA: "正确",
    optionB: "错误",
    answer: "B",
  },
  {
    questionId: "-3903035295930480",
    questionContent: "项目验收只要甲乙双方到场就可以了， 不需要第三方参与",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "-2398135318463840",
    questionContent:
      "]当DHCP客户端与DHCP服务器之间存在设备时，如果DHCP服务器全局地址池中的IP地址与中继设备上连接的客户端的VLANIF接口的IP地址不在同一网段， 则会引起DHCP故障。",
    optionA: "正确",
    optionB: "错误",
    answer: "B",
  },
  {
    questionId: "-39987613343154240",
    questionContent:
      "二层网络架构与三层网络架构相比，具备结构简单、数据转发效率高等优势，所以今后的网络结构将全面转向二层网络结构，三层网络架构将逐步被制汰。",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "-10267735969812320",
    questionContent:
      "二层网络架构与三层网络架构相比，具备结构简单、数据转发效率高等优势，所以今后的网络结构将全面转向二层网络结构，三层网络架构将逐步被制汰。",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "28568493078299840",
    questionContent:
      "二层网络架构与三层网络架构相比，具备结构简单、数据转发效率高等优势，所以今后的网络结构将全面转向二层网络结构，三层网络架构将逐步被制汰。",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "-59731919238752320",
    questionContent:
      "二层网络架构与三层网络架构相比，具备结构简单、数据转发效率高等优势，所以今后的网络结构将全面转向二层网络结构，三层网络架构将逐步被制汰。",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "63135593522702440",
    questionContent:
      "二层网络架构与三层网络架构相比，具备结构简单、数据转发效率高等优势，所以今后的网络结构将全面转向二层网络结构，三层网络架构将逐步被制汰。",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "ABC",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "CD",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "AB",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "AD",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "AB",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
];
questions.forEach((item) => {
  item.score = 2;
  item.stuAnswer = null;
  item.status = 0;
});
Mock.mock(/api\/exercise\/random/, {
  code: 200,
  passingScore: 600,
  data: {
    size: 50,
    examTime: 120,
    totalPoints: 1000,
    // 题目信息
    questions,
    // 考试ID
    examId: Random.string("lower", 5, 10),
  },
});

// 提交卷子
Mock.mock(/api\/submit\/exercise/, {
  code: 201,
  msg: "提交成功",
});

// 中途退出功能
Mock.mock(/api\/submit\/exit/, {
  code: 201,
  msg: "收到请求",
});

// 获取更改后的卷子
const reviewQuestions = [
  {
    questionId: "-46505886112954320",
    questionContent:
      "企业网络常常使用DHCP为用户分配IP地址，与静态地址分配方式相比， DHCP地址分配方式极大地减 少了对网络地址进行管理的工作量",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "-32377424962168800",
    questionContent: "确定项目组成员是实施阶段的工作内容",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "-20082709465895080",
    questionContent:
      "企业为了提高互联出口的可靠性， 常常采用多条链路连接不同运营商的方式，采用这种方式时，需要同时关注出方向和入方向的流量路径， 否则可能会影响网络质量",
    optionA: "正确",
    optionB: "错误",
    answer: "B",
  },
  {
    questionId: "-3903035295930480",
    questionContent: "项目验收只要甲乙双方到场就可以了， 不需要第三方参与",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "-2398135318463840",
    questionContent:
      "]当DHCP客户端与DHCP服务器之间存在设备时，如果DHCP服务器全局地址池中的IP地址与中继设备上连接的客户端的VLANIF接口的IP地址不在同一网段， 则会引起DHCP故障。",
    optionA: "正确",
    optionB: "错误",
    answer: "B",
  },
  {
    questionId: "-39987613343154240",
    questionContent:
      "二层网络架构与三层网络架构相比，具备结构简单、数据转发效率高等优势，所以今后的网络结构将全面转向二层网络结构，三层网络架构将逐步被制汰。",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "-10267735969812320",
    questionContent:
      "二层网络架构与三层网络架构相比，具备结构简单、数据转发效率高等优势，所以今后的网络结构将全面转向二层网络结构，三层网络架构将逐步被制汰。",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "28568493078299840",
    questionContent:
      "二层网络架构与三层网络架构相比，具备结构简单、数据转发效率高等优势，所以今后的网络结构将全面转向二层网络结构，三层网络架构将逐步被制汰。",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "-59731919238752320",
    questionContent:
      "二层网络架构与三层网络架构相比，具备结构简单、数据转发效率高等优势，所以今后的网络结构将全面转向二层网络结构，三层网络架构将逐步被制汰。",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "63135593522702440",
    questionContent:
      "二层网络架构与三层网络架构相比，具备结构简单、数据转发效率高等优势，所以今后的网络结构将全面转向二层网络结构，三层网络架构将逐步被制汰。",
    optionA: "正确",
    optionB: "错误",
    answer: "A",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "ABC",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "CD",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "AB",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "AD",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "AB",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
  {
    questionId: "20337265820639560",
    questionContent:
      "下列零项故障排除方法不是使用TCP/IP 参考模型作为理论基础的?",
    optionA: "对比配置法",
    optionB: "自项向下法",
    optionC: "自底向上法",
    optionD: "替换法",
    answer: "A",
  },
  {
    questionId: "-5490498138654040",
    questionContent:
      "在一个有着财务、 OA(officeAutomation,System,办公自动化)、生产、甚至更多业务系统的复杂网络",
    optionA: "IP地址的分配",
    optionB: "网络设备的型号",
    optionC: "各业务系统的数据流方向",
    optionD: "机房的环境",
    answer: "C",
  },
  {
    questionId: "-82913043165410240",
    questionContent: "在进行设备运行检查时，以下哪项是正确",
    optionA:
      "可通过执行displaymemory-usage命令来检查设各内存占用率， 如果'MemoryUsingPercentageIs'超过80%，此时则需要特别关注",
    optionB:
      '可通过执行displaydevice命令来检查单板运行状态，单板"Online"应为"Present"',
    optionC:
      "可通过执行displayfan命令来查看风扇状态，当Presen项为NO时， 表示正常",
    optionD:
      "可通过执行displayftpserver命令来查看FTP网络服务端口， 未使用的FTP网络服务端口需要记录下来",
    answer: "B",
  },
  {
    questionId: "64824594325433240",
    questionContent: "'打环'测试一般用在什么场合",
    optionA: "测试应用是否能正常连接",
    optionB: "测试路由协议是否能有效避免环路",
    optionC: "测试交换机是否能有效进行环路遏制和广播遏制",
    optionD: "测试物理线路是否有中断",
    answer: "D",
  },
];
reviewQuestions.forEach((item) => {
  item.score = 2;
  item.stuAnswer = Random.string("ABCD", 1, 1);
  if (item.answer.length > 1) {
    item.stuAnswer = "AC";
  }
});
Mock.mock(/api\/exercise\/review/, {
  code: 200,
  data: {
    size: 50,
    questions: reviewQuestions,
    test: "q23qaw",
    totalTime: 5650000,
    startTime: 1637994458000,
    endTime: 1638001911000,
  },
});
