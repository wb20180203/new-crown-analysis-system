package com.hqyj.xinguan.service.impl;

import com.hqyj.xinguan.service.DataService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/19 9:57
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/spring.xml")
public class DataServiceImplTest {
    @Autowired
    private DataService userDataService;
    @Test
    public void getCountByAddress() {
        System.out.println(userDataService.getCountByAddress());
    }
}