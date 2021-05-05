package com.hqyj.xinguan.controller;

import com.hqyj.xinguan.entity.EchartsData;
import com.hqyj.xinguan.service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/19 10:23
 */
@Controller
@RequestMapping("/data")
public class DataController {

    @Autowired
    private DataService dataService;

    @RequestMapping("/home")
    public String home(){
        return "userData";
    }

    @RequestMapping("/queryCount")
    @ResponseBody
    public Map<String,Object> queryCount(){
        HashMap<String, Object> result = new HashMap<>();

        List<EchartsData> data = dataService.getCountByAddress();

        result.put("code",0);
        result.put("msg","查询用户数据成功");
        result.put("data",data);
        return result;
    }

    @RequestMapping("/areaInfo")
    @ResponseBody
    public Map<String,Object> queryInfoOfProvince(String province){
        HashMap<String, Object> result = new HashMap<>();

        List<EchartsData> data = dataService.getCountByProvinceName(province);

        result.put("code",0);
        result.put("msg","查询用户数据成功");
        result.put("data",data);
        return result;
    }
}
