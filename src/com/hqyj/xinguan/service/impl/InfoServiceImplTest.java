package com.hqyj.xinguan.service.impl;

import com.hqyj.xinguan.dao.AreaMapper;
import com.hqyj.xinguan.dao.InfoDao;
import com.hqyj.xinguan.entity.AreaInfo;
import com.hqyj.xinguan.entity.Province;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import static org.junit.Assert.*;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/20 9:09
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/spring.xml")
public class InfoServiceImplTest {
    @Autowired
    private InfoDao infoDao;
    @Autowired
    private AreaMapper areaMapper;
    @Test
    public void getProvinceById() {
        System.out.println(infoDao.getProvinceById(1));
    }

    @Test
    public void getProvinceCount() {
        int i = infoDao.querySomeProvinceTotal(null, "香港");
        System.out.println(i);
    }
    @Test
    public void querySome() {
        List<Province> provinces = infoDao.querySomeProvince(Date.valueOf("2020-04-13"), "香港", 0, 5);
        System.out.println(provinces);
    }

    @Test
    public void T1() {
        List<AreaInfo> areaInfos = areaMapper.queryAreaOfProvinceByPage(Date.valueOf("2020-04-13"), "香港", 0, 5);
        System.out.println(areaInfos);
    }

    @Test
    public void T2() {
        int n=2-4;
        System.out.println(3+n);
    }
}