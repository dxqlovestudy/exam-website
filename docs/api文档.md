















# 账户管理

## 错误


身份认证相关错误

```tsx
interface ErrorInfo {
    code: Number; // 401 未登录 403权限不够
    message: String;
}
```

## 	登录验证


登录

## 	post `api/login`      

Request

```tsx
interface login {
    account: String;
    password: String;
    identity: String, // student teacher manager
}
```

Response `201`

```tsx
interface login {
	code: 201;
    user: User,
    token: String; // 用于后序操作验证身份（JWT）
}
```

Response `400`

```tsx
interface login {
	code: 400;
    msg: String; // 错误信息（账号不存在，密码错误等）
}
```

Response `401`

```tsx
interface login {
	code: 401;
    msg: String; // 登录过期，重新登陆
}
```

- [ ] 

## 注册学生账号

Post api/register/student

request 

```
interface registerParam{
	account:String 账号      不可为空
	password:String 密码     不可为空
	nickName:String 名称 昵称 不可为空
	userState:账户状态  禁用是0 正常是1  默认是1 可为空
	remark:String 备注 ，      可以为空
}
```

response

```
success {
    "success": true,
    "code": 201,
    "msg": "success",
    "data": 1
}
账号存在 {
{
    "success": false,
    "code": 10004,
    "msg": "注册失败,账号已存在",
    "data": null
}
注册失败 {
"success": false,
    "code": 10002,
    "msg": "注册失败,",
    "data": null
}
```



## 注册教师账号

Post api/register/teacher

request 

```
interface registerParam{
	account:String 账号      不可为空
	password:String 密码     不可为空
	nickName:String 名称 昵称 不可为空
	userState:账户状态  禁用是0 正常是1  默认是1 可为空
	remark:String 备注 ，      可以为空
}
```

response

```
success {
    "success": true,
    "code": 201,
    "msg": "success",
    "data": 1
}
账号存在 {
{
    "success": false,
    "code": 10004,
    "msg": "注册失败,账号已存在",
    "data": null
}
注册失败 {
"success": false,
    "code": 10002,
    "msg": "注册失败,",
    "data": null
}
```



## 注册管理员账号

Post api/register/manager

request 

```
interface registerParam{
	account:String 账号      不可为空
	password:String 密码     不可为空
	nickName:String 名称 昵称 不可为空
	userState:账户状态  禁用是0 正常是1  默认是1 可为空
	remark:String 备注 ，      可以为空
}
```

response

```
success {
    "success": true,
    "code": 201,
    "msg": "success",
    "data": 1
}
账号存在 {
{
    "success": false,
    "code": 10004,
    "msg": "注册失败,账号已存在",
    "data": null
}
注册失败 {
"success": false,
    "code": 10002,
    "msg": "注册失败,",
    "data": null
}
```



## 添加学生账号 （已废弃）

get api/add/addUser

*request*

~~~添加
interface addUserParam{
		account:String 账号
		password:String 密码
		nickName：String 昵称
		identity：身份，有默认值
		！！！！这里是添加学生账号，这里的身份必须是Student
}
~~~

response

~~~
interface user{
   "success": true,
    "code": 201,
    "msg": "success",
    "data": {
        "userId": String
        "account": String
        "password": String
        "nickName": String
        "identity": ,String

    }
}
~~~



## 修改学生密码	（未做）

## 添加教师账号	（已废弃）

get api/add/addUser

*request*

~~~添加
interface addUserParam{
		account:String 账号
		password:String 密码
		nickName：String 昵称
		identity：身份，有默认值
		！！！！这里是添加教师账号，这里的身份必须是Teacher
}
~~~

response

~~~
interface user{
   "success": true,
    "code": 201,
    "msg": "success",
    "data": {
        "userId": String
        "account": String
        "password": String
        "nickName": String
        "identity": ,String

    }
}
~~~



## 修改教师密码	（未做）

# 

# 学生模块

## 获取考试后卷子信息

GET ```api/exercise/question/info/{id}```

Request

```tsx
id: String // 卷子ID
```

Response

```tsx
interface examInfo {
    code: 200,
    data: {
        size: Nubmer // 题目数量
        examTime: Number, // 考试用时
        totalPoints: Number // 总分
       	
      
        // 选择题 单选题
        choiceQuestions: Array<ChoiceQuesitonVo>
        // 考试ID
        examId: String,
    }
}
interface ChoiceQuestionVo {
    questionId: String, // 题目ID
    questionContent: String // 题目内容
    answer: String // 题目答案 A B C D
    // 选择题选项
    optionA: String,  
    optionB: String, 
    optionC: String, 
    optionD: String, 
    score: Number // 题目分值
    stuAnswer:String //默认是null 考生答案
}
```

## 学生获取所有自己的考试记录	

`api/exercise/exam/recording`

```
interface examRecording{
	questionNum：integer 题目数量
	totalScore:Integer  总分
	WrongAnsNum:Integer 错题数
	isFinish：Integer 是否完成 未完成是0 完成是1 默认是0
	totalTime：所用时长 
	submitTime：提交时间
	examType:考试类型
	
}
```





# 教师模块

## 添加教师自有题目

## `api/addQuestion/addSelfQustion`

教师添加题目，这个题目为教师自己所有

Request

```
interface teacherQuestion{
questionContent: String // 题目内容
    AnsNum:int   题目数量，单选还是多选，单选是0，多选是1，默认是0
    answer: Number // 题目答案
    analyse：题目解析
    // 选择题选项
    optionA: String,  
    optionB: String, 
    optionC: String, 
    optionD: String, 
    optionE:String,
    optionF:String,
    optionG:String,
}
```

## 获取学生列表 （未做）

## get `api/students/info/{num}/{size}` 

Response `200`

```tsx
interface studentInfo {
    code: Number;
	user: User  // 学生的基本信息
    // 包括最近提交记录（练习时长，分数，练习类别），正确率分析（自主练习，赛事模拟）
}
interface User {
    
}
```

## 获取学生所有的考试记录 （未做）

## 教师发布任务 （未做）

暂时不做

# 

# 管理员模块 （已修改 ）

## 添加系统题目

`api/addQuestion/addSysQustion`

添加系统的题目，由管理员添加

Request

```
旧的 interface addQuestion{
questionContent: String // 题目内容
    AnsNum:int   题目数量，单选还是多选，单选是0，多选是1，默认是0
    answer: Number // 题目答案
    analyse：题目解析
    // 选择题选项
    optionA: String,  
    optionB: String, 
    optionC: String, 
    optionD: String, 
    optionE:String,
    optionF:String,
    optionG:String,
}
-------------------------------------------
新的
interface addQuestion{
questionContent: String // 题目内容
    AnsNum:int   题目数量，单选还是多选，单选是0，多选是1，默认是0
    answer: Number // 题目答案
    analyse：题目解析
    // 选择题选项
    optionA: String,  
    optionB: String, 
    optionC: String, 
    optionD: String, 
    optionE:String,
    optionF:String,
    optionG:String,
    List<Integer> topics, 这个是这个题目的知识点的数组 数组中存的是知识点的id，
    }

```

# 

# 试卷管理

## 随机组卷

## get`api/exercise/random`

Request

```tsx
interface exerciseRandom {
    size: Number  //题目数量（默认···道）
}  
```

Response `200`

```tsx
interface exerciseRandom {
	code: 200,
    data: {
      questions:List<QuestionVo>题目列表
        size:Integer    题目数量
        examTime:String 考试时间
        examId：考试Id
        totalPoints: 总分
    }
} 
interface QuestionVo {
   questionId：String  题目Id
   questionContent:String  题目内容
   Analyse:String           题目分析
   Answer:String            题目答案
   stuAnswer:String        学生答案
   status:Integer           状态
   AnsNum:Integer          题目数量
   score:Integer           单题分数
   optionA;String
   optionB;String
   optionC;String
   optionD;String
   optionE;String
   optionF;String
   List<QuestionTopics> questionTopics 知识点数组
   
}
QuestionTopics{ 
    id：Integer  知识点ID
    topic:String 知识点
}
```

## 专项训练  

## get`api/exercise/topic`

```
request
interface TopicParam{
	Topics：ArrayList<Integer> 一个数组，里面是topic，知识点的id
	questionNum：Integer 
}

response
interface exerciseRandom {
	code: 200,
    data: {
      questions:List<QuestionVo>题目列表
        size:Integer    题目数量
        examTime:String 考试时间
        examId：考试Id
        totalPoints: 总分
    }
} 
interface QuestionVo {
   questionId：String  题目Id
   questionContent:String  题目内容
   Analyse:String           题目分析
   Answer:String            题目答案
   stuAnswer:String        学生答案
   status:Integer           状态
   AnsNum:Integer          题目数量
   score:Integer           单题分数
   optionA;String
   optionB;String
   optionC;String
   optionD;String
   optionE;String
   optionF;String
   List<QuestionTopics> questionTopics 知识点数组
   
}
QuestionTopics{ 
    id：Integer  知识点ID
    topic:String 知识点
}
```



## 提交卷子

## post api/exercise/submit

Request

```tsx
 interface exerciseSubmit{
 		totleTime: String // 学生用时，单位：分钟
 		examId: String // 考试的id
        questionAnswers: Array<answer> // 学生答案数组
 }
interface answer {
    questionId: String // 题目ID
    answer: Number || String // 学生答案
}

```

Response

~~~tsx
interface {
   code: 201
   msg: String
}

~~~

