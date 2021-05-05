package com.hqyj.xinguan.service;

import com.hqyj.xinguan.entity.AreaInfo;
import com.hqyj.xinguan.entity.PageData;

import java.sql.Date;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/20 17:28
 */
public interface AreaService {


    int getTotalOfAreaInProvince(String date,String province);

    PageData<AreaInfo> queryAreasInProvince(String date, String province, int pageSize, int pageNum);

    Boolean updateArea(AreaInfo areaInfo);

    Boolean insertArea(AreaInfo areaInfo);

    AreaInfo queryAreaById(int id);

    AreaInfo queryAreaByName(String areaName,String time,String provinceName);

    Boolean deleteArea(String time,String province,int id);

    AreaInfo queryAreaByTimeAndProvinceNameAndAreaName(Date time, String provinceName, String areaName);
}
