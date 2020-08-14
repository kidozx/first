package com.controller;

import com.pojo.Product;
import com.pojo.QueryVo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.ProService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class ProductCtrl {

    @Autowired
    private ProService productService;

    @RequestMapping(value="/product",produces ="text/html; charset=UTF-8")
    @ResponseBody
    public String getPlist(HttpServletRequest request,Model model) throws JsonProcessingException {

        int page =   Integer.parseInt(request.getParameter("page"));
        int limit = Integer.parseInt(request.getParameter("limit"));

        List<Product> list=productService.selectProductList(page,limit);

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",50);
        map.put("data",list);
        ObjectMapper objectMapper=new ObjectMapper();


//        List<Product> list=productService.findAll();
//        model.addAttribute(list);

        return objectMapper.writeValueAsString(map);
    }

    @RequestMapping(value="/getjson")
    @ResponseBody
    public Product getjson(Product product){

        Product p=product;
        System.out.println(p);

        return product;
    }

    @RequestMapping(value = "/itemEdit/{pid}")
    public ModelAndView getProductById(HttpServletRequest request, @PathVariable("pid") String id)
    {

        ModelAndView modelAndView = new ModelAndView();
        //String id = request.getParameter("id");
        System.out.println(id);
        Product product = this.productService.getProductById(Integer.parseInt(id));



        modelAndView.addObject("item",product);
        // 设置视图 名称
        modelAndView.setViewName("productItem");

        return modelAndView;


    }

    @RequestMapping(value = "/upload")
    public String fileUpload(MultipartFile pictureFile, HttpServletRequest request) throws IOException {
        // 获取文件名
        String uploadFileName = pictureFile.getOriginalFilename();

        // 如果文件名为空, 直接回到首页
        if ("".equals(uploadFileName)){
            return "sendHson.jsp";
        }

        System.out.println("上传文件名: " + uploadFileName);

        // 上传路径保存设置
        String path = request.getServletContext().getRealPath("/upload");
        // 如果路径不存在, 则创建一个
        File realPath = new File(path);
        if (!realPath.exists()) {
            realPath.mkdir();
        }
        System.out.println("上传文件保存地址: " + realPath);

        // 文件输入流
        InputStream is = pictureFile.getInputStream();
        // 文件输出流
        OutputStream os = new FileOutputStream(new File(realPath, uploadFileName));

        // 读取写出
        int len = 0;
        byte[] buffer = new byte[1024];
        while ((len = is.read(buffer)) != -1) {
            os.write(buffer, 0, len);
            os.flush();
        }
        os.close();
        is.close();
        return "productList.jsp";
    }

    @RequestMapping(value="/deleteAll")
    public String deleteAll(QueryVo vo)
    {
        System.out.println(vo.getIds()[0]);
        int len=vo.getIds().length;
        for(int i=0;i<len;i++){
            productService.deleteByPrimaryKey(vo.getIds()[i]);
        }
        return "/productList.jsp";
    }

    @RequestMapping(value="/query")
    public String query(QueryVo vo, Model model)
    {

        Product p=productService.findByName(vo.getProduct());
        System.out.println(p);

        model.addAttribute(p);

        return "query";
    }


}
