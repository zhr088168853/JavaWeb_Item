package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBCon {
    private static Connection conn = null;
    private static ResultSet res = null;

    public static Connection getCon() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");//加载数据库驱动
            String user = "root";
            String pwd = "root";//数据库密码
            String url = "jdbc:mysql://localhost:3306/dorm_system?characterEncoding=utf8&useSSL=false&serverTimezone=UTC&rewriteBatchedStatements=true";//dorm_system为数据库名称
            conn = DriverManager.getConnection(url, user, pwd);//与数据库建立连接
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    public ResultSet Search(String sql, String str[]) { //查询指定表格中的信息，传入指定的sql语句，若sql语句中没有使用?，则传入的字符串数组为null
        try {
            PreparedStatement pst =getCon().prepareStatement(sql);//创建PreparedStatement对象
            if (str != null) {//如果字符串数组不为null
                for (int i = 0; i < str.length; i++) {
                    pst.setString(i + 1, str[i]);//将数组中的每一个字符串依次代替?用作参数
                }
            }
            res = pst.executeQuery();   //执行sql语句得到结果集
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return res;     //返回结果
    }

    // 对指定的表格执行更新（增、删、修改）操作
    public int AddU(String sql, String str[]) {
        int a = 0;
        try {
            PreparedStatement pst = getCon().prepareStatement(sql);
            if (str != null) {
                for (int i = 0; i < str.length; i++) {
                    pst.setString(i + 1, str[i]);
                }
            }
            a = pst.executeUpdate();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return a;
    }
}
