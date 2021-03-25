package manager;

import com.AddRoom_Check;
import com.DBCon;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AddMan_Check {
    private static AddMan_Check instance = null;
    public static AddMan_Check getInstance() {      //获得本实例的静态方法
        if (instance == null) {
            instance = new AddMan_Check();
        }
        return instance;
    }
    public boolean Check(String man_username) {
        try{
            Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
            Statement stat = conn.createStatement();
            String sql ="select man_username from manager where man_username='"+man_username+"'";
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()){
                String num = rs.getString(1);
                if (num.equals(man_username)){  //由于room_num唯一，若room_num在数据库中已经存在，则提示错误
                    return false;
                }
            }
        }catch(SQLException e){

        }
        return true;
    }
}
