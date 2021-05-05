package com.hqyj.xinguan.service.impl;

import com.hqyj.xinguan.dao.AreaMapper;
import com.hqyj.xinguan.dao.InfoDao;
import com.hqyj.xinguan.entity.AreaInfo;
import com.hqyj.xinguan.entity.PageData;
import com.hqyj.xinguan.entity.Province;
import com.hqyj.xinguan.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/20 17:28
 */
@Service
public class AreaServiceImpl implements AreaService {
    @Autowired
    private AreaMapper areaMapper;
    @Autowired
    private InfoDao infoDao;


    @Override
    public int getTotalOfAreaInProvince(String date, String province) {
        return areaMapper.countOfAreaInProvince(Date.valueOf(date),province);
    }

    @Override
    public PageData<AreaInfo> queryAreasInProvince(String date, String province, int pageSize, int pageNum) {
        int total = getTotalOfAreaInProvince(date,province); // 记录数
        int totalPageCount = total / pageSize;
        if (total % pageSize != 0) {
            totalPageCount += 1;
        }

        List<AreaInfo> areaInfos = areaMapper.queryAreaOfProvinceByPage(Date.valueOf(date),province,(pageNum-1)*pageSize, pageSize);
        PageData<AreaInfo> areaInfoPageData = new PageData<>();
        areaInfoPageData.setPageNumber(pageNum);
        areaInfoPageData.setPageSize(pageSize);

        if(pageNum <= totalPageCount && pageNum >1)
        {
            areaInfoPageData.setPrevious(pageNum-1);
        }else {
            areaInfoPageData.setPrevious(1);
        }
        if(pageNum < totalPageCount && pageNum >=1)
        {
            areaInfoPageData.setNextPage(pageNum+1);
        }else {
            areaInfoPageData.setNextPage(totalPageCount);
        }
        areaInfoPageData.setTotalPage(totalPageCount);
        areaInfoPageData.setTotalSize(total);
        areaInfoPageData.setListData(areaInfos);
        return areaInfoPageData;
    }

    @Override
    @Transactional
    public Boolean updateArea(AreaInfo areaInfo) {

        AreaInfo oldAreaInfo = areaMapper.queryAreaById(areaInfo.getId());
        Province province = infoDao.getProvinceByTimeAndName(areaInfo.getTime(),areaInfo.getProvinceName());

        int newConfirmCount=areaInfo.getConfirmCount()-oldAreaInfo.getConfirmCount();
        province.setConfirmCount(province.getConfirmCount()+newConfirmCount);

        int newCuredCount=areaInfo.getCuredCount()-oldAreaInfo.getCuredCount();
        province.setCuredCount(province.getCuredCount()+newCuredCount);

        int newDeadCount=areaInfo.getDeadCount()-oldAreaInfo.getDeadCount();
        province.setDeadCount(province.getDeadCount()+newDeadCount);

        int i = areaMapper.updateAreaOfProvince(areaInfo);
        int i1 = infoDao.updateProvinceById(province);


        if(i>0 && i1>0){
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public Boolean insertArea(AreaInfo areaInfo) {

        Province province = infoDao.getProvinceByTimeAndName(areaInfo.getTime(), areaInfo.getProvinceName());

        province.setConfirmCount(province.getConfirmCount()+areaInfo.getConfirmCount());
        province.setCuredCount(province.getCuredCount()+areaInfo.getCuredCount());
        province.setDeadCount(province.getDeadCount()+areaInfo.getDeadCount());

        int i = areaMapper.insertAreaInProvince(areaInfo);
        int i1 = infoDao.updateProvinceById(province);


        if(i>0 && i1>0){
            return true;
        }
        return false;
    }

    @Override
    public AreaInfo queryAreaById(int id) {
        AreaInfo areaInfo = areaMapper.queryAreaById(id);
        return areaInfo;
    }

    @Override
    public AreaInfo queryAreaByName(String areaName,String time,String provinceName) {
        return areaMapper.queryAreaByName(areaName,Date.valueOf(time),provinceName);
    }

    @Override
    @Transactional
    public Boolean deleteArea(String time,String province,int id) {
        AreaInfo areaInfo = queryAreaById(id);
        Province province1 = infoDao.getProvinceByTimeAndName(Date.valueOf(time), province);

        province1.setConfirmCount(province1.getConfirmCount()-areaInfo.getConfirmCount());
        province1.setCuredCount(province1.getCuredCount()-areaInfo.getCuredCount());
        province1.setDeadCount(province1.getDeadCount()-areaInfo.getDeadCount());

        int i1 = infoDao.updateProvinceById(province1);
        int i = areaMapper.deleteAreaOneById(id);

        if(i>0 && i1>0){
            return true;
        }
        return false;
    }

    @Override
    public AreaInfo queryAreaByTimeAndProvinceNameAndAreaName(Date time, String provinceName, String areaName) {
        return areaMapper.queryAreaByTimeAndProvinceNameAndAreaName(time,provinceName,areaName);
    }
}
