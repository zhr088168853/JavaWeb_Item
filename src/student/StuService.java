package student;

import com.DBCon;
import jxl.Sheet;
import jxl.Workbook;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class StuService {
    /**
     * 查询stu表中所有的数据
     * @return
     */
    public static List<StuInfo> getAllByDb(){   //从数据库中获取所有入住的学生信息
        List<StuInfo> list= new ArrayList<>();
        try {
            DBCon db=new DBCon();
            String sql="select * from student"; //将student表中的所有学生查询出来
            ResultSet rs= db.Search(sql, null);//调用DBCon类的Search()方法返回执行sql语句的结果集
            while (rs.next()) {     //分别将各个字段对应的值获取出来
                int id=rs.getInt("id");
                String sno=rs.getString("sno");
                String stu_name=rs.getString("stu_name");
                String stu_class=rs.getString("stu_class");
                String room_num=rs.getString("room_num");
                String maintain=rs.getString("maintain");
                String off_time=rs.getString("off_time");
                String late_time=rs.getString("late_time");
                list.add(new StuInfo(id, sno,stu_name,stu_class,room_num,maintain,off_time,late_time));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            list=null;
        }
        return list;
    }

    /**
     * 查询指定目录中电子表格中所有的数据
     * @param file 文件完整路径
     * @return
     */
    //从指定的Excel文件中获取所有将要入住的学生信息，添加到List集合中
    public static List<StuInfo> getAllByExcel(String file){
        List<StuInfo> list= new ArrayList<>();//新建一个List集合，用于存放从Excel文件中的数据
        try {
                Workbook rwb = Workbook.getWorkbook(new File(file));//从指定的文件中获得工作簿
                Sheet rs = rwb.getSheet("Sheet 1");//或者rwb.getSheet(0)//从工作簿中获得名为Sheet 1的工作表
                int clos = rs.getColumns(); //得到表中所有的列
                int rows = rs.getRows();    //得到表中所有的行
                for (int i = 1; i < rows; i++) {
                    for (int j = 0; j < clos; j++) {
                        //从表中依次获取每个单元格的值，getCell()方法的第一个参数是列数，第二个参数是行数
                        String id = rs.getCell(j++, i).getContents();//默认最左边编号也算一列 所以这里得j++
                        String sno = rs.getCell(j++, i).getContents();
                        String stu_name = rs.getCell(j++, i).getContents();
                        String stu_class = rs.getCell(j++, i).getContents();
                        String room_num = rs.getCell(j++, i).getContents();
                        String maintain = rs.getCell(j++, i).getContents();
                        String off_time = rs.getCell(j++, i).getContents();
                        String late_time = rs.getCell(j++, i).getContents();
                        //将Excel文件中的数据保存到StuInfo中，再将StuInfo对象加入List集合中
                        list.add(new StuInfo(Integer.parseInt(id), sno,stu_name,stu_class,room_num,maintain,off_time,late_time));
                    }
                }
            } catch(FileNotFoundException e){   //文件找不到异常
                // TODO Auto-generated catch block
                list=null;      //若Excel文件找不到则list为null
            }catch (java.io.IOException e){     //IO异常
                e.printStackTrace();
            }catch (jxl.read.biff.BiffException e){   //读取文件异常
                e.printStackTrace();
            }
            return list;    //返回结果
    }

    /**
     * 通过Id判断是否存在
     * @param id
     * @return
     */
    public static boolean isExist(int id){      //检查指定的学生id是否存在
        try {
            DBCon db=new DBCon();
            ResultSet rs=db.Search("select * from student where id=?", new String[]{id+""});
            if (rs.next()) {        //找得到id,返回true
                return true;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;   //找不到id则返回false
    }
}

