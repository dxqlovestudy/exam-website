# 查看最新开发文档，请在启动后端项目后，点击[考试系统开发文档](http://localhost:8080/doc.html)

**考试系统开发文档**

**简介**：

开发中

**HOST**:localhost:8080

**联系人**:

**Version**:v1.0

**接口路径**：/v2/api-docs

# add-question-controller

## addTeacherSelfQuestion

**接口描述**:

**接口地址**:`/api/addQuestion/addSelfQuestion`

**请求方式**：`POST`

**consumes**:`["application/json"]`

**produces**:`["*/*"]`

**请求示例**：

```json
{
    "analyse": "",
    "ansNum": 0,
    "answer": "",
    "optionA": "",
    "optionB": "",
    "optionC": "",
    "optionD": "",
    "optionE": "",
    "optionF": "",
    "optionG": "",
    "questionContent": "",
    "topics": []
}
```

**请求参数**：

| 参数名称      | 参数说明      | in   | 是否必须 | 数据类型       | schema         |
| :------------ | :------------ | :--- | :------- | :------------- | :------------- |
| questionParam | questionParam | body | true     | 添加题目的参数 | 添加题目的参数 |

**schema属性说明**

**添加题目的参数**

| 参数名称        | 参数说明   | in   | 是否必须 | 数据类型       | schema |
| :-------------- | :--------- | :--- | :------- | :------------- | :----- |
| analyse         |            | body | false    | string         |        |
| ansNum          |            | body | false    | integer(int32) |        |
| answer          |            | body | false    | string         |        |
| optionA         | 题目选项A  | body | false    | string         |        |
| optionB         | 题目选项B  | body | false    | string         |        |
| optionC         | 题目选项C  | body | false    | string         |        |
| optionD         | 题目选项D  | body | false    | string         |        |
| optionE         | 题目选项E  | body | false    | string         |        |
| optionF         | 题目选项F  | body | false    | string         |        |
| optionG         | 题目选项G  | body | false    | string         |        |
| questionContent | 题目的题干 | body | false    | string         |        |
| topics          | 知识点Id   | body | false    | array          |        |

**响应示例**:

```json
{
    "code": 0,
    "data": {},
    "msg": "",
    "success": true
}
```

**响应参数**:

| 参数名称 | 参数说明   | 类型           | schema         |
| :------- | :--------- | :------------- | :------------- |
| code     | 状态码     | integer(int32) | integer(int32) |
| data     | 返回的数据 | object         |                |
| msg      | 返回的信息 | string         |                |
| success  | 是否成功   | boolean        |                |

**响应状态**:

| 状态码 | 说明         | schema     |
| :----- | :----------- | :--------- |
| 200    | OK           | 返回的结果 |
| 201    | Created      |            |
| 401    | Unauthorized |            |
| 403    | Forbidden    |            |
| 404    | Not Found    |            |

## addSysQuestion

**接口描述**:

**接口地址**:`/api/addQuestion/addSysQuestion`

**请求方式**：`POST`

**consumes**:`["application/json"]`

**produces**:`["*/*"]`

**请求示例**：

```json
{
    "analyse": "",
    "ansNum": 0,
    "answer": "",
    "optionA": "",
    "optionB": "",
    "optionC": "",
    "optionD": "",
    "optionE": "",
    "optionF": "",
    "optionG": "",
    "questionContent": "",
    "topics": []
}
```

**请求参数**：

| 参数名称      | 参数说明      | in   | 是否必须 | 数据类型       | schema         |
| :------------ | :------------ | :--- | :------- | :------------- | :------------- |
| questionParam | questionParam | body | true     | 添加题目的参数 | 添加题目的参数 |

**schema属性说明**

**添加题目的参数**

| 参数名称        | 参数说明   | in   | 是否必须 | 数据类型       | schema |
| :-------------- | :--------- | :--- | :------- | :------------- | :----- |
| analyse         |            | body | false    | string         |        |
| ansNum          |            | body | false    | integer(int32) |        |
| answer          |            | body | false    | string         |        |
| optionA         | 题目选项A  | body | false    | string         |        |
| optionB         | 题目选项B  | body | false    | string         |        |
| optionC         | 题目选项C  | body | false    | string         |        |
| optionD         | 题目选项D  | body | false    | string         |        |
| optionE         | 题目选项E  | body | false    | string         |        |
| optionF         | 题目选项F  | body | false    | string         |        |
| optionG         | 题目选项G  | body | false    | string         |        |
| questionContent | 题目的题干 | body | false    | string         |        |
| topics          | 知识点Id   | body | false    | array          |        |

**响应示例**:

```json
{
    "code": 0,
    "data": {},
    "msg": "",
    "success": true
}
```

**响应参数**:

| 参数名称 | 参数说明   | 类型           | schema         |
| :------- | :--------- | :------------- | :------------- |
| code     | 状态码     | integer(int32) | integer(int32) |
| data     | 返回的数据 | object         |                |
| msg      | 返回的信息 | string         |                |
| success  | 是否成功   | boolean        |                |

**响应状态**:

| 状态码 | 说明         | schema     |
| :----- | :----------- | :--------- |
| 200    | OK           | 返回的结果 |
| 201    | Created      |            |
| 401    | Unauthorized |            |
| 403    | Forbidden    |            |
| 404    | Not Found    |            |

# 

# exam-controller

## getAllExamRecording

**接口描述**:

**接口地址**:`/api/exercise/exam/info`

**请求方式**：`GET`

**consumes**:``

**produces**:`["*/*"]`

**请求参数**： 暂无

**响应示例**:

```json
{
    "code": 0,
    "data": [
        {
            "availability": 0,
            "examRecordingId": "",
            "examType": "",
            "isFinish": 0,
            "limitTime": 0,
            "questionNum": 0,
            "spendTime": 0,
            "studentId": "",
            "submitTime": 0,
            "totalScore": 0,
            "wrongAnsNum": 0
        }
    ],
    "msg": "",
    "success": true
}
```

**响应参数**:

| 参数名称 | 参数说明   | 类型           | schema         |
| :------- | :--------- | :------------- | :------------- |
| code     | 状态码     | integer(int32) | integer(int32) |
| data     | 返回的数据 | array          | ExamRecording  |
| msg      | 返回的信息 | string         |                |
| success  | 是否成功   | boolean        |                |

**schema属性说明**

**ExamRecording**

| 参数名称        | 参数说明 | 类型           | schema |
| :-------------- | :------- | :------------- | :----- |
| availability    |          | integer(int32) |        |
| examRecordingId |          | string         |        |
| examType        |          | string         |        |
| isFinish        |          | integer(int32) |        |
| limitTime       |          | integer(int64) |        |
| questionNum     |          | integer(int32) |        |
| spendTime       |          | integer(int64) |        |
| studentId       |          | string         |        |
| submitTime      |          | integer(int64) |        |
| totalScore      |          | integer(int32) |        |
| wrongAnsNum     |          | integer(int32) |        |

**响应状态**:

| 状态码 | 说明         | schema                          |
| :----- | :----------- | :------------------------------ |
| 200    | OK           | 返回的结果«List«ExamRecording»» |
| 401    | Unauthorized |                                 |
| 403    | Forbidden    |                                 |
| 404    | Not Found    |                                 |

## getExamInfo

**接口描述**:

**接口地址**:`/api/exercise/question/info/{id}`

**请求方式**：`GET`

**consumes**:``

**produces**:`["*/*"]`

**请求参数**：

| 参数名称 | 参数说明 | in   | 是否必须 | 数据类型 | schema |
| :------- | :------- | :--- | :------- | :------- | :----- |
| id       | id       | path | true     | string   |        |

**响应示例**:

```json
{
    "code": 0,
    "data": {
        "examId": "",
        "questionAnswers": [
            {
                "questionId": "",
                "stuAnswer": ""
            }
        ],
        "questions": [
            {
                "analyse": "",
                "ansNum": 0,
                "answer": "",
                "optionA": "",
                "optionB": "",
                "optionC": "",
                "optionD": "",
                "optionE": "",
                "optionF": "",
                "optionG": "",
                "questionContent": "",
                "questionId": "",
                "questionTopics": [
                    {
                        "id": 0,
                        "topic": ""
                    }
                ],
                "score": 0,
                "status": 0,
                "stuAnswer": ""
            }
        ],
        "size": 0,
        "spendTime": 0,
        "submitTime": 0,
        "totalPoints": 0
    },
    "msg": "",
    "success": true
}
```

**响应参数**:

| 参数名称 | 参数说明   | 类型           | schema         |
| :------- | :--------- | :------------- | :------------- |
| code     | 状态码     | integer(int32) | integer(int32) |
| data     | 返回的数据 | 考试信息       | 考试信息       |
| msg      | 返回的信息 | string         |                |
| success  | 是否成功   | boolean        |                |

**schema属性说明**

**考试信息**

| 参数名称        | 参数说明 | 类型           | schema                   |
| :-------------- | :------- | :------------- | :----------------------- |
| examId          | 试卷ID   | string         |                          |
| questionAnswers |          | array          | 学生的答案               |
| questions       | 题目     | array          | 组卷时的返回给前端的题目 |
| size            | 题目数量 | integer(int32) |                          |
| spendTime       | 用时     | integer(int64) |                          |
| submitTime      | 提交时间 | integer(int64) |                          |
| totalPoints     | 总分     | integer(int32) |                          |

**学生的答案**

| 参数名称   | 参数说明             | 类型   | schema |
| :--------- | :------------------- | :----- | :----- |
| questionId | 题目Id               | string |        |
| stuAnswer  | 学生给的这个题的答案 | string |        |

**组卷时的返回给前端的题目**

| 参数名称        | 参数说明               | 类型           | schema |
| :-------------- | :--------------------- | :------------- | :----- |
| analyse         |                        | string         |        |
| ansNum          |                        | integer(int32) |        |
| answer          |                        | string         |        |
| optionA         | 题目选项A              | string         |        |
| optionB         | 题目选项B              | string         |        |
| optionC         | 题目选项C              | string         |        |
| optionD         | 题目选项D              | string         |        |
| optionE         | 题目选项E              | string         |        |
| optionF         | 题目选项F              | string         |        |
| optionG         | 题目选项G              | string         |        |
| questionContent | 题目的题干             | string         |        |
| questionId      | 题目的Id               | string         |        |
| questionTopics  |                        | array          | 知识点 |
| score           | 每个题目的分数 默认是1 | integer(int32) |        |
| status          | 是否有效               | integer(int32) |        |
| stuAnswer       | 学生的答案             | string         |        |

**知识点**

| 参数名称 | 参数说明 | 类型           | schema |
| :------- | :------- | :------------- | :----- |
| id       | 知识点Id | integer(int32) |        |
| topic    | 知识点   | string         |        |

**响应状态**:

| 状态码 | 说明         | schema               |
| :----- | :----------- | :------------------- |
| 200    | OK           | 返回的结果«考试信息» |
| 401    | Unauthorized |                      |
| 403    | Forbidden    |                      |
| 404    | Not Found    |                      |

## doSubmit

**接口描述**:

**接口地址**:`/api/exercise/submit`

**请求方式**：`POST`

**consumes**:`["application/json"]`

**produces**:`["*/*"]`

**请求示例**：

```json
{
    "examId": "",
    "questionAnswers": [
        {
            "questionId": "",
            "stuAnswer": ""
        }
    ],
    "totalTime": 0
}
```

**请求参数**：

| 参数名称    | 参数说明    | in   | 是否必须 | 数据类型   | schema     |
| :---------- | :---------- | :--- | :------- | :--------- | :--------- |
| submitParam | submitParam | body | true     | 提交的参数 | 提交的参数 |

**schema属性说明**

**提交的参数**

| 参数名称        | 参数说明               | in   | 是否必须 | 数据类型       | schema     |
| :-------------- | :--------------------- | :--- | :------- | :------------- | :--------- |
| examId          | 考试的ID               | body | false    | string         |            |
| questionAnswers | 学生回答问题的答案数组 | body | false    | array          | 学生的答案 |
| totalTime       | 答题总用时             | body | false    | integer(int32) |            |

**学生的答案**

| 参数名称   | 参数说明             | in   | 是否必须 | 数据类型 | schema |
| :--------- | :------------------- | :--- | :------- | :------- | :----- |
| questionId | 题目Id               | body | false    | string   |        |
| stuAnswer  | 学生给的这个题的答案 | body | false    | string   |        |

**响应示例**:

```json
{
    "code": 0,
    "data": {},
    "msg": "",
    "success": true
}
```

**响应参数**:

| 参数名称 | 参数说明   | 类型           | schema         |
| :------- | :--------- | :------------- | :------------- |
| code     | 状态码     | integer(int32) | integer(int32) |
| data     | 返回的数据 | object         |                |
| msg      | 返回的信息 | string         |                |
| success  | 是否成功   | boolean        |                |

**响应状态**:

| 状态码 | 说明         | schema     |
| :----- | :----------- | :--------- |
| 200    | OK           | 返回的结果 |
| 201    | Created      |            |
| 401    | Unauthorized |            |
| 403    | Forbidden    |            |
| 404    | Not Found    |            |

# get-question-controller

## selectRandomQuestion

**接口描述**:

**接口地址**:`/api/exercise/random`

**请求方式**：`POST`

**consumes**:`["application/json"]`

**produces**:`["*/*"]`

**请求示例**：

```json
{
    "questionNum": 0
}
```

**请求参数**：

| 参数名称    | 参数说明    | in   | 是否必须 | 数据类型       | schema         |
| :---------- | :---------- | :--- | :------- | :------------- | :------------- |
| randomParam | randomParam | body | true     | 随机组卷的参数 | 随机组卷的参数 |

**schema属性说明**

**随机组卷的参数**

| 参数名称    | 参数说明 | in   | 是否必须 | 数据类型       | schema |
| :---------- | :------- | :--- | :------- | :------------- | :----- |
| questionNum | 题目数量 | body | false    | integer(int32) |        |

**响应示例**:

```json
{
    "code": 0,
    "data": {
        "examId": "",
        "examTime": "",
        "questions": [
            {
                "analyse": "",
                "ansNum": 0,
                "answer": "",
                "optionA": "",
                "optionB": "",
                "optionC": "",
                "optionD": "",
                "optionE": "",
                "optionF": "",
                "optionG": "",
                "questionContent": "",
                "questionId": "",
                "questionTopics": [
                    {
                        "id": 0,
                        "topic": ""
                    }
                ],
                "score": 0,
                "status": 0,
                "stuAnswer": ""
            }
        ],
        "size": 0,
        "totalPoints": 0
    },
    "msg": "",
    "success": true
}
```

**响应参数**:

| 参数名称 | 参数说明   | 类型           | schema         |
| :------- | :--------- | :------------- | :------------- |
| code     | 状态码     | integer(int32) | integer(int32) |
| data     | 返回的数据 | 考试卷         | 考试卷         |
| msg      | 返回的信息 | string         |                |
| success  | 是否成功   | boolean        |                |

**schema属性说明**

**考试卷**

| 参数名称    | 参数说明 | 类型           | schema                   |
| :---------- | :------- | :------------- | :----------------------- |
| examId      | 考试ID   | string         |                          |
| examTime    | 考试时长 | string         |                          |
| questions   | 题目列表 | array          | 组卷时的返回给前端的题目 |
| size        | 题目数量 | integer(int32) |                          |
| totalPoints | 总分     | integer(int32) |                          |

**组卷时的返回给前端的题目**

| 参数名称        | 参数说明               | 类型           | schema |
| :-------------- | :--------------------- | :------------- | :----- |
| analyse         |                        | string         |        |
| ansNum          |                        | integer(int32) |        |
| answer          |                        | string         |        |
| optionA         | 题目选项A              | string         |        |
| optionB         | 题目选项B              | string         |        |
| optionC         | 题目选项C              | string         |        |
| optionD         | 题目选项D              | string         |        |
| optionE         | 题目选项E              | string         |        |
| optionF         | 题目选项F              | string         |        |
| optionG         | 题目选项G              | string         |        |
| questionContent | 题目的题干             | string         |        |
| questionId      | 题目的Id               | string         |        |
| questionTopics  |                        | array          | 知识点 |
| score           | 每个题目的分数 默认是1 | integer(int32) |        |
| status          | 是否有效               | integer(int32) |        |
| stuAnswer       | 学生的答案             | string         |        |

**知识点**

| 参数名称 | 参数说明 | 类型           | schema |
| :------- | :------- | :------------- | :----- |
| id       | 知识点Id | integer(int32) |        |
| topic    | 知识点   | string         |        |

**响应状态**:

| 状态码 | 说明         | schema             |
| :----- | :----------- | :----------------- |
| 200    | OK           | 返回的结果«考试卷» |
| 201    | Created      |                    |
| 401    | Unauthorized |                    |
| 403    | Forbidden    |                    |
| 404    | Not Found    |                    |

## selectTopicQuestion

**接口描述**:

**接口地址**:`/api/exercise/topic`

**请求方式**：`POST`

**consumes**:`["application/json"]`

**produces**:`["*/*"]`

**请求示例**：

```json
{
    "questionNum": 0,
    "topics": []
}
```

**请求参数**：

| 参数名称   | 参数说明   | in   | 是否必须 | 数据类型         | schema           |
| :--------- | :--------- | :--- | :------- | :--------------- | :--------------- |
| topicParam | topicParam | body | true     | 专题组卷时的参数 | 专题组卷时的参数 |

**schema属性说明**

**专题组卷时的参数**

| 参数名称    | 参数说明   | in   | 是否必须 | 数据类型       | schema |
| :---------- | :--------- | :--- | :------- | :------------- | :----- |
| questionNum | 题目数量   | body | false    | integer(int32) |        |
| topics      | 知识点数组 | body | false    | array          |        |

**响应示例**:

```json
{
    "code": 0,
    "data": {
        "examId": "",
        "examTime": "",
        "questions": [
            {
                "analyse": "",
                "ansNum": 0,
                "answer": "",
                "optionA": "",
                "optionB": "",
                "optionC": "",
                "optionD": "",
                "optionE": "",
                "optionF": "",
                "optionG": "",
                "questionContent": "",
                "questionId": "",
                "questionTopics": [
                    {
                        "id": 0,
                        "topic": ""
                    }
                ],
                "score": 0,
                "status": 0,
                "stuAnswer": ""
            }
        ],
        "size": 0,
        "totalPoints": 0
    },
    "msg": "",
    "success": true
}
```

**响应参数**:

| 参数名称 | 参数说明   | 类型           | schema         |
| :------- | :--------- | :------------- | :------------- |
| code     | 状态码     | integer(int32) | integer(int32) |
| data     | 返回的数据 | 考试卷         | 考试卷         |
| msg      | 返回的信息 | string         |                |
| success  | 是否成功   | boolean        |                |

**schema属性说明**

**考试卷**

| 参数名称    | 参数说明 | 类型           | schema                   |
| :---------- | :------- | :------------- | :----------------------- |
| examId      | 考试ID   | string         |                          |
| examTime    | 考试时长 | string         |                          |
| questions   | 题目列表 | array          | 组卷时的返回给前端的题目 |
| size        | 题目数量 | integer(int32) |                          |
| totalPoints | 总分     | integer(int32) |                          |

**组卷时的返回给前端的题目**

| 参数名称        | 参数说明               | 类型           | schema |
| :-------------- | :--------------------- | :------------- | :----- |
| analyse         |                        | string         |        |
| ansNum          |                        | integer(int32) |        |
| answer          |                        | string         |        |
| optionA         | 题目选项A              | string         |        |
| optionB         | 题目选项B              | string         |        |
| optionC         | 题目选项C              | string         |        |
| optionD         | 题目选项D              | string         |        |
| optionE         | 题目选项E              | string         |        |
| optionF         | 题目选项F              | string         |        |
| optionG         | 题目选项G              | string         |        |
| questionContent | 题目的题干             | string         |        |
| questionId      | 题目的Id               | string         |        |
| questionTopics  |                        | array          | 知识点 |
| score           | 每个题目的分数 默认是1 | integer(int32) |        |
| status          | 是否有效               | integer(int32) |        |
| stuAnswer       | 学生的答案             | string         |        |

**知识点**

| 参数名称 | 参数说明 | 类型           | schema |
| :------- | :------- | :------------- | :----- |
| id       | 知识点Id | integer(int32) |        |
| topic    | 知识点   | string         |        |

**响应状态**:

| 状态码 | 说明         | schema             |
| :----- | :----------- | :----------------- |
| 200    | OK           | 返回的结果«考试卷» |
| 201    | Created      |                    |
| 401    | Unauthorized |                    |
| 403    | Forbidden    |                    |
| 404    | Not Found    |                    |

# login-controller

## doLogin

**接口描述**:

**接口地址**:`/api/login`

**请求方式**：`POST`

**consumes**:`["application/json"]`

**produces**:`["*/*"]`

**请求示例**：

```json
{
    "account": "",
    "identity": "",
    "nickName": "",
    "password": ""
}
```

**请求参数**：

| 参数名称   | 参数说明     | in   | 是否必须 | 数据类型 | schema   |
| :--------- | :----------- | :--- | :------- | :------- | :------- |
| loginParam | 这是登录参数 | body | true     | 登录参数 | 登录参数 |

**schema属性说明**

**登录参数**

| 参数名称 | 参数说明 | in   | 是否必须 | 数据类型 | schema |
| :------- | :------- | :--- | :------- | :------- | :----- |
| account  | 账户名   | body | false    | string   |        |
| identity | 身份     | body | false    | string   |        |
| nickName | 用户昵称 | body | false    | string   |        |
| password | 密码     | body | false    | string   |        |

**响应示例**:

```json
{
    "code": 0,
    "data": {
        "token": ""
    },
    "msg": "",
    "success": true
}
```

**响应参数**:

| 参数名称 | 参数说明   | 类型           | schema         |
| :------- | :--------- | :------------- | :------------- |
| code     | 状态码     | integer(int32) | integer(int32) |
| data     | 返回的数据 | 返回的token    | 返回的token    |
| msg      | 返回的信息 | string         |                |
| success  | 是否成功   | boolean        |                |

**schema属性说明**

**返回的token**

| 参数名称 | 参数说明 | 类型   | schema |
| :------- | :------- | :----- | :----- |
| token    |          | string |        |

**响应状态**:

| 状态码 | 说明         | schema                  |
| :----- | :----------- | :---------------------- |
| 200    | OK           | 返回的结果«返回的token» |
| 201    | Created      |                         |
| 401    | Unauthorized |                         |
| 403    | Forbidden    |                         |
| 404    | Not Found    |                         |

# logout-controller

## doLogout

**接口描述**:

**接口地址**:`/api/logout`

**请求方式**：`GET`

**consumes**:``

**produces**:`["*/*"]`

**请求参数**：

| 参数名称      | 参数说明      | in     | 是否必须 | 数据类型 | schema |
| :------------ | :------------ | :----- | :------- | :------- | :----- |
| Authorization | Authorization | header | true     | string   |        |

**响应示例**:

```json
{
    "code": 0,
    "data": {},
    "msg": "",
    "success": true
}
```

**响应参数**:

| 参数名称 | 参数说明   | 类型           | schema         |
| :------- | :--------- | :------------- | :------------- |
| code     | 状态码     | integer(int32) | integer(int32) |
| data     | 返回的数据 | object         |                |
| msg      | 返回的信息 | string         |                |
| success  | 是否成功   | boolean        |                |

**响应状态**:

| 状态码 | 说明         | schema     |
| :----- | :----------- | :--------- |
| 200    | OK           | 返回的结果 |
| 401    | Unauthorized |            |
| 403    | Forbidden    |            |
| 404    | Not Found    |            |

# register-controller

## doRegisterManager

**接口描述**:

**接口地址**:`/api/register/manager`

**请求方式**：`POST`

**consumes**:`["application/json"]`

**produces**:`["*/*"]`

**请求示例**：

```json
{
    "account": "",
    "nickName": "",
    "password": "",
    "remark": "",
    "userState": ""
}
```

**请求参数**：

| 参数名称      | 参数说明      | in   | 是否必须 | 数据类型           | schema             |
| :------------ | :------------ | :--- | :------- | :----------------- | :----------------- |
| registerParam | registerParam | body | true     | 添加用户所用的参数 | 添加用户所用的参数 |

**schema属性说明**

**添加用户所用的参数**

| 参数名称  | 参数说明                              | in   | 是否必须 | 数据类型 | schema |
| :-------- | :------------------------------------ | :--- | :------- | :------- | :----- |
| account   | 新用户的账号                          | body | false    | string   |        |
| nickName  | 新用户的名称                          | body | false    | string   |        |
| password  | 新用户的密码                          | body | false    | string   |        |
| remark    | 用户备注                              | body | false    | string   |        |
| userState | 用户状态码，正常是1，禁用是0，默认是1 | body | false    | string   |        |

**响应示例**:

```json
{
    "code": 0,
    "data": {},
    "msg": "",
    "success": true
}
```

**响应参数**:

| 参数名称 | 参数说明   | 类型           | schema         |
| :------- | :--------- | :------------- | :------------- |
| code     | 状态码     | integer(int32) | integer(int32) |
| data     | 返回的数据 | object         |                |
| msg      | 返回的信息 | string         |                |
| success  | 是否成功   | boolean        |                |

**响应状态**:

| 状态码 | 说明         | schema     |
| :----- | :----------- | :--------- |
| 200    | OK           | 返回的结果 |
| 201    | Created      |            |
| 401    | Unauthorized |            |
| 403    | Forbidden    |            |
| 404    | Not Found    |            |

## doRegisterStu

**接口描述**:

**接口地址**:`/api/register/student`

**请求方式**：`POST`

**consumes**:`["application/json"]`

**produces**:`["*/*"]`

**请求示例**：

```json
{
    "account": "",
    "nickName": "",
    "password": "",
    "remark": "",
    "userState": ""
}
```

**请求参数**：

| 参数名称      | 参数说明      | in   | 是否必须 | 数据类型           | schema             |
| :------------ | :------------ | :--- | :------- | :----------------- | :----------------- |
| registerParam | registerParam | body | true     | 添加用户所用的参数 | 添加用户所用的参数 |

**schema属性说明**

**添加用户所用的参数**

| 参数名称  | 参数说明                              | in   | 是否必须 | 数据类型 | schema |
| :-------- | :------------------------------------ | :--- | :------- | :------- | :----- |
| account   | 新用户的账号                          | body | false    | string   |        |
| nickName  | 新用户的名称                          | body | false    | string   |        |
| password  | 新用户的密码                          | body | false    | string   |        |
| remark    | 用户备注                              | body | false    | string   |        |
| userState | 用户状态码，正常是1，禁用是0，默认是1 | body | false    | string   |        |

**响应示例**:

```json
{
    "code": 0,
    "data": {},
    "msg": "",
    "success": true
}
```

**响应参数**:

| 参数名称 | 参数说明   | 类型           | schema         |
| :------- | :--------- | :------------- | :------------- |
| code     | 状态码     | integer(int32) | integer(int32) |
| data     | 返回的数据 | object         |                |
| msg      | 返回的信息 | string         |                |
| success  | 是否成功   | boolean        |                |

**响应状态**:

| 状态码 | 说明         | schema     |
| :----- | :----------- | :--------- |
| 200    | OK           | 返回的结果 |
| 201    | Created      |            |
| 401    | Unauthorized |            |
| 403    | Forbidden    |            |
| 404    | Not Found    |            |

## doRegisterTeacher

**接口描述**:

**接口地址**:`/api/register/teacher`

**请求方式**：`POST`

**consumes**:`["application/json"]`

**produces**:`["*/*"]`

**请求示例**：

```json
{
    "account": "",
    "nickName": "",
    "password": "",
    "remark": "",
    "userState": ""
}
```

**请求参数**：

| 参数名称      | 参数说明      | in   | 是否必须 | 数据类型           | schema             |
| :------------ | :------------ | :--- | :------- | :----------------- | :----------------- |
| registerParam | registerParam | body | true     | 添加用户所用的参数 | 添加用户所用的参数 |

**schema属性说明**

**添加用户所用的参数**

| 参数名称  | 参数说明                              | in   | 是否必须 | 数据类型 | schema |
| :-------- | :------------------------------------ | :--- | :------- | :------- | :----- |
| account   | 新用户的账号                          | body | false    | string   |        |
| nickName  | 新用户的名称                          | body | false    | string   |        |
| password  | 新用户的密码                          | body | false    | string   |        |
| remark    | 用户备注                              | body | false    | string   |        |
| userState | 用户状态码，正常是1，禁用是0，默认是1 | body | false    | string   |        |

**响应示例**:

```json
{
    "code": 0,
    "data": {},
    "msg": "",
    "success": true
}
```

**响应参数**:

| 参数名称 | 参数说明   | 类型           | schema         |
| :------- | :--------- | :------------- | :------------- |
| code     | 状态码     | integer(int32) | integer(int32) |
| data     | 返回的数据 | object         |                |
| msg      | 返回的信息 | string         |                |
| success  | 是否成功   | boolean        |                |

**响应状态**:

| 状态码 | 说明         | schema     |
| :----- | :----------- | :--------- |
| 200    | OK           | 返回的结果 |
| 201    | Created      |            |
| 401    | Unauthorized |            |
| 403    | Forbidden    |            |
| 404    | Not Found    |            |

# 

|      |      |      |
| :--- | :--- | :--- |
|      |      |      |
|      |      |      |
|      |      |      |
|      |      |      |