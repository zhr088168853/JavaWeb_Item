<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="com.DBCon" %>
<html>
<head>
    <title>
        增加宿舍楼信息
    </title>
</head>
<body>
<%
    try {
        boolean flag=true;
        request.setCharacterEncoding("UTF-8");//在文件的开头加上这句代码
        Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
        Statement stat = conn.createStatement();

        String dorm_num = request.getParameter("dorm_num").trim();//新增加的宿舍号
        String dorm_tel = request.getParameter("dorm_tel").trim();
        String dorm_floor = request.getParameter("dorm_floor").trim();
        String dorm_address = request.getParameter("dorm_address").trim();
        String dorm_word = request.getParameter("dorm_word").trim();

        String sql ="select dorm_num from dorm where dorm_num='"+dorm_num+"'";
        ResultSet rs = stat.executeQuery(sql);
        while (rs.next()){
            String num = rs.getString(1);
            if (num.equals(dorm_num)){  //由于dorm_num唯一，若dorm_num在数据库中已经存在，则提示错误
                flag=false;
               %>
            <script type="text/javascript">
                alert("宿舍号已存在！");
            </script>
            <center>
                宿舍号已存在！，3秒后跳转到信息列表页！！！<br>
                如果没有跳转，请按<a href="Display.jsp">这里</a>！！！
            </center>
<%
            response.setHeader("refresh", "3;URL=Display.jsp");
            }
        }

        if (dorm_num.equals("") | dorm_tel.equals("") | dorm_floor.equals("")  | dorm_address.equals("") | dorm_word.equals("")) {  //填写信息不能为空
            response.sendRedirect("messageContent.jsp");
        }
        else if(flag) {         //增加记录
           %>
            <center>
                信息增加成功，3秒后跳转到信息列表页！！！<br>
                如果没有跳转，请按<a href="Display.jsp">这里</a>！！！
            </center>
<%
            sql = "insert into dorm(dorm_num,dorm_tel,dorm_floor,dorm_address,dorm_word)values('" + dorm_num + "','" + dorm_tel + "','" + dorm_floor + "','" + dorm_address + "','" + dorm_word + "')";
            stat.executeUpdate(sql);
//        response.sendRedirect("Display.jsp");
        }
        stat.close();
        conn.close();
    } catch (Exception e) {
            e.printStackTrace();
    }
    response.setHeader("refresh", "3;URL=Display.jsp");
%>
</body>
</html>