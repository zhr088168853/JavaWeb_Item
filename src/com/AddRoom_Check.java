package com;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AddRoom_Check {
    private static AddRoom_Check instance = null;
    public static AddRoom_Check getInstance() {      //获得本实例的静态方法
        if (instance == null) {
            instance = new AddRoom_Check();
        }
        return instance;
    }
    public boolean Check(String room_num) {     //增加宿舍房间信息时检查宿舍房间是否存在
        try{
            Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
            Statement stat = conn.createStatement();
            String sql ="select room_num from room where room_num='"+room_num+"'";
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()){
                String num = rs.getString(1);
                if (num.equals(room_num)){  //由于room_num唯一，若room_num在数据库中已经存在，则提示错误
                    return false;
                }
            }
        }catch(SQLException e){

        }
        return true;
    }
}
