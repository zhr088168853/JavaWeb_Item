<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="com.DBCon" %>
<html>
<head>
    <title>
        修改宿舍管理员登陆密码
    </title>
</head>
<body bgcolor="#7fffd4">
<%!
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = null;
%>
<%
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");//获取管理员的账号
    String old_pwd = request.getParameter("old_pwd");//获取管理员的原密码
%>

<form action="updateMan_do.jsp" method="post">
    <table align="center" width="100%" height="100%" background="../Images/zhang.jpg">
        <tr align="center">
            <td rowspan="4" colspan="2">
                <table align="center" cellspacing="20px">
                    <caption><strong>修改宿舍管理员登陆密码</strong></caption>
                    <tr align="center">
                        <td>原密码：</td>
                        <td><input type="text" readonly="readonly" contenteditable="false" name="old_pwd" value="<%=old_pwd%>"></td>
                    </tr>
                    <tr align="center">
                        <td>新密码：</td>
                        <td><input type="text" name="new_pwd"></td>
                    </tr>
                    <tr align="center">
                        <input type="hidden" name="username" value="<%=username%>">
                        <td><input type="submit" value="修改"></td>
                        <td><input type="reset" value="清空"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
</body>
</html>