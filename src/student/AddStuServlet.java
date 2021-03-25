package student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddStuServlet")
public class AddStuServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sno = request.getParameter("sno").trim();//如name为标签的name
        String stu_name = request.getParameter("stu_name").trim();
        String stu_class = request.getParameter("stu_class").trim();
        String room_num = request.getParameter("room_num").trim();
        String maintain = request.getParameter("maintain").trim();
        String off_time = request.getParameter("off_time").trim();
        String late_time = request.getParameter("late_time").trim();
        if (sno.equals("") | stu_name.equals("") | stu_class.equals("")  | room_num.equals("")  | maintain.equals("")  | off_time.equals("")  | late_time.equals("")) {  //填写信息不能为空
            response.sendRedirect("student/add_stu.jsp");
        }
        else {
            boolean zhr = AddStu_Check.getInstance().Check(sno);  //检查学号是否唯一
            if (zhr) {      //学号不重复则执行插入操作
                boolean isroom = AddStu_Check.getInstance().CheckRoom(room_num);//检查宿舍房间号是否存在
                if (isroom){    //存在宿舍房间号才能入住
                    boolean zhang = AddStu_Check.getInstance().Check_RoomNum(room_num,"");  //检查宿舍是否已住满，旧宿舍没有则定义为 “”
                    if(zhang){      //宿舍没有住满才可以分配入住
                        StuInfo stu = new StuInfo();     //创建StuInfo的对象stu
                        stu.set_Sno(sno);                //调用StuInfo类中的方法保存学生信息
                        stu.set_Stuname(stu_name);
                        stu.set_Class(stu_class);
                        stu.set_roomnum(room_num);
                        stu.set_Maintain(maintain);
                        stu.set_OffTime(off_time);
                        stu.set_LateTime(late_time);

                        boolean flag = StuDao.getInstance().saveUser(stu); // 将学生信息添加到数据库
                        if (flag) {       // 当操作成功时，转发到success.jsp页面
                            request.getRequestDispatcher("student/Stu_success.jsp").forward(request, response);
                        } else {      // 否则，转发到error.jsp页面，显示错误信息！
                            response.sendRedirect("student/Stu_error.jsp");
                        }
                    } else {
                        response.sendRedirect("student/DonLive.jsp");//分配的宿舍已住满
                    }
                }else {
                    response.sendRedirect("student/RoomNotExist.jsp");//宿舍房间号不存在
                }
            } else {      //学号有重复则提示错误
                request.getRequestDispatcher("student/StuDuplication.jsp").forward(request, response);
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
