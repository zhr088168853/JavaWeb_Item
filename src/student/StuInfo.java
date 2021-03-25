package student;

public class StuInfo {  //StuInfo为JavaBean，用于保存学生基本信息
    private int id;
    private String sno;
    private String stu_name;
    private String stu_class;
    private String room_num;
    private String maintain;
    private String off_time;
    private String late_time;

    public StuInfo() {
    }
    public StuInfo(int id, String sno, String stu_name, String stu_class, String room_num, String maintain, String off_time, String late_time) {
        this.id = id;
        this.sno = sno;
        this.stu_name = stu_name;
        this.stu_class = stu_class;
        this.room_num = room_num;
        this.maintain = maintain;
        this.off_time = off_time;
        this.late_time = late_time;
    }

    @Override
    public String toString() {
        return "StuEntity [id=" + id + ", sno=" + sno + ", stu_name=" + stu_name + ", stu_sex=" + stu_class
                + ", stu_class=" + room_num + ", birthday=" + maintain + ", room_num=" + off_time + ", stu_tel=" + late_time + "]";
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String get_Sno() {
        return sno;
    }
    public void set_Sno(String sno) {
        this.sno = sno;
    }

    public String get_Stuname() {
        return stu_name;
    }
    public void set_Stuname(String stu_name) {
        this.stu_name = stu_name;
    }

    public String get_Class() {
        return stu_class;
    }
    public void set_Class(String stu_class) {
        this.stu_class = stu_class;
    }

    public String get_roomnum() {
        return room_num;
    }
    public void set_roomnum(String room_num) {
        this.room_num = room_num;
    }

    public String get_Maintain() {
        return maintain;
    }
    public void set_Maintain(String maintain) {
        this.maintain = maintain;
    }

    public String get_OffTime() {
        return off_time;
    }
    public void set_OffTime(String off_time) {
        this.off_time = off_time;
    }

    public String get_LateTime() {
        return late_time;
    }
    public void set_LateTime(String late_time) {
        this.late_time = late_time;
    }
}

