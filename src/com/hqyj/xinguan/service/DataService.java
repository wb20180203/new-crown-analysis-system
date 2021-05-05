package com.hqyj.xinguan.service;

import com.hqyj.xinguan.entity.EchartsData;

import java.util.List;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/19 9:52
 */
public interface DataService {
    List<EchartsData>  getCountByAddress();

    List<EchartsData> getCountByProvinceName(String provinceName);
}
