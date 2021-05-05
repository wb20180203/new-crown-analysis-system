package com.hqyj.xinguan.service.impl;

import com.hqyj.xinguan.dao.Data;
import com.hqyj.xinguan.entity.EchartsData;
import com.hqyj.xinguan.service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/19 9:52
 */
@Service
public class DataServiceImpl implements DataService {
    @Autowired
    private Data userData;

    @Override
    public List<EchartsData> getCountByAddress() {
        return userData.getNewProvinceData();
    }

    @Override
    public List<EchartsData> getCountByProvinceName(String provinceName) {
        return userData.getAreaDataByProvinceName(provinceName);
    }
}
