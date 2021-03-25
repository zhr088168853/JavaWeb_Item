package student;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

@WebServlet("/DbToExcelServlet1")
public class DbToExcelServlet1 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            WritableWorkbook wwb = null;

            String fileName = "D://student.xls";    //导出的excel文件存放在D盘
            File file=new File(fileName);
            if (!file.exists()) {       //若文件不存在则新建文件
                file.createNewFile();
            }
            //以fileName为文件名来创建一个Workbook工作簿
            wwb = Workbook.createWorkbook(file);//此处文件必须关闭才可以正常执行,否则弹出文件找不到异常

            // 创建工作表
            WritableSheet ws = wwb.createSheet("Sheet 1", 0);//指定工作表名称为Sheet 1

            //查询数据库中所有的数据
            List<StuInfo> list= StuService.getAllByDb();

            if (list==null){        //找不到文件，文件名有误
                response.sendRedirect("student/ToExcelError1.jsp");
            }
            else {
                //要插入到的Excel表格的行号，默认从0开始，即将表头插入到表格的第0行
                Label label_id= new Label(0, 0, "编号");
                Label label_sno= new Label(1, 0, "学号");
                Label label_stu_name= new Label(2, 0, "姓名");
                Label label_stu_class= new Label(3, 0, "班级");
                Label label_room_num= new Label(4, 0, "宿舍房号");
                Label label_maintain= new Label(5, 0, "报修物品");
                Label label_off_time= new Label(6, 0, "请假时间");
                Label label_late_time= new Label(7, 0, "晚归时间");
                //将表头插入到表格的第0行
                ws.addCell(label_id);
                ws.addCell(label_sno);
                ws.addCell(label_stu_name);
                ws.addCell(label_stu_class);
                ws.addCell(label_room_num);
                ws.addCell(label_maintain);
                ws.addCell(label_off_time);
                ws.addCell(label_late_time);
                //依次插入数据到Excel表格中
                for (int i = 0; i < list.size(); i++) {
                    Label labelId_i= new Label(0, i+1, list.get(i).getId()+"");
                    Label labelSno_i= new Label(1, i+1, list.get(i).get_Sno());
                    Label labelName_i= new Label(2, i+1, list.get(i).get_Stuname());
                    Label labelClass_i= new Label(3, i+1, list.get(i).get_Class());
                    Label labelRoom_i= new Label(4, i+1, list.get(i).get_roomnum());
                    Label labelMaintain_i= new Label(5, i+1, list.get(i).get_Maintain());
                    Label labelOffTime_i= new Label(6, i+1, list.get(i).get_OffTime());
                    Label labelLateTime_i= new Label(7, i+1, list.get(i).get_LateTime());

                    ws.addCell(labelId_i);
                    ws.addCell(labelSno_i);
                    ws.addCell(labelName_i);
                    ws.addCell(labelClass_i);
                    ws.addCell(labelRoom_i);
                    ws.addCell(labelMaintain_i);
                    ws.addCell(labelOffTime_i);
                    ws.addCell(labelLateTime_i);
                }
                //写进文档
                wwb.write();
                // 关闭Excel工作簿对象
                wwb.close();
                response.sendRedirect("student/ToExcelSuccess1.jsp");    //成功导入到excel文件
            }
        } catch(FileNotFoundException e){   //当student.xls文件没有关闭时提示错误
            response.sendRedirect("student/NotFoundFile1.jsp");
        }
        catch (RowsExceededException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        catch (WriteException e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
