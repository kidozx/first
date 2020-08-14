package com.pojo;

import java.util.Arrays;

public class QueryVo {
    private Product product;
    private Integer[] ids;

    @Override
    public String toString() {
        return "QueryVo{" +
                "product=" + product +
                ", ids=" + Arrays.toString(ids) +
                '}';
    }

    public QueryVo() {
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
    }
}

