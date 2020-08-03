package com.cykj.admin.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cykj.admin.service.MenuConfigService;
import com.cykj.pojo.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@RequestMapping("menuConfigController")
@Controller
public class MenuConfigController {

    @Autowired
    private MenuConfigService menuConfigService;


    //按照角色的id去查找原本有的菜单设置为被选中状态
    @RequestMapping("selectMenuConfig")
    @ResponseBody
    public String selectMenuConfig(HttpServletRequest request, int roleId) {
        HashMap<String, Object> map = (HashMap<String, Object>) menuConfigService.selectMenuConfig(roleId);
        return JSON.toJSONString(map);
    }


    @RequestMapping("changeRoleMenuTable")
    @ResponseBody
    //@RequestParam("beforeId[]") List<Integer> beforeId, @RequestParam("afterId[]") List<Integer> afterId
    public String changeRoleMenuTable(int roleId,String beforeId, String afterId) {
        //实现对前端数组的接收
//        System.out.println(beforeId);
//        System.out.println(afterId);
//        JSONArray a = JSONObject.parseArray(beforeId);
//        System.out.println(a.size());
//        JSONArray b = JSONObject.parseArray(afterId);
//        System.out.println(b.size());
//        System.out.println(a);
//        System.out.println(b);

        String str = menuConfigService.changeRoleMenuTable(roleId, beforeId, afterId);

        return str;
    }

}
