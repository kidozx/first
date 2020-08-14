package com.pojo;

import java.util.Date;


public class Product {
    private Integer pid;

    private String pname;

    private Float shop_price;

    private String pimage;

    private Date pdate;

    private String pdesc;

    public Product(Integer pid, String pname, Float shop_price, String pimage, Date pdate, String pdesc) {
        this.pid = pid;
        this.pname = pname;
        this.shop_price = shop_price;
        this.pimage = pimage;
        this.pdate = pdate;
        this.pdesc = pdesc;
    }

    public Product() {
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Float getShop_price() {
        return shop_price;
    }

    public void setShop_price(Float shop_price) {
        this.shop_price = shop_price;
    }

    public String getPimage() {
        return pimage;
    }

    public void setPimage(String pimage) {
        this.pimage = pimage;
    }

    public Date getPdate() {
        return pdate;
    }

    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", shop_price=" + shop_price +
                ", pimage='" + pimage + '\'' +
                ", pdate=" + pdate +
                ", pdesc='" + pdesc + '\'' +
                '}';
    }
}