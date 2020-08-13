package com.pojo;

public class Address {
    int id;
    int uid;
    String email;
    String tel;
    String name;
    String address;
    int post;
    String time;
    String express;

    public Address() {
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Address(int id, int uid, String email, String tel, String name, String address, int post, String time, String express) {
        this.id = id;
        this.uid = uid;
        this.email = email;
        this.tel = tel;
        this.name = name;
        this.address = address;
        this.post = post;
        this.time = time;
        this.express = express;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPost() {
        return post;
    }

    public void setPost(int post) {
        this.post = post;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getExpress() {
        return express;
    }

    public void setExpress(String express) {
        this.express = express;
    }
}
