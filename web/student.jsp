<%--
  Created by IntelliJ IDEA.
  User: ZY
  Date: 2020/11/1
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>
<%@ page import="com.DBCon" %>
<html>
<head>
    <title>学生查看入住学生信息</title>
    <style type="text/css">
        .submit{
            width: 100px;
            height: 40px;
            border: 0px;
            background: aqua;
        }
    </style>
</head>
<body bgcolor="#7fffd4">
            <%
                String sno = request.getParameter("sno");
                String name = (String)request.getAttribute("stu_name");
            %>
<table width="950px" border="1" align="center" cellpadding="10px" cellspacing="5px">
    <caption><font size=6 color="orange"><strong><%=name%>的入住信息</strong></font></caption>
    <tr align="center">
        <td width=150><strong>学号</strong></td>
        <td width=100><strong>姓名</strong></td>
        <td width=100><strong>班级</strong></td>
        <td width=100><strong>宿舍房号</strong></td>
        <td width=100><strong>宿舍舍长</strong></td>
        <td width=100><strong>报修物品</strong></td>
        <td width=200><strong>请假时间</strong></td>
        <td width=200><strong>晚归时间</strong></td>
    </tr>
    <%
        try {
            String room_num=null;
            String room_man=null;
            Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
            Statement stat = conn.createStatement();
            String sql1 = "select room_num from student where sno='"+sno+"'";
            ResultSet rs1 = stat.executeQuery(sql1);
            while (rs1.next()){
                room_num = rs1.getString("room_num");
            }
            String sql2= "select room_man from room where room_num='"+room_num+"'";
            ResultSet rs2 = stat.executeQuery(sql2);
            while (rs2.next()){
                room_man = rs2.getString("room_man");
            }
            String sql3 = "select sno,stu_name,stu_class,room_num,maintain,off_time,late_time from student where sno='"+sno+"'";


            ResultSet rs3 = stat.executeQuery(sql3);
            if (rs3.next()){
    %>
    <tr align="center">
        <td><%=rs3.getString(1)%></td>
        <td><%=rs3.getString(2)%></td>
        <td><%=rs3.getString(3)%></td>
        <td><%=rs3.getString(4)%></td>
        <td><%=room_man%></td>
        <td><%=rs3.getString(5)%></td>
        <td><%=rs3.getString(6)%></td>
        <td><%=rs3.getString(7)%></td>
    </tr>
    <%
        }
        rs1.close();//关闭连接、释放资源
        rs2.close();
        rs3.close();
        stat.close();
        conn.close();
    %>
</table>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<br>
<center>
    <form action="index.jsp" method="post">
        <input type="submit" value="退出" class="submit">
    </form>
</center>
</body>
</html>
