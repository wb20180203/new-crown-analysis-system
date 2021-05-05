package com.hqyj.xinguan.dao;

import com.hqyj.xinguan.entity.EchartsData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/19 9:43
 */
public interface Data {

    List<EchartsData> getNewProvinceData();

    List<EchartsData> getAreaDataByProvinceName(@Param("provinceName") String provinceName);

}
