package student;

import com.DBCon;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ExcelToDbServlet1")
public class ExcelToDbServlet1 extends HttpServlet {//一键实现将Excel中的数据导入数据库
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filename = request.getParameter("file");
        //得到Excel表格中所有的数据
        List<StuInfo> listExcel=StuService.getAllByExcel("d://"+filename);
        if (listExcel==null){       //找不到Excel文件
            response.sendRedirect("student/ToDBError1.jsp");
        }
        else {
            DBCon db=new DBCon();
            for (StuInfo stuEntity : listExcel) {   //只要还有记录继续循环
                int id=stuEntity.getId();//从学生实体stuEntity中获得id
                if (!StuService.isExist(id)) {  //若id不存在就添加学生信息
                    String sql="insert into student (id, sno,stu_name,stu_class,room_num,maintain,off_time,late_time) values(?,?,?,?,?,?,?,?)";
                    String[] str=new String[]{stuEntity.getId()+"",stuEntity.get_Sno(),stuEntity.get_Stuname(),stuEntity.get_Class(),stuEntity.get_roomnum(),stuEntity.get_Maintain(),stuEntity.get_OffTime(),stuEntity.get_LateTime()};//新建字符串数组并为其赋值
                    db.AddU(sql, str);      //调用AddU()方法执行更新操作
                }else {     //若id存在就更新学生信息
                    String sql="update student set sno=?,stu_name=?,stu_class=?,room_num=?,maintain=?,off_time=?,late_time=? where id=?";
                    String[] str=new String[]{stuEntity.get_Sno(),stuEntity.get_Stuname(),stuEntity.get_Class(),stuEntity.get_roomnum(),stuEntity.get_Maintain(),stuEntity.get_OffTime(),stuEntity.get_LateTime(),id+""};
                    db.AddU(sql, str);
                }
            }
            response.sendRedirect("student/ToDBSuccess1.jsp");  //跳转到成功页面
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
