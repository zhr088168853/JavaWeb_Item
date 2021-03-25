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
    <title>
        宿舍楼信息操作页面
    </title>
    <style type="text/css">
        .Home{
            width: 60px;
            height: 40px;
            border: 0px;
            border-radius: 25%;
        }
    </style>
</head>
<body bgcolor="#7fffd4">
    <p align="center" style="font-size: 40px;color: orange;">
        <strong>宿舍楼信息</strong>
    <table align="right" cellspaing="0px">
        <tr>
            <td>
                <button class="Home" onclick="window.location.href='../index.jsp'">Home</button>
            </td>
        </tr>
    </table>
    </p>
<center>
<form action="Display.jsp" method="post">
    请输入查询内容：<input type="text" name="keyword" />&nbsp;&nbsp;
                   <input type="submit" value="查询" />
</form>
</center>
<hr color="pink">
<table width="1100px" border="1" align="center" cellpadding="10px">
    <tr align="center">
        <td width=100><font size=4><strong>宿舍楼号</strong> </font></td>
        <td width=200><font size=4><strong>宿舍电话</strong> </font></td>
        <td width=130><font size=4><strong>宿舍层数</strong> </font></td>
        <td width=260><font size=4><strong>宿舍地址</strong> </font></td>
        <td width=260><font size=4><strong>宿舍口号</strong> </font></td>
        <td width=150><font size=4><strong>操作</strong> </font></td>
    </tr>
    <%
        try {
            Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
            request.setCharacterEncoding("UTF-8");
            String keyword = request.getParameter("keyword");
            // Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String sql = null;
            boolean flag = true;
            if (keyword == null) {//刚跳转到此页面时（即还没输入内容点击查询按钮）将数据库的Name,Title,Content字段查询出来
                sql = "select dorm_num,dorm_tel,dorm_floor,dorm_address,dorm_word from dorm ";//避免将默认的id字段也选择出来，所以要指定字段选择出来
                pstmt = conn.prepareStatement(sql);
            }
            else {    //输入内容点击查询按钮执行
                sql = "select dorm_num,dorm_tel,dorm_floor,dorm_address,dorm_word from dorm where dorm_num like ? OR dorm_tel like ? OR dorm_floor like ? OR dorm_address like ? OR dorm_word like ?";//将符合查询条件的记录的Name,Title,Content选择出来
                pstmt = conn.prepareStatement(sql);
                keyword="%" + keyword + "%";        //若包含输入的内容都可以将相应的记录查询出来（模糊查询）
                pstmt.setString(1, keyword );
                pstmt.setString(2, keyword );
                pstmt.setString(3, keyword );
                pstmt.setString(4, keyword );
                pstmt.setString(5, keyword );
            }
            rs = pstmt.executeQuery();
            if(!(rs.next()))
            {
                flag = false;
    %>
            <script type="text/javascript">
                alert("没有可查询的信息！");
            </script>
    <%
        }
            int intPageSize; //一页显示的记录数
            int intRowCount; //记录的总数
            int intPageCount; //总页数
            int intPage; //待显示的页码
            String strPage;
            int i;
            intPageSize = 5; //设置一页显示5条记录,当超过5条记录时自动翻页显示
            strPage = request.getParameter("page");//取得待显示的页码
            if (strPage == null) //判断strPage是否等于null,如果是，显示第一页数据
            {
                intPage = 1;
            } else {
                intPage = java.lang.Integer.parseInt(strPage); //将字符串转换为整型
            }
            if (intPage < 1) {
                intPage = 1;
            }
            rs.last();//获取记录总数
            intRowCount = rs.getRow();
            intPageCount = (intRowCount + intPageSize - 1) / intPageSize; //计算机总页数
            if (intPage > intPageCount)
                intPage = intPageCount; //调整待显示的页码
            if (intPageCount > 0) {
                rs.absolute((intPage - 1) * intPageSize + 1); //将记录指针定位到待显示页的第一条记录上
            }
            //下面用于显示数据
            i = 0;
        if (flag==true){
            while (i < intPageSize && !rs.isAfterLast()) {
    %>
    <tr align="center">
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td>
            <a href="messageContent.jsp">增加</a>|
            <a href="DeleteMessage.jsp?name=<%=rs.getString(1)%>">删除</a>|
            <a href="UpdateMessage.jsp?name=<%=rs.getString(1)%>">修改</a>
        </td>
    </tr>
    <%
            rs.next();
                i++;
            }
        }
        rs.close();//关闭连接、释放资源
        pstmt.close();
        conn.close();
    %>
</table>
<div align="center">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 共<%=intRowCount%>个记录，分<%=intPageCount%>页显示，当前页是：第<%=intPage%>页
    &nbsp; &nbsp; &nbsp; &nbsp; <a href="Display.jsp">|主页|</a>
    <%
        for (int j = 1; j <= intPageCount; j++) {
            out.print("&nbsp;&nbsp;<a href='Display.jsp?page=" + j + "'>" + j + "</a>");
        }
    %>
    <center>
        <br/>
        <a href="../Room/room_manage.jsp">宿舍房间信息管理</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="../DormManager/man_manage.jsp">宿舍管理员信息管理</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="../student/stu_manage.jsp">入住学生信息管理</a>
    </center>
</div>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
