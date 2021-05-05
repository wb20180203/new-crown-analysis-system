package com.hqyj.xinguan.service.impl;

import com.hqyj.xinguan.dao.UserDao;
import com.hqyj.xinguan.entity.User;
import com.hqyj.xinguan.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.ParameterResolutionDelegate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created with IntelliJ IDEA.
 *
 * @Auther: 你的名字
 * @Date: 2021/03/15 8:27
 * @Version 1.0
 * @Description:
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:config/spring.xml")
public class UserServiceImplTest {

    @Autowired
    private UserService userService;
    @Test
    public void getAll() {
        System.out.println(userService.getAll());
    }
    @Test
    public void login() {
        System.out.println(userService.login("lisi", "123456"));
    }
    @Test
    public void listByPage() {
        int pageNumber =1;
        int pageSize=2;
        System.out.println(userService.getAllByPage(pageNumber, pageSize));
    }
    @Test
    public void querySome() {
        String queryString = "136";
        List<User> users = userService.getSome(queryString);
        for(User user: users){
            System.out.println(user);
        }
    }
    @Test
    public void removeOne(){
        int id=10;
        boolean r = userService.removeOneById(id);

        if (r){
            System.out.println("成功");
        }
        else {
            System.out.println("失败");
        }
    }
    @Test
    public void addOne(){
        User user = new User();
        user.setName("老王ff");
        user.setAge(20);
        user.setPhone("13886542664");
        user.setEmail("202@qq.com");
        user.setUserName("laowanghhh");
        user.setAddress("四川");
        user.setPassword("235412");
        if ( userService.addOne(user)){
            System.out.println("成功！");
        }else {
            System.out.println("插入失败");
        }
    }

    @Test
    public void getOneById(){
        User oneById = userService.getOneById(3);
        System.out.println(oneById);
    }

    @Test
    public void updateOne(){
        User user = new User();
        user.setName("老王");
        user.setAge(20);
        user.setPhone("13886542664");
        user.setEmail("202@qq.com");
        user.setUserName("laowanghhh");
        user.setAddress("四川");
        user.setPassword("235412");
        user.setId(9);

        boolean b = userService.modifyOne(user);
        System.out.println(b);
    }
}