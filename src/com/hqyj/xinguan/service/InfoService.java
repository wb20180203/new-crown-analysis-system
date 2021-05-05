package com.hqyj.xinguan.service;

import com.hqyj.xinguan.entity.PageData;
import com.hqyj.xinguan.entity.Province;
import com.hqyj.xinguan.entity.User;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/19 17:10
 */

public interface InfoService {
    PageData<Province> getProvinceByPage(int pageNumber, int pageSize);
    Boolean deleteProvince(int id);

    Province getOneById(int id);

    Province getOneByTimeAndName(Date time, String name);

    boolean updateProvinceById(Province province);

    boolean  insertProvince(Province province);

    PageData<Province> getSome(String date, String province,int pageSize,int pageNum);

    int getSomeTotal(String data,String province);

}
