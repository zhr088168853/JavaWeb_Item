<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.DBCon" %>
<%@ page import="student.AddStu_Check" %>
<html>
<head>
    <title>
        调整学生宿舍
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
    String new_num = request.getParameter("new_num").trim() ;
    String sno = request.getParameter("oldsno").trim() ;     //获取修改前的oldsno值
    String num = request.getParameter("oldnum").trim() ;     //获取修改前的宿舍房号
    // 更新表中的数据
    if (new_num.equals("")) {
%>
<script type="text/javascript">
    alert("请填写新宿舍号！");
</script>
<center>
    请填写新宿舍号！
</center>
<%
    response.setHeader("refresh", "3;URL=manager_stu.jsp");
}
else {
    boolean zhr2 = AddStu_Check.getInstance().CheckRoom(new_num);//检查修改后的宿舍房间号是否存在
    if (zhr2) {//修改后的宿舍房间号存在则执行操作
        boolean zhr3 = AddStu_Check.getInstance().Check_RoomNum(new_num, num);//检查修改后的宿舍房间是否住满人，没住满人则新宿舍房间号人数加1，room_num为修改后的宿舍号，oldnum为修改前的宿舍号
        if (zhr3) {//修改后的宿舍房间还没住满人则执行操作
            boolean zhr4 = AddStu_Check.getInstance().Delete_RoomNum(num);//旧宿舍房间号入住人数减1
            if (zhr4) {//旧宿舍房间入住人数减1成功才执行
                String sql = "UPDATE student set room_num=? WHERE sno=?";
                try {
                    Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, new_num);
                    pstmt.setString(2, sno);
                    pstmt.executeUpdate();//若用prepareStatement，则executeUpdate()一定不能传参
                    pstmt.close();
                    conn.close();
                    // 如果修改成功，则肯定能执行到此段代码,若删除成功则flag=true
                    flag = true;
                } catch (SQLException e) {//由于房间号唯一，若宿舍号重复则提示相应的错误
                    e.getMessage();
                }
            }
        } else {
%>
<script type="text/javascript">
    alert("修改后的宿舍房间已住满！");
</script>
<center>
    修改后的宿舍已住满！
</center>
<%
    }
} else {
%>
<script type="text/javascript">
    alert("分配的宿舍房间号不存在！");
</script>
<center>
    分配的宿舍房间号不存在！
</center>
<% response.setHeader("refresh", "3;URL=manager_stu.jsp");
}
}
    response.setHeader("refresh","3;URL=manager_stu.jsp") ;
    if(flag)
    {
%>
<center>
    信息修改成功，3秒后跳转到入住学生信息管理页面！！！<br>
    如果没有跳转，请按<a href="manager_stu.jsp">这里</a>！！！
</center>
<%
}else {
    response.setHeader("refresh","3;URL=manager_stu.jsp") ;
%>
<center>
    信息修改失败，3秒后跳转到入住学生信息管理页面！！！<br>
    如果没有跳转，请按<a href="manager_stu.jsp">这里</a>！！！
</center>
<%
    }
%>
</body>
</html>