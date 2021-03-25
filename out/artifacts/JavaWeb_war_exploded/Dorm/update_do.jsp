<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="com.DBCon" %>
<html>
<head>
    <title>
        修改宿舍楼信息
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
    String dorm_num=request.getParameter("dorm_num").trim();            //获取到新修改的值
    String dorm_tel = request.getParameter("dorm_tel").trim() ;       //获取到新修改的值
    String dorm_floor = request.getParameter("dorm_floor").trim() ;   //获取到新修改的值
    String dorm_address = request.getParameter("dorm_address").trim() ;       //获取到新修改的值
    String dorm_word = request.getParameter("dorm_word").trim() ;   //获取到新修改的值
    String oldname = request.getParameter("oldname").trim() ;   //获取修改前的name值
                // 更新表中的数据
    if (dorm_num.equals("") | dorm_tel.equals("") | dorm_floor.equals("")  | dorm_address.equals("") | dorm_word.equals("")) {
        %>
        <script type="text/javascript">
            alert("请填写完整的信息！");
        </script>
        <center>
            修改信息填写不完整！，3秒后跳转到信息列表页！！！<br>
            如果没有跳转，请按<a href="Display.jsp">这里</a>！！！
        </center>
<%
        response.setHeader("refresh", "3;URL=Display.jsp");
    }
    else {
                String sql = "UPDATE dorm set dorm_num=?,dorm_tel=?,dorm_floor=?,dorm_address=?,dorm_word=? WHERE dorm_num=?";
                try {
                    Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, dorm_num);
                    pstmt.setString(2, dorm_tel);
                    pstmt.setString(3, dorm_floor);
                    pstmt.setString(4, dorm_address);
                    pstmt.setString(5, dorm_word);
                    pstmt.setString(6, oldname);
                    pstmt.executeUpdate();//若用prepareStatement，则executeUpdate()一定不能传参
                    pstmt.close();
                    conn.close();
                    // 如果修改成功，则肯定能执行到此段代码,若删除成功则flag=true
                    flag = true;
                } catch (SQLException e) {//由于宿舍唯一，修改时若宿舍号重复则提示相应的错误
    %>
                    <script type="text/javascript">
                            alert("宿舍号已存在！");
                    </script>
                    <center>
                            宿舍号已存在！，3秒后跳转到信息列表页！！！<br>
                            如果没有跳转，请按<a href="Display.jsp">这里</a>！！！
                    </center>
<%
    }
    }
    response.setHeader("refresh","3;URL=Display.jsp") ;
    if(flag)
    {
%>
<center>
    信息修改成功，3秒后跳转到信息列表页！！！<br>
    如果没有跳转，请按<a href="Display.jsp">这里</a>！！！
</center>
<%
}
    %>
</body>
</html>