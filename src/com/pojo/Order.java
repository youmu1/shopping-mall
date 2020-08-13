package com.pojo;

public class Order {
    String id;
    int uid;
    int pid;
    String pname;
    int price;
    int number;
    String username;
    String tel;
    String email;
    String address;
    int postal;
    String express;

    public Order() {
    }

    public Order(String id, int uid, int pid, String pname, int price, int number, String username, String tel, String email, String address, int postal, String express) {
        this.id = id;
        this.uid = uid;
        this.pid = pid;
        this.pname = pname;
        this.price = price;
        this.number = number;
        this.username = username;
        this.tel = tel;
        this.email = email;
        this.address = address;
        this.postal = postal;
        this.express = express;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPostal() {
        return postal;
    }

    public void setPostal(int postal) {
        this.postal = postal;
    }

    public String getExpress() {
        return express;
    }

    public void setExpress(String express) {
        this.express = express;
    }
}
