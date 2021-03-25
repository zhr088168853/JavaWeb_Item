<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="com.DBCon" %>
<html>
<head>
    <title>
        修改宿舍管理员信息
    </title>
</head>
<body >
<%
    // 进行乱码处理
    request.setCharacterEncoding("UTF-8") ;
%>
<%!
    PreparedStatement pstmt = null ;
%>
<%
    // 声明一个boolean变量
    boolean flag = false ;
    // 接收参数
    String username=request.getParameter("username").trim();//获取到管理员的账号
    String new_pwd = request.getParameter("new_pwd").trim() ;//获取到新修改的值
    // 更新表中的数据
    if (new_pwd.equals("")) {
%>
<script type="text/javascript">
    alert("请填写新新密码！");
</script>
<center>
    新密码未填写！，3秒后跳转到管理员信息管理页面！！！<br>
    如果没有跳转，请按<a href="man_manage.jsp">这里</a>！！！
</center>
<%
    response.setHeader("refresh", "3;URL=man_manage.jsp");
}
else {
    String sql = "UPDATE manager set man_password=? WHERE man_username=?";
    try {
        Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, new_pwd);
        pstmt.setString(2, username);
        pstmt.executeUpdate();//若用prepareStatement，则executeUpdate()一定不能传参
        pstmt.close();
        conn.close();
        // 如果修改成功，则肯定能执行到此段代码,若删除成功则flag=true
        flag = true;
    } catch (SQLException e) {      //若账号重复则提示相应的错误
%>
        <script type="text/javascript">
            alert("修改密码失败！");
        </script>
        <center>
            修改密码失败！，3秒后跳转到管理员信息管理页面！！！<br>
            如果没有跳转，请按<a href="man_manage.jsp">这里</a>！！！
        </center>
<%
        }
    }
    response.setHeader("refresh","3;URL=man_manage.jsp") ;
    if(flag)
    {
%>
<center>
    密码修改成功，3秒后跳转到管理员信息管理页面！！！<br>
    如果没有跳转，请按<a href="man_manage.jsp">这里</a>！！！
</center>
<%
    }
%>
</body>
</html>