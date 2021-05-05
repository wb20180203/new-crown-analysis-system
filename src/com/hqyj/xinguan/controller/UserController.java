package com.hqyj.xinguan.controller;

import com.hqyj.xinguan.entity.PageData;
import com.hqyj.xinguan.entity.User;
import com.hqyj.xinguan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 *
 * @Auther: 你的名字
 * @Date: 2021/03/15 14:19
 * @Version 1.0
 * @Description:
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {
    final static int DEFAULT_PAGE_NUMBER=1;
    final static int DEFAULT_PAGE_SIZE=5;

    @Autowired
    private UserService userService;
    //{"code":0, "msg"": "登陆成功"}
    //ResponseBody就是SpringMVC将返回值转成json格式的字符串，放到响应体里面而不是页面


    @ResponseBody
    @RequestMapping(value = "/login")
    public Map<String, Object> login(String username, String password, HttpSession httpSession) //对应ajax的参数, session在多次请求之间共享数据
    {

        Map<String, Object> result = new HashMap<>();
        User loginUser = userService.login(username, password);
        httpSession.setAttribute("loginUser", loginUser);
        if (loginUser != null)
        {
            result.put("code", 0);
            result.put("msg", "登陆成功");
        }
        else {
            result.put("code", -1);
            result.put("msg", "登陆失败");
        }
        return result;
    }


    @RequestMapping("/logout")
    public String logout(HttpSession httpSession, HttpServletRequest request){
        //清楚掉登陆时存储在session用户信息
        httpSession.removeAttribute("loginUser");
        String x = request.getContextPath();
        return "redirect: "+x+"/index.jsp"; //重定向 //../index.jsp
    }


    @RequestMapping(value = "/list")
    //MVC提供，用于jsp传递值
    public String list(ModelMap modelMap){
        //1.拿数据
        List<User> userList = userService.getAll();
        //2.传递给userList.jsp
        modelMap.addAttribute("userList", userList);
        // 返回userList页面，forward转发
        return "userList";
    }

    //分页查询
    @RequestMapping("listByPage")
    public String listByPage(Integer pageNumber, Integer pageSize, ModelMap modelMap){
        if(pageNumber == null){
            pageNumber = DEFAULT_PAGE_NUMBER;
        }
        if (pageSize == null){
            pageSize = DEFAULT_PAGE_SIZE;
        }
        PageData<User> pageData =  userService.getAllByPage(pageNumber, pageSize);
        modelMap.addAttribute("pageData", pageData);
        return "userList";
    }

    //搜索查询
    @RequestMapping("/querySome")
    public String querySome(String queryString, ModelMap modelMap){
        List<User> users = userService.getSome(queryString);
        PageData<User> pageData = new PageData<>();
        pageData.setListData(users);
        modelMap.addAttribute("pageData", pageData);
        return "userList";
    }


    //删除一个用户
    @RequestMapping("/remove")
    @ResponseBody
    public Map<String, Object> removeOne(Integer userId){
        Map<String, Object> result = new HashMap<>();

        if (userId == null) {
            result.put("code", -2);
            result.put("msg", "传递信息有误");
            return result;
        }

        boolean removed = userService.removeOneById(userId);
        //{"code": 0, "msg": "删除成功"}
        if(removed){
            result.put("code", 0);
            result.put("msg", "删除成功");
        }else {
            result.put("code", -1);
            result.put("msg", "删除失败");
        }
        return  result;
    }

    @RequestMapping("/add")
    public String add(){
        return "userAdd";
    }


    
    @ResponseBody
    @RequestMapping("/addDone")
    public Map<String,Object> addDone(User user){
        HashMap<String, Object> map = new HashMap<>();
        boolean b = userService.addOne(user);
        if(b){
            map.put("code",0);
            map.put("msg","添加用户成功");
        }else{
            map.put("code",-1);
            map.put("msg","添加用户失败");
        }
        return map;
    }


    @RequestMapping("/edit")
    public String edit(int userId,ModelMap modelMap){
        User user = userService.getOneById(userId);
        modelMap.addAttribute("editUser",user);
        return "edit";
    }


    @RequestMapping("/save")
    @ResponseBody
    public Map<String,Object> saveOne(User user){
        System.out.println("user: "+user);
        boolean bool = userService.modifyOne(user);
        HashMap<String, Object> map = new HashMap<>();
        if(bool==true){
            map.put("code",1);
            map.put("msg","保存成功");
        }else{
            map.put("code",-1);
            map.put("msg","保存失败");
        }
        return map;
    }


    @RequestMapping("/stop")
    @ResponseBody
    public Map<String,Object> stop(int userId){
        HashMap<String, Object> map = new HashMap<>();
        Boolean aBoolean = userService.stopStatus(userId);
        if(aBoolean==true){
            map.put("code",1);
            map.put("msg","保存成功");
        }else{
            map.put("code",-1);
            map.put("msg","保存失败");
        }
        return map;
    }

    @RequestMapping("/start")
    @ResponseBody
    public Map<String,Object> start(int userId){
        HashMap<String, Object> map = new HashMap<>();
        Boolean aBoolean = userService.startStatus(userId);
        if(aBoolean==true){
            map.put("code",1);
            map.put("msg","保存成功");
        }else{
            map.put("code",-1);
            map.put("msg","保存失败");
        }
        return map;
    }
}
