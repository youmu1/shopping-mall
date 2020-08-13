package com.pojo;

public class Show3 {
    String id;
    String peisong;
    String whatpay;
    String money;

    public Show3() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPeisong() {
        return peisong;
    }

    public void setPeisong(String peisong) {
        this.peisong = peisong;
    }

    public String getWhatpay() {
        return whatpay;
    }

    public void setWhatpay(String whatpay) {
        this.whatpay = whatpay;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public Show3(String id, String peisong, String whatpay, String money) {
        this.id = id;
        this.peisong = peisong;
        this.whatpay = whatpay;
        this.money = money;
    }
}
