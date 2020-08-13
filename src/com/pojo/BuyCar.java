package com.pojo;

public class BuyCar {
    int id;
    int uid;
    int pid;
    String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    int price;
    String filename;
    int number;

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public BuyCar() {
    }

    public BuyCar(int id, int uid, int pid, String name, int price, String filename, int number) {
        this.id = id;
        this.uid = uid;
        this.pid = pid;
        this.name = name;
        this.price = price;
        this.filename = filename;
        this.number = number;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
