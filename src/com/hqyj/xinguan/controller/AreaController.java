package com.hqyj.xinguan.controller;

import com.hqyj.xinguan.entity.AreaInfo;
import com.hqyj.xinguan.entity.PageData;
import com.hqyj.xinguan.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/20 17:27
 */
@Controller
@RequestMapping("/area")
public class AreaController {
    final static int DEFAULT_PAGE_NUMBER=1;
    final static int DEFAULT_PAGE_SIZE=10;


    @Autowired
    private AreaService areaService;


    @RequestMapping("/detailsOfProvince")
    public String detailsOfProvince(String time,String province, Integer pageNumber,
                                    Integer pageSize, ModelMap modelMap){

        if(pageNumber == null){
            pageNumber = DEFAULT_PAGE_NUMBER;
        }
        if (pageSize == null){
            pageSize = DEFAULT_PAGE_SIZE;
        }
        PageData<AreaInfo> pageData =  areaService.queryAreasInProvince(time,province,pageSize, pageNumber);
        modelMap.addAttribute("pageData", pageData);
        modelMap.addAttribute("province",province);
        modelMap.addAttribute("date",time);
        return "areaOfProvince";
    }



    @RequestMapping("/add")
    public String add(String time,String province,ModelMap map){
        map.addAttribute("time",time);
        map.addAttribute("province",province);
        return "areaAdd";
    }

    @ResponseBody
    @RequestMapping("/addOne")
    public Map<String,Object> addArea(AreaInfo areaInfo){
        HashMap<String, Object> map = new HashMap<>();

        AreaInfo area = areaService.queryAreaByTimeAndProvinceNameAndAreaName(areaInfo.getTime(),
                areaInfo.getProvinceName(), areaInfo.getAreaName());

        if(area!=null){
            map.put("code",1);
            map.put("msg","此日该省已有该市区数据");
            return map;
        }
        
        boolean b = areaService.insertArea(areaInfo);

        if(b){
            map.put("code",0);
            map.put("msg","添加用户成功");
        }else{
            map.put("code",-1);
            map.put("msg","添加用户失败");
        }
        return map;
    }




    @RequestMapping("/areaEdit")
    public String update(int id,String time,String province,ModelMap map){
        AreaInfo areaInfo = areaService.queryAreaById(id);
        areaInfo.setTime(Date.valueOf(time));
        areaInfo.setProvinceName(province);
        map.addAttribute("areaInfo",areaInfo);
        return "areaEdit";
    }

    @ResponseBody
    @RequestMapping("/updateOne")
    public Map<String,Object> updateArea(AreaInfo areaInfo){
        HashMap<String, Object> map = new HashMap<>();

        boolean b = areaService.updateArea(areaInfo);

        if(b){
            map.put("code",0);
            map.put("msg","保存成功");
        }else{
            map.put("code",-1);
            map.put("msg","保存失败");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping("/deleteOne")
    public Map<String,Object> deleteArea(String time,String province,int id){
        HashMap<String, Object> map = new HashMap<>();

        boolean b = areaService.deleteArea(time,province,id);

        if(b==true){
            map.put("code",0);
            map.put("msg","保存成功");
        }else{
            map.put("code",-1);
            map.put("msg","保存失败");
        }
        return map;
    }

    @RequestMapping("/queryAreaByName")
    public String queryAreaByName(String areaName,String time,String province,ModelMap map){
        map.put("areaInfo",areaService.queryAreaByName(areaName,time,province));
        map.addAttribute("time",time);
        map.addAttribute("province",province);
        return "showOneArea";
    }
}
