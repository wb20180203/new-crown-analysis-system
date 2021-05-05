package com.hqyj.xinguan.controller;

import com.hqyj.xinguan.entity.PageData;
import com.hqyj.xinguan.entity.Province;
import com.hqyj.xinguan.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.util.*;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/19 16:27
 */
@Controller
@RequestMapping("/info")
public class InfoOfProvince {
    final static int DEFAULT_PAGE_NUMBER=1;
    final static int DEFAULT_PAGE_SIZE=10;

    @Autowired
    private InfoService infoService;

    @RequestMapping("/province")
    public String pageProvince(Integer pageNumber, Integer pageSize, ModelMap modelMap){
        if(pageNumber == null){
            pageNumber = DEFAULT_PAGE_NUMBER;
        }
        if (pageSize == null){
            pageSize = DEFAULT_PAGE_SIZE;
        }
        PageData<Province> pageData =  infoService.getProvinceByPage(pageNumber, pageSize);
        modelMap.addAttribute("pageData", pageData);
        return "info";
    }

    @RequestMapping("/remove")
    @ResponseBody
    public Map<String,Object> deleteProvince(Integer id){
        HashMap<String, Object> map = new HashMap<>();
        if (id == null) {
            map.put("code", -2);
            map.put("msg", "传递信息有误");
            return map;
        }
        Boolean i = infoService.deleteProvince(id);
        if(i){
            map.put("code",0);
            map.put("msg", "删除成功");
        }else {
            map.put("code",-1);
            map.put("msg", "删除失败");
        }
        return map;
    }

    @RequestMapping("/proedit")
    public String edit(int id,ModelMap modelMap){
        Province province = infoService.getOneById(id);
        modelMap.addAttribute("editProvinec",province);
        return "provinceEdit";
    }

    @ResponseBody
    @RequestMapping("/update")
    public Map<String,Object> updateProvince(Province province){
        HashMap<String, Object> map = new HashMap<>();
        boolean b = infoService.updateProvinceById(province);
        if(b==true){
            map.put("code",0);
            map.put("msg","保存成功");
        }else{
            map.put("code",-1);
            map.put("msg","保存失败");
        }
        return map;
    }


    @RequestMapping("/add")
    public String add(){
        return "provinceAdd";
    }


    @ResponseBody
    @RequestMapping("/addOne")
    public Map<String,Object> addOne(Province province){
        HashMap<String, Object> map = new HashMap<>();

        Province oneByTimeAndName = infoService.getOneByTimeAndName
                (Date.valueOf(province.getTime()), province.getProvinceName());
        if(oneByTimeAndName!=null){
            map.put("code",1);
            map.put("msg","已有该省该日数据");
            return map;
        }

        boolean b = infoService.insertProvince(province);

        if(b){
            map.put("code",0);
            map.put("msg","添加用户成功");
            map.put("time",province.getTime());
            map.put("province",province.getProvinceName());
        }else{
            map.put("code",-1);
            map.put("msg","添加用户失败");
        }
        return map;
    }


    //搜索查询
    @RequestMapping("/querySome")
    public String querySome(Integer pageNumber, Integer pageSize,
                            String time, String province, ModelMap modelMap,
                            HttpServletRequest request){
        if(pageNumber == null){
            pageNumber = DEFAULT_PAGE_NUMBER;
        }
        if (pageSize == null){
            pageSize = DEFAULT_PAGE_SIZE;
        }
        PageData pageData = infoService.getSome(time,province,pageSize,pageNumber);
        //将查询参数保存到request域中
        if(time!=null && time!=""){
            request.setAttribute("time",time);
        }
        if(province!=null && province!=""){
            request.setAttribute("province",province);
        }
        modelMap.addAttribute("pageData", pageData);
        return "info";
    }

}
