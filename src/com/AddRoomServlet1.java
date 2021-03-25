package com;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddRoomServlet1")
public class AddRoomServlet1 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String room_num = request.getParameter("room_num").trim();//如name为标签的name
        String room_tel = request.getParameter("room_tel").trim();
        String room_people = request.getParameter("room_people").trim();
        String room_man = request.getParameter("room_man").trim();
        if (room_num.equals("") | room_tel.equals("") | room_people.equals("")  | room_man.equals("")) {  //填写信息不能为空
            response.sendRedirect("Room/add_room1.jsp");
        }
        else {
            boolean zhr = AddRoom_Check.getInstance().Check(room_num);  //检查房间号是否唯一
            if (zhr) {      //房间号不重复则执行插入操作
                RoomInfo dorm = new RoomInfo();     //创建UserInfo的对象user
                dorm.setRoomnum(room_num);             //调用UserInfo类中的方法保存用户信息
                dorm.setRoomtel(room_tel);
                dorm.setRoompeople(room_people);
                dorm.setRoomman(room_man);

                boolean flag = RoomDao.getInstance().saveUser(dorm); // 将用户注册信息保存到数据库
                if (flag) {       // 当操作成功时，转发到success.jsp页面
                    request.getRequestDispatcher("Room/success1.jsp").forward(request, response);
                } else {      // 否则，转发到error.jsp页面，显示错误信息！
                    response.sendRedirect("Room/error1.jsp");
                }
            } else {      //房间号有重复则提示错误
                request.getRequestDispatcher("Room/Duplication1.jsp").forward(request, response);
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
