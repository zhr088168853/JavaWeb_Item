package com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RoomDao {
    private static RoomDao instance = null;

    public static RoomDao getInstance() {      //获得本实例的静态方法
        if (instance == null) {
            instance = new RoomDao();
        }
        return instance;
    }


    public boolean saveUser(RoomInfo user) { // 保存宿舍房间信息到数据库
        Connection conn = null;
        try {
            conn = DBCon.getCon(); // 建立数据库连接
            String sql = "insert into room(room_num,room_tel,room_people,room_man)values(?,?,?,?)"; // insert,用?号构建参数
            PreparedStatement pstmt = conn.prepareStatement(sql); // 创建用户操作执行SQL语句的PreparedStatement对象
            pstmt.setString(1, user.getRoomnum());
            pstmt.setString(2, user.getRoomtel());
            pstmt.setString(3, user.getRoompeople());
            pstmt.setString(4, user.getRoomman());
            pstmt.executeUpdate(); // 编译执行insert语句
            return true;        //插入成功返回true
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;       //否则返回false
    }
}

