package student;

import com.DBCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StuDao {
        private static StuDao instance = null;

        public static StuDao getInstance() {   //本实例的静态方法
            if (instance == null) {
                instance = new StuDao();
            }
            return instance;
        }


        public boolean saveUser(StuInfo stu) { // 将学生信息添加到数据库
            Connection conn = null;
            try {
                conn = DBCon.getCon(); // 加载数据库驱动并建立数据库连接
                String sql = "insert into student(sno,stu_name,stu_class,room_num,maintain,off_time,late_time)values(?,?,?,?,?,?,?)"; // insert,用?号构建参数
                PreparedStatement pstmt = conn.prepareStatement(sql); // 创建用户操作执行SQL语句的PreparedStatement对象
                pstmt.setString(1, stu.get_Sno());
                pstmt.setString(2, stu.get_Stuname());
                pstmt.setString(3, stu.get_Class());
                pstmt.setString(4, stu.get_roomnum());
                pstmt.setString(5, stu.get_Maintain());
                pstmt.setString(6, stu.get_OffTime());
                pstmt.setString(7, stu.get_LateTime());
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

