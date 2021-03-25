<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="com.DBCon" %>
<%@page import="student.AddStu_Check" %>
<html>
<head>
    <title>
        删除入住学生信息
    </title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String sno=request.getParameter("sno").trim();
    String room_num=request.getParameter("room_num").trim();

    PreparedStatement pstmt = null;
    String sql = null;
    boolean flag = false;
    boolean zhr = AddStu_Check.getInstance().Delete_RoomNum(room_num);  //修改入住人数，使入住人数减一
    if (zhr){
        try{
            Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
            sql = "delete from student where sno =?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sno);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            flag = true;    //若删除成功则flag=true
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    else {      //若找不到宿舍房间号则返回false
%>
<center>
    删除学生的宿舍房间号不存在！
</center>
<%
    }
    if(flag){
        response.setHeader("refresh","3;URL=manager_stu.jsp");
%>
<center>
    删除入住学生信息成功！！<br/>
    3秒钟自动跳转到入住学生信息管理页面！！<br/>
    如果没有跳转，请点击<a href="manager_stu.jsp">这里</a>！！
</center>
<%
}else{
    response.setHeader("refresh","3;URL=manager_stu.jsp");
%>
<center>
    删除入住学生信息失败！！<br/>
    3秒钟自动跳转到入住学生信息管理页面！！<br/>
    如果没有跳转，请点击<a href="manager_stu.jsp">这里</a>！！
</center>
<%
    }
%>
</body>
</html>