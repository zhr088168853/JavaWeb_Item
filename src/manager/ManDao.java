package manager;

import com.DBCon;
import com.RoomDao;
import com.RoomInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ManDao {
    private static ManDao instance = null;

    public static ManDao getInstance() {      //获得本实例的静态方法
        if (instance == null) {
            instance = new ManDao();
        }
        return instance;
    }


    public boolean saveUser(ManInfo user) { // 保存用户注册信息到数据库的方法，UserInfo为JavaBean类，用UserInfo类的对象去调用方法
        Connection conn = null;
        try {
            conn = DBCon.getCon(); // 建立数据库连接
            String sql = "insert into manager(man_name,man_username,man_password,man_age)values(?,?,?,?)"; // insert,用?号构建参数
            // SQL语句=
            PreparedStatement pstmt = conn.prepareStatement(sql); // 创建用户操作执行SQL语句的PreparedStatement对象
            pstmt.setString(1, user.getManname());
            pstmt.setString(2, user.getManuser());
            pstmt.setString(3, user.getManpwd());
            pstmt.setString(4, user.getManage());
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

