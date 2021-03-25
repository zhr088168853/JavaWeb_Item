<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="com.DBCon" %>
<html>
     <head>
        <title>
            删除宿舍楼信息
        </title>
    </head>
  <body>
   <%!
	PreparedStatement pstmt = null;
	String sql = null;
	boolean flag = false;
	%>
 <%
       request.setCharacterEncoding("UTF-8");
       String name=request.getParameter("name");
       try{
            Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
            sql = "delete from dorm where dorm_num =?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.executeUpdate();  
            pstmt.close();
            conn.close();
            flag = true;    //若删除成功则flag=true
       }catch(Exception e){
          e.printStackTrace();
       }
    %> 
    <%
       if(flag){
          response.setHeader("refresh","3;URL=Display.jsp");
          %>
        <center>   
           您删除成功！！<br/>
           3秒钟自动跳转到信息管理页面！！<br/>
           如果没有跳转，请点击<a href="Display.jsp">这里</a>！！
        </center>
          <% 
       }else{
          response.setHeader("refresh","3;URL=Display.jsp");
          %>
        <center>   
           您删除失败！！<br/>
           3秒钟自动跳转到信息管理页面！！<br/>
           如果没有跳转，请点击<a href="Display.jsp">这里</a>！！
        </center>
          <% 
       }
     %>
  </body>
</html>