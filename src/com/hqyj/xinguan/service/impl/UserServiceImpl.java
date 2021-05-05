package com.hqyj.xinguan.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.xinguan.dao.UserDao;
import com.hqyj.xinguan.entity.PageData;
import com.hqyj.xinguan.entity.User;
import com.hqyj.xinguan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @Auther: 你的名字
 * @Date: 2021/03/14 17:32
 * @Version 1.0
 * @Description:
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Override
    public List<User> getAll() {
        return userDao.queryAll();
    }


    @Override
    public PageData<User> getAllByPage(int pageNumber, int pageSize) {

        int total =userDao.queryAllCount(); // 记录数
        int totalPageCount = total / pageSize;
        if (total % pageSize != 0) {
            totalPageCount += 1;
        }

        List<User> Users = userDao.getAllByPage((pageNumber-1)*pageSize, pageSize);
        PageData<User> users = new PageData<>();
        users.setPageNumber(pageNumber);
        users.setPageSize(pageSize);

        if(pageNumber <= totalPageCount && pageNumber >1)
        {
            users.setPrevious(pageNumber-1);
        }else {
            users.setPrevious(1);
        }
        if(pageNumber < totalPageCount && pageNumber >=1)
        {
            users.setNextPage(pageNumber+1);
        }else {
            users.setNextPage(totalPageCount);
        }
        //System.out.println("总页数："+totalPageCount);
        users.setTotalPage(totalPageCount);
        users.setTotalSize(total);
        users.setListData(Users);
        return users;

    }

    @Override
    public int getTotalPageCount() {
        return userDao.queryAllCount();
    }

    @Override
    public boolean removeOneById(Integer id) {

        int affectedRows =  userDao.deleteOneById(id);
        return affectedRows>0;
    }

    @Override
    public Boolean stopStatus(int id) {
        return userDao.stopStatus(id)>0;
    }

    @Override
    public Boolean startStatus(int id) {
        return userDao.startStatus(id)>0;
    }

    @Override
    public boolean modifyOne(User user) {
        if(user==null){
            return false;
        }

        //affectedRows表示影响数据库的行数
        int affectedRows = userDao.updateOne(user);
        return affectedRows>0;
    }

    @Override
    public boolean addOne(User user) {
        if (user == null){
            return false;
        }
        try {
            int added = userDao.insertOne(user);
            return added>0;
        }catch (DataAccessException e){ //
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User getOneById(int id) {
        return userDao.queryOneById(id);
    }

    @Override
    public List<User> getSome(String querySting) {
        String newQueryString = "%";
        if (querySting != null) {
            newQueryString = "%" +querySting+"%";
        }
        List<User> users = userDao.querySome(newQueryString);
        return users;
    }
    @Override
    public User login(String username, String password) {
        if (username == null   || password == null)
        {
            return null;
        }
        return userDao.queryByUsernameAndPassword(username, password);
    }
    //    public PageData<User> getAllByPage(int pageNumber, int pageSize) {
//
//        // 利用pagehelper插件来分页控制mybatis
//        PageHelper.startPage(pageNumber, pageSize);
//        List<User> users =  userDao.queryAll();
//        PageInfo<User> pageInfo = new PageInfo<User>(users);
//        PageData<User> pageData = new PageData<>();
//        pageData.setPageNumber(pageNumber);
//        pageData.setPageSize(pageSize);
//
//        if (pageInfo.isHasPreviousPage()){
//            pageData.setPrevious(pageInfo.getPrePage());
//        }else{
//            pageData.setPrevious(1); //没有上一页，上一页设为1
//        }
//        if(pageInfo.isHasNextPage()){
//            pageData.setNextPage(pageInfo.getNextPage());
//        }else {
//            pageData.setNextPage(pageInfo.getPages()); // 没有尾页设为尾页
//        }
//        pageData.setTotalPage(pageInfo.getPages());
//
//        pageData.setTotalSize(pageInfo.getTotal());
//
//        pageData.setListData(pageInfo.getList());
//        return pageData;
//    }


}
