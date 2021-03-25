<%--
  Created by IntelliJ IDEA.
  User: ZY
  Date: 2020/10/30
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
  <title>Java Web 应用开发项目实践</title>
</head>

<body>
<form action="login.jsp" method="post" id="myform">
  <table align="center" background="Images/login.jpg" width="100%" height="100%">
    <tr align="center">
      <td rowspan="4" colspan="2">
        <table align="center" cellspacing="20px" cellpadding="5px">
          <tr align="center" style="display: block;">
            <td>选择您的身份</td>
            <td>
              <select name="identity" title="身份" onkeydown="KeyEnter()"
                      onchange="change(this.value)">      <!--当下拉列表框选择变化时调用onchange()函数-->
                <option value="请选择">请选择</option>
                <option value="超级管理员">超级管理员</option>
                <option value="宿舍管理员">宿舍管理员</option>
                <option value="学生">学生</option>
              </select>
            </td>
          </tr>
          <tr align="center" id="zhr1" style="display: block;">
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;账号</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="username" size="10"
                                                           title="账号" onkeydown="KeyEnter()"></td>
          </tr>
          <tr align="center" id="zhr2" style="display: block;">
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password" size="10"
                                                           title="密码" onkeydown="KeyEnter()"></td>
          </tr>
          <tr align="center" id="zhr3" style="display: none;">
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="sno" size="10"
                                                           title="学号" onkeydown="KeyEnter()"></td>
          </tr>
          <tr align="center" style="display: block;">
            <td><input type="button" value="登陆" onclick="LoginCheck()"></td>
            <td><input type="reset" value="重置"></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
<script type="text/javascript">
  var value = "";
  function change(value1) {
    value = value1;
    if (value === "学生") {
      document.getElementById("zhr1").style.display = 'none';
      document.getElementById("zhr2").style.display = 'none';
      document.getElementById("zhr3").style.display = 'block';
    }
    else {
      document.getElementById("zhr1").style.display = 'block';
      document.getElementById("zhr2").style.display = 'block';
      document.getElementById("zhr3").style.display = 'none';
    }
  }

  function KeyEnter() {     //按下回车键时调用此函数
    if (event.keyCode === 13) {       //回车键的按键码为13
      LoginCheck();
    }
  }

  function LoginCheck() {    // 检查表单元素的值是否为空
    var myform = document.getElementById("myform");//获取表单元素
    if (value === "学生") {   //如果下拉列表框选择的是"学生"
      if (myform.elements[3].value === "") { //若学号为空
        alert(myform.elements[3].title + "不能为空");//则提示用户相应信息
        myform.elements[3].focus();     //聚焦元素，使用户重新输入
        return;
      }
      myform.submit();      //学号不为空才提交
    }
    else {  //如果下拉列表框选择的不是学生
        //myform.length是指表单中有多少个input元素和select元素，此处为6
      for (var i = 0; i < myform.length - 3; i++) {//只需检查前三个元素(下拉列表框、账号、密码)是否为空
        if (myform.elements[i].value === "" || myform.elements[i].value === "请选择") {//检查表单的前三个元素是否为空
          alert(myform.elements[i].title + "不能为空");
          myform.elements[i].focus();     //聚焦元素
          return;
        }
      }
      myform.submit();// 表单中最后input提交标签用的是button类型，首先不提交表单，在js判断表单项都不为空时 再提交表单，调用submit()函数提交表单。
    }
  }
</script>
</body>
</html>

