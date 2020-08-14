package com.service;

import com.pojo.Product;

import java.util.List;

public interface ProService {
    public List<Product> findAll();
    public List<Product> selectProductList(int page,int limit);
    public Product getProductById(Integer id);
    public int deleteByPrimaryKey(Integer id);
    public int insert(Product record);
    public Product findByName(Product p);
}
