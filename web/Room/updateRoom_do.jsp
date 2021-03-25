<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="com.DBCon" %>
<html>
<head>
    <title>
        修改宿舍房间信息
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
    String room_num=request.getParameter("room_num").trim();            //获取到新修改的值
    String room_tel = request.getParameter("room_tel").trim() ;       //获取到新修改的值
    String room_people = request.getParameter("room_people").trim() ;   //获取到新修改的值
    String room_man = request.getParameter("room_man").trim() ;       //获取到新修改的值
    String oldname = request.getParameter("oldname").trim() ;   //获取修改前的name值
    // 更新表中的数据
    if (room_num.equals("") | room_tel.equals("") | room_people.equals("")  | room_man.equals("")) {
%>
        <script type="text/javascript">
            alert("请填写完整的信息！");
        </script>
        <center>
            修改信息填写不完整！，3秒后跳转到信息列表页！！！<br>
            如果没有跳转，请按<a href="room_manage.jsp">这里</a>！！！
        </center>
<%
        response.setHeader("refresh", "3;URL=room_manage.jsp");
}
else {
    String sql = "UPDATE room set room_num=?,room_tel=?,room_people=?,room_man=? WHERE room_num=?";
    try {
        Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, room_num);
        pstmt.setString(2, room_tel);
        pstmt.setString(3, room_people);
        pstmt.setString(4, room_man);
        pstmt.setString(5, oldname);
        pstmt.executeUpdate();//若用prepareStatement，则executeUpdate()一定不能传参
        pstmt.close();
        conn.close();
        // 如果修改成功，则肯定能执行到此段代码,若删除成功则flag=true
        flag = true;
    } catch (SQLException e) {      //修改时若房间号重复则提示相应的错误
%>
            <script type="text/javascript">
                alert("房间号已存在！");
            </script>
            <center>
                房间号已存在！，3秒后跳转到信息列表页！！！<br>
                如果没有跳转，请按<a href="room_manage.jsp">这里</a>！！！
            </center>
<%
        }
    }
    response.setHeader("refresh","3;URL=room_manage.jsp") ;
    if(flag)
    {
%>
<center>
    信息修改成功，3秒后跳转到信息列表页！！！<br>
    如果没有跳转，请按<a href="room_manage.jsp">这里</a>！！！
</center>
<%
    }
%>
</body>
</html>