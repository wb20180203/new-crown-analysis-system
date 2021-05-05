package com.hqyj.xinguan.service;

import com.hqyj.xinguan.entity.PageData;
import com.hqyj.xinguan.entity.User;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @Auther: 你的名字
 * @Date: 2021/03/14 17:30
 * @Version 1.0
 * @Description:
 */
public interface UserService {
    List<User> getAll();
    User login(String username, String password); // 实现登陆
    //分页查询全部用户数据
    PageData<User> getAllByPage(int pageNumber, int pageSize);

    int getTotalPageCount();

    List<User> getSome(String querySting);

    boolean removeOneById(Integer id);

    //添加一个用户的信息
    boolean addOne(User user);

    //查看用户
    User getOneById(int id);

    //更新用户
    boolean modifyOne(User user);

    Boolean stopStatus(int id);
    Boolean startStatus(int id);
}

