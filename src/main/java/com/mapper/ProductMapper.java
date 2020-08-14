package com.mapper;

import com.pojo.Product;

import java.util.List;


public interface ProductMapper {
    public List<Product> findAll();
    public Product getProductById(int id);
    public Product findByName(Product record);

    public int deleteByPrimaryKey(Integer id);

    public int insert(Product record);

    public int updateByPrimaryKey(Product record);

}
