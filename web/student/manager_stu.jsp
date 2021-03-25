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
        管理员操作页面
    </title>
    <style type="text/css">
        .submit{
            width: 100px;
            height: 40px;
            border: 0px;
            background: aqua;
        }
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
    <strong>入住学生信息</strong>
<table align="right" cellspaing="0px">
    <tr>
        <td>
            <button class="Home" onclick="window.location.href='../index.jsp'">Home</button>
        </td>
    </tr>
</table>
</p>
<center>
    <table align="center" cellspacing="20px">
        <tr align="center">
            <td align="center">
                <form action="manager_stu.jsp" method="post">
                    请输入查询内容：<input type="text" name="keyword" />&nbsp;&nbsp;
                    <input type="submit" value="查询" class="submit">
                </form>
            </td>
            <td align="center">
                <form action="add_stu1.jsp" method="post">
                    <input type="submit" value="安排学生入住" class="submit">
                </form>
            </td>
        </tr>
    </table>
</center>
<hr color="pink">
<table width="1110px" border="1" align="center" cellpadding="0px" cellspacing="0px">
    <tr align="center">
        <td width=150><strong>学号</strong></td>
        <td width=100><strong>姓名</strong></td>
        <td width=100><strong>班级</strong></td>
        <td width=100><strong>宿舍房号</strong></td>
        <td width=100><strong>报修物品</strong></td>
        <td width=150><strong>请假时间</strong></td>
        <td width=150><strong>晚归时间</strong></td>
        <td width=260><strong>操作</strong></td>
    </tr>
    <%
        try {
            Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
            request.setCharacterEncoding("UTF-8");
            String keyword = request.getParameter("keyword");
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String sql = null;
            boolean flag = true;
            if (keyword == null) {//刚跳转到此页面时（即还没输入内容点击查询按钮）将数据库的Name,Title,Content字段查询出来
                sql = "select sno,stu_name,stu_class,room_num,maintain,off_time,late_time from student ";//避免将默认的id字段也选择出来，所以要指定字段选择出来
                pstmt = conn.prepareStatement(sql);
            }
            else {    //输入内容点击查询按钮执行
                sql = "select sno,stu_name,stu_class,room_num,maintain,off_time,late_time from student where sno like ? OR stu_name like ? OR stu_class like ? OR room_num like ? OR maintain like ? OR off_time like ? OR late_time like ?";//将符合查询条件的记录选择出来
                pstmt = conn.prepareStatement(sql);
                keyword="%" + keyword + "%";        //若包含输入的内容都可以将相应的记录查询出来（模糊查询）
                pstmt.setString(1, keyword );
                pstmt.setString(2, keyword );
                pstmt.setString(3, keyword );
                pstmt.setString(4, keyword );
                pstmt.setString(5, keyword );
                pstmt.setString(6, keyword );
                pstmt.setString(7, keyword );
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
        <td><%=rs.getString(6)%></td>
        <td><%=rs.getString(7)%></td>
        <td>
            <table align="center" cellspacing="10px">
                <tr align="center">
                    <td align="center">
                        <form action="UpdateStuMessage1.jsp" method="post">
                            <input type="hidden" name="sno" value="<%=rs.getString(1)%>">
                            <input type="hidden" name="room_num" value="<%=rs.getString(4)%>">
                            <input type="submit" value="调整学生宿舍" class="submit">
                        </form>
                    </td>
                    <td align="center">
                        <form action="DeleteMStuMessage1.jsp" method="post">
                            <input type="hidden" name="sno" value="<%=rs.getString(1)%>">
                            <input type="hidden" name="room_num" value="<%=rs.getString(4)%>">
                            <input type="submit" value="删除学生信息" class="submit">
                        </form>
                    </td>
                </tr>
            </table>
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
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <br/>共<%=intRowCount%>个记录，分<%=intPageCount%>页显示，当前页是：第<%=intPage%>页
    &nbsp; &nbsp; &nbsp; &nbsp; <a href="manager_stu.jsp">|主页|</a>
    <%
        for (int j = 1; j <= intPageCount; j++) {
            out.print("&nbsp;&nbsp;<a href='stu_manage.jsp?page=" + j + "'>" + j + "</a>");
        }
    %>
    <center>
        <br/>
        <a href="../Room/manager_room.jsp">宿舍房间信息管理</a>
    </center>
    <br/>
    <center>
        <table align="center" cellpadding="10px">
            <tr align="center">
                <td align="center">
                    <form action="../ExcelToDbServlet1" method="post">
                        <fieldset>
                            <legend align="center">导入批量数据到数据库</legend>
                            <input type="file" name="file">
                            <input type="submit" value="导入">
                        </fieldset>
                    </form>
                </td>
                <td align="center">
                    <form action="../DbToExcelServlet1" method="post">
                        <fieldset>
                            <legend align="center">导出批量数据到excel文件</legend>
                            <input type="submit" value="导出">
                        </fieldset>
                    </form>
                </td>
            </tr>
        </table>
    </center>
</div>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
