package com.cykj.admin.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cykj.admin.mapper.MenuConfigMapper;
import com.cykj.admin.service.MenuConfigService;
import com.cykj.pojo.Admin;
import com.cykj.pojo.LayUITree;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import java.util.*;

@Service
public class MenuConfigServiceImpl implements MenuConfigService {

    @Autowired
    private MenuConfigMapper menuConfigMapper;

    @Override
    public Object selectMenuConfig(int roleId) {
        List<LayUITree> trees = menuConfigMapper.selectAllMenus();
        List<Integer> idList = menuConfigMapper.selectRoleMenuId(roleId);
        Collections.sort(idList);
        HashMap<String, Object> map = new HashMap<>();
        map.put("trees", trees);
        map.put("idList", idList);

        return map;
    }

    @Override
    @Transactional
    public String changeRoleMenuTable(int roleId, String beforeArr, String afterArr) {
        //将字符创转换为json数组
        JSONArray before = JSONObject.parseArray(beforeArr);
        JSONArray after = JSONObject.parseArray(afterArr);
        List<Integer> insertList = compare(before, after);
        List<Integer> deleteList = compare(after, before);

        if (insertList != null && insertList.size() != 0) {

            //执行插入数据
            int i = menuConfigMapper.insertRoleMenu(roleId, insertList);
            //判断插入数据量和集合长度相等
            if (i != insertList.size()) {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();  //手动回滚事务
                return "error";
            }
        }
        if (deleteList != null && deleteList.size() != 0) {
            int j = menuConfigMapper.deleteRoleMenu(roleId, deleteList);
            if (j != deleteList.size()) {
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();  //手动回滚事务
                return "error";
            }
        }
        return "success";
    }

    //对两个json数组进行比较，当一个数组跟另一个数组有不同的元素，放在一个新的集合返回
    public List<Integer> compare(JSONArray t1, JSONArray t2) {
        List<Object> list1 = Arrays.asList(t1);
        List<Integer> list = new ArrayList<>();      //存放两个数组中不同的数据
        for (Object obj : t2) {
            if (!list1.contains(obj)) {
                list.add((Integer) obj);
            }
        }
        return list;
    }
}
