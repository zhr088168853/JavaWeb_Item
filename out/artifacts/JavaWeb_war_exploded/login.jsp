<%@ page language="java" import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="com.DBCon" %>

<html>
<head>
    <title>登录信息确认</title>
</head>
<body>
<%
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        //定义变量用于接收表单的值
        String identity = request.getParameter("identity");//身份
        String username = request.getParameter("username");//账号
        String password = request.getParameter("password");//密码
        String sno = request.getParameter("sno");//学号
        if (identity.equals("超级管理员")){
            try {
                Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
                Statement stmt = conn.createStatement ();//创建Statement对象
                String sql = "select * from user1 where username='" + username + "' and password = '" + password + "'";//定义SQL语句
                ResultSet rs = stmt.executeQuery(sql); //执行SQL语句，返回查询结果集
                if(rs.next()){ //如果记录集非空，表明有匹配的用户名和密码，登陆成功
                    %>
                      <jsp:forward page="super_manager.jsp"/>
    <%
                }
                else    //否则登录失败
                {
                      response.setHeader("refresh","3;URL=index.jsp") ;
    %>
                <script type="text/javascript">
                    alert("用户名或密码错误！");
                </script>
                <center>
                    <font  size="30px">
                    用户名或密码有误，3秒后跳转回登陆页面！！！<br>
                    如果没有跳转，请按<a href="index.jsp">这里</a>！！！
                    </font>
                </center>
    <%
                }
                rs.close ( );
                stmt.close ( );
                conn.close ( );
            }catch (SQLException e){
                e.printStackTrace();
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
        else if(identity.equals("宿舍管理员")){
                    try {
                        Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
                        Statement stmt = conn.createStatement ();//创建Statement对象
                        String sql = "select * from user2 where username='" + username + "' and password = '" + password + "'";//定义SQL语句
                        ResultSet rs = stmt.executeQuery(sql); //执行SQL语句，返回查询结果集
                        if(rs.next()){ //如果记录集非空，表明有匹配的用户名和密码，登陆成功
//                            response.sendRedirect("dorm_manager.jsp");     //账号和密码都正确则跳转页面
    %>
                        <jsp:forward page="dorm_manager.jsp"></jsp:forward>
    <%
                        }
                        else    //否则登录失败
                        {
                            response.setHeader("refresh","3;URL=index.jsp") ;
             %>
                <script type="text/javascript">
                    alert("用户名或密码错误！");
                </script>
                <center>
                    <font  size="30px">
                        用户名或密码有误，3秒后跳转回登陆页面！！！<br>
                        如果没有跳转，请按<a href="index.jsp">这里</a>！！！
                    </font>
                </center>
    <%
                }
                rs.close ( );
                stmt.close ( );
                conn.close ( );
            }catch (SQLException e){
                e.printStackTrace();
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
        else if(identity.equals("学生")){
                    try {
                        Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
                        Statement stmt = conn.createStatement ();//创建Statement对象
                        String sql = "select sno,stu_name from student where sno='" + sno + "'";   //定义SQL语句
                        ResultSet rs = stmt.executeQuery(sql); //执行SQL语句，返回查询结果集
                        if(rs.next()){      //如果记录集非空，表明有匹配的学号，登陆成功
                            String stu_name = rs.getString("stu_name");
                            request.setAttribute("stu_name", stu_name);     //将姓名也用做参数传递
                    %>
                        <jsp:forward page="student.jsp"></jsp:forward>
    <%
                        }
                        else    //否则登录失败
                        {
                            response.setHeader("refresh","3;URL=index.jsp") ;
    %>
                <script type="text/javascript">
                    alert("学号不存在！");
                </script>
                <center>
                    <font  size="20px">
                        学号不存在，3秒后跳转回登陆页面！！！<br>
                        如果没有跳转，请按<a href="index.jsp">这里</a>！！！
                    </font>
                </center>
    <%
                }
                rs.close ( );
                stmt.close ( );
                conn.close ( );
            }catch (SQLException e){
                e.printStackTrace();
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }
    %>
</body>
</html>