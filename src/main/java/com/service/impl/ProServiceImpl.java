package com.service.impl;

import com.mapper.ProductMapper;
import com.pojo.Product;
import com.github.pagehelper.PageHelper;
import com.service.ProService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProServiceImpl implements ProService {
    @Autowired
    private ProductMapper productMapper;

    public List<Product> findAll(){
        List<Product> li=productMapper.findAll();
        return li;
    }

    public List<Product> selectProductList(int page,int limit){

        PageHelper.startPage(page, limit);

        List<Product> list = productMapper.findAll();
        return list;
    }

    @Override
    public Product getProductById(Integer id) {
        Product p=productMapper.getProductById(id);
        return p;
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {

        return productMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Product record) {
        return productMapper.insert(record);
    }

    @Override
    public Product findByName(Product p) {
        Product product=productMapper.findByName(p);
        return product;
    }


}
