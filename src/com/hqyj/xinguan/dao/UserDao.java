package com.hqyj.xinguan.dao;

import com.hqyj.xinguan.entity.PageData;
import com.hqyj.xinguan.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 *
 * @Auther: 你的名字
 * @Date: 2021/03/14 16:02
 * @Version 1.0
 * @Description:
 */
public interface UserDao {
    List<User> queryAll();
    //查询user表, 成功返回User不超过返回null
    User queryByUsernameAndPassword(@Param("userName") String username, @Param("password") String password);

    Integer queryAllCount();

    List<User> getAllByPage(@Param("pageNumber") int pageNumber, @Param("pageSize") int pageSize);

    //模糊查询， 用户昵称、手机
    List<User> querySome(String queryString);
    //删除一个用户, 返回数据库影响的几行
    int deleteOneById(Integer id);

    // 添加一个用户信息, 采用一个USER对象来封装

    int insertOne(User user);

    //查询一个用户
    User queryOneById(@Param("id") int id);

    //更新用户信息,使用用户id确定更新的用户
    int updateOne(User user);

    //停止用户状态
    int stopStatus(int id);

    //启动用户
    int startStatus(int id);
 }
