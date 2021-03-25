<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="com.DBCon" %>

<html>
<head>
    <title>
        调整学生宿舍
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
    String sno = request.getParameter("sno").trim();
    String num = request.getParameter("room_num").trim();
%>

<form action="updateStu_do.jsp" method="post">
    <table align="center" width="100%" height="100%" background="../Images/zhang.jpg">
        <tr align="center">
            <td rowspan="4" colspan="2">
                <table align="center" cellspacing="20px">
                    <caption><strong>调整学生宿舍</strong></caption>
                    <tr align="center">
                        <td>原宿舍房号：</td>
                        <td><input type="text" readonly="readonly" contenteditable="false" name="room_num" value="<%=num%>" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>新宿舍房号：</td>
                        <td><input type="text" name="new_num" size="20"></td>
                    </tr>
                    <tr align="center">
                        <input type="hidden" name="oldsno" value="<%=sno%>">
                        <input type="hidden" name="oldnum" value="<%=num%>">
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