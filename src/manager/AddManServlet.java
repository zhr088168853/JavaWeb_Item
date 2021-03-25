package manager;

import com.AddRoom_Check;
import com.RoomDao;
import com.RoomInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddManServlet")
public class AddManServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String man_name = request.getParameter("man_name").trim();//如name为标签的name
        String man_username = request.getParameter("man_username").trim();
        String man_password = request.getParameter("man_password").trim();
        String man_age = request.getParameter("man_age").trim();
        if (man_name.equals("") || man_username.equals("") || man_password.equals("")  || man_age.equals("")){  //填写信息不能为空
            response.sendRedirect("DormManager/add_man.jsp");
        }
        else {
            boolean zhr = AddMan_Check.getInstance().Check(man_username);  //检查账号是否唯一
            if (zhr){      //房间号不重复则执行插入操作
                ManInfo man = new ManInfo();     //创建UserInfo的对象user
                man.setManname(man_name);             //调用UserInfo类中的方法保存用户信息
                man.setManuser(man_username);
                man.setManpwd(man_password);
                man.setManage(man_age);

                boolean flag = ManDao.getInstance().saveUser(man); // 将用户注册信息保存到数据库
                if (flag) {       // 当操作成功时，转发到success.jsp页面
                    request.getRequestDispatcher("DormManager/ManSuccess.jsp").forward(request, response);
                } else {      // 否则，转发到error.jsp页面，显示错误信息！
                    response.sendRedirect("DormManager/Manerror.jsp");
                }
            } else {      //管理员账号重复则提示错误
                request.getRequestDispatcher("DormManager/man_user_Duplication.jsp").forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
