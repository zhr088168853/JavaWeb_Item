package com;

public class RoomInfo {
    private String room_num;
    private String room_tel;
    private String room_people;
    private String room_man;    //舍长

    public RoomInfo() {
    }

    public String getRoomnum() {
        return room_num;
    }

    public void setRoomnum(String room_num) {
        this.room_num = room_num;
    }

    public String getRoomtel() {
        return room_tel;
    }

    public void setRoomtel(String room_tel) {
        this.room_tel = room_tel;
    }

    public String getRoompeople() {
        return room_people;
    }

    public void setRoompeople(String room_people) {
        this.room_people = room_people;
    }

    public String getRoomman() {
        return room_man;
    }

    public void setRoomman(String room_man) {
        this.room_man = room_man;
    }

}
