package com.hqyj.xinguan.dao;

import com.hqyj.xinguan.entity.Province;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/19 16:56
 */
public interface InfoDao {

    List<Province> queryProvince(@Param("pageNumber") int pageNumber, @Param("pageSize") int pageSize);

    int queryProvinceAllCount();

    int deleteProvince(int id);

    Province getProvinceById(int id);

    Province getProvinceByTimeAndName(@Param("time") Date time,
                                      @Param("provinceName") String provinceName);

    int updateProvinceById(Province province);

    int insertProvince(Province province);

    List<Province> querySomeProvince(@Param("time") Date time,
                                     @Param("provinceName") String provinceName,
                                     @Param("pageNum") int pageNum,
                                     @Param("pageSize") int pageSize);

    int querySomeProvinceTotal(@Param("time") Date time,
                               @Param("provinceName") String provinceName);

}
