package com.hqyj.xinguan.service.impl;

import com.hqyj.xinguan.dao.AreaMapper;
import com.hqyj.xinguan.dao.InfoDao;
import com.hqyj.xinguan.entity.AreaInfo;
import com.hqyj.xinguan.entity.PageData;
import com.hqyj.xinguan.entity.Province;
import com.hqyj.xinguan.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;

/**
 * @description:
 * @author:lifu
 * @date:2021/3/19 17:11
 */
@Service
public class InfoServiceImpl implements InfoService {
    @Autowired
    private InfoDao infoDao;
    @Autowired
    private AreaMapper areaMapper;

    @Override
    public PageData<Province> getProvinceByPage(int pageNumber, int pageSize) {
        int total =infoDao.queryProvinceAllCount(); // 记录数
        int totalPageCount = total / pageSize;
        if (total % pageSize != 0) {
            totalPageCount += 1;
        }

        List<Province> provinces = infoDao.queryProvince((pageNumber-1)*pageSize, pageSize);
        PageData<Province> provincePageData = new PageData<>();
        provincePageData.setPageNumber(pageNumber);
        provincePageData.setPageSize(pageSize);

        if(pageNumber <= totalPageCount && pageNumber >1)
        {
            provincePageData.setPrevious(pageNumber-1);
        }else {
            provincePageData.setPrevious(1);
        }
        if(pageNumber < totalPageCount && pageNumber >=1)
        {
            provincePageData.setNextPage(pageNumber+1);
        }else {
            provincePageData.setNextPage(totalPageCount);
        }
        provincePageData.setTotalPage(totalPageCount);
        provincePageData.setTotalSize(total);
        provincePageData.setListData(provinces);
        return provincePageData;
    }

    @Override
    @Transactional
    public Boolean deleteProvince(int id) {
        Province province = getOneById(id);
        int i = areaMapper.deleteAreaOneByTimeAndProvinceName(Date.valueOf(province.getTime()), province.getProvinceName());
        if(i>0){
            return true;
        }
        return false;
    }

    @Override
    public Province getOneById(int id) {
        return infoDao.getProvinceById(id);
    }

    @Override
    public Province getOneByTimeAndName(Date time, String name) {
        return infoDao.getProvinceByTimeAndName(time,name);
    }

    @Override
    public boolean updateProvinceById(Province province) {
        int i = infoDao.updateProvinceById(province);
        if(i>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean insertProvince(Province province) {
        List<AreaInfo> areaInfos = areaMapper.queryAreaOfNewProvince(Date.valueOf(province.getTime()), province.getProvinceName());

        int confirmCount=0;
        int curedCount=0;
        int deadCount=0;

        for (AreaInfo one:areaInfos) {
            confirmCount+=one.getConfirmCount();
            curedCount+=one.getCuredCount();
            deadCount+=one.getDeadCount();
        }

        province.setConfirmCount(confirmCount);
        province.setCuredCount(curedCount);
        province.setDeadCount(deadCount);

        int i = infoDao.insertProvince(province);

        if(i>0){
            return true;
        }
        return false;
    }

    @Override
    public PageData<Province> getSome(String date, String province,int pageSize,int pageNum) {
        List<Province> provinces=null;
        PageData<Province> pageData = new PageData<>();
        int total = getSomeTotal(date, province);
        int totalPageCount = total / pageSize;

        if (total % pageSize != 0) {
            totalPageCount += 1;
        }

        if(date==null || date==""){
            provinces = infoDao.querySomeProvince(null, province,(pageNum-1)*pageSize,pageSize);
        }else{
            provinces = infoDao.querySomeProvince(Date.valueOf(date),province,(pageNum-1)*pageSize,pageSize);
        }
        pageData.setTotalPage(totalPageCount);
        pageData.setPageNumber(pageNum);
        pageData.setPageSize(pageSize);

        if(pageNum <= totalPageCount && pageNum >1)
        {
            pageData.setPrevious(pageNum-1);
        }else {
            pageData.setPrevious(1);
        }
        if(pageNum < totalPageCount && pageNum >=1)
        {
            pageData.setNextPage(pageNum+1);
        }else {
            pageData.setNextPage(totalPageCount);
        }
        //System.out.println("总页数："+totalPageCount);
        pageData.setTotalPage(totalPageCount);
        pageData.setTotalSize(total);
        pageData.setListData(provinces);
        return pageData;
    }

    @Override
    public int getSomeTotal(String date, String province) {
        if(date==null || date==""){
            return infoDao.querySomeProvinceTotal(null,province);
        }
        return infoDao.querySomeProvinceTotal(Date.valueOf(date),province);
    }

}
