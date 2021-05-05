package com.hqyj.xinguan.dao;

import com.hqyj.xinguan.entity.AreaInfo;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/20 17:24
 */
public interface AreaMapper {

    List<AreaInfo> queryAreaOfNewProvince(@Param("time") Date time,
                                      @Param("provinceName") String provinceName);

    List<AreaInfo> queryAreaOfProvinceByPage(@Param("time") Date time,
                                             @Param("provinceName") String provinceName,
                                             @Param("pageNumber") int pageNumber,
                                             @Param("pageSize") int pageSize);

    int countOfAreaInProvince(@Param("time") Date time,
                              @Param("provinceName") String provinceName);


    int updateAreaOfProvince(AreaInfo areaInfo);

    int insertAreaInProvince(AreaInfo areaInfo);

    AreaInfo queryAreaById(int id);

    AreaInfo queryAreaByTimeAndProvinceNameAndAreaName(@Param("time") Date time,
                                                       @Param("provinceName") String provinceName,
                                                       @Param("areaName") String areaName);

    int deleteAreaOneById(int id);

    int deleteAreaOneByTimeAndProvinceName(@Param("time") Date time,
                                           @Param("provinceName") String provinceName);

    AreaInfo queryAreaByName(@Param("areaName") String areaName,
                             @Param("time") Date time,
                             @Param("provinceName") String provinceName);
}
