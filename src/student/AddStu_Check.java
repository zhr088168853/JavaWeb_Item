package student;

import com.AddRoom_Check;
import com.DBCon;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AddStu_Check {
    private static AddStu_Check instance = null;

    public static AddStu_Check getInstance() {      //获得本实例的静态方法
        if (instance == null) {
            instance = new AddStu_Check();
        }
        return instance;
    }

    public boolean Check(String sno) {      //在插入时检查是否有相同的学号
        try {
            Connection conn = DBCon.getCon(); // 加载数据库驱动并建立与数据库的连接
            Statement stat = conn.createStatement();//创建Statement对象
            String sql = "select sno from student where sno='" + sno + "'";
            ResultSet rs = stat.executeQuery(sql);//执行sql语句
            while (rs.next()) {//依次遍历表中的数据
                String num = rs.getString(1);
                if (num.equals(sno)) {  //由于sno唯一，若sno在数据库中已经存在则学号重复
                    return false;
                }
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return true;
    }

    public boolean CheckUniqueSno(String sno,String oldsno) {   //在修改时检查是否有相同的学号
        boolean flag=true;
        if(!(sno.equals(oldsno))) { //当学号有改变时执行
            try {
                Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
                Statement stat = conn.createStatement();
                String sql = "select sno from student";
                ResultSet rs = stat.executeQuery(sql);
                while (rs.next()) {
                    String num = rs.getString("sno");
                    if (num.equals(sno)) {  //由于sno唯一，若sno在数据库中已经存在，则提示错误
                        flag = false;
                    }
                }
            } catch (SQLException e) {
                e.getMessage();
            }
        }
        return flag;
    }

    public boolean CheckRoom(String room_num) {     //增加时检查宿舍房间号是否存在
        boolean flag=false;
        try {
            Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
            Statement stat = conn.createStatement();
            String sql = "select room_num from room where room_num='" + room_num + "'";
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()) {
                String num = rs.getString("room_num");
                if (num.equals(room_num)) {  //存在宿舍房间号返回true
                    flag=true;
                }
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return flag;
    }

    public boolean Check_RoomNum(String room_num,String oldnum) {   //增加或修改时检查宿舍是否已住满
        boolean flag = false;
        if(!(room_num.equals(oldnum))) {//当宿舍号有修改时检查宿舍是否住满
            try {
                Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
                Statement stat = conn.createStatement();
                String sql = "SELECT room_people FROM room where room_num='" + room_num + "'";
                ResultSet rs = stat.executeQuery(sql);
                if (rs.next()) {        //若宿舍已分配过则检查是否住满
                    String number = rs.getString("room_people");
                    int num = Integer.parseInt(number);
                    if (num == 4) {     //规定4人一个宿舍
                        return false;
                    } else {
                        try {
                            num = num + 1;      //宿舍没住满则入住人数加1
                            String sql1 = "update room set room_people='" + num + "' where room_num='" + room_num + "'";
                            stat.executeUpdate(sql1);   //更新入住人数
                            stat.close();
                            conn.close();
                            flag = true;
                        } catch (SQLException e) {
                            e.getMessage();
                        }
                    }
                }
            } catch (Exception e) {
                e.getMessage();
            }
        }
        return flag;
    }

    public boolean Delete_RoomNum(String room_num) {     //删除学生入住信息时宿舍入住人数减1
        boolean flag = false;
        try {
            Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
            Statement stat = conn.createStatement();
            String sql = "SELECT room_people FROM room where room_num='" + room_num + "'";
            ResultSet rs = stat.executeQuery(sql);
            if (rs.next()) {        //若宿舍已分配过则检查是否住满
                String number = rs.getString("room_people");
                int num = Integer.parseInt(number);
                if (num > 0) {  //由于sno唯一，若sno在数据库中已经存在，则提示错误
                    num = num - 1;      //宿舍没住满则入住人数加1
                    String sql1 = "update room set room_people='" + num + "' where room_num='" + room_num + "'";
                    stat.executeUpdate(sql1);
                    stat.close();
                    conn.close();
                    flag=true;
                }
            }
        } catch (Exception e) {
            e.getMessage();
        }
        return flag;
    }
}

