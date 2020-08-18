package com.cykj.admin.mapper;

import com.cykj.pojo.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AdminMapper {
    public Admin login(Admin admin);

    public List<Admin> selectAdminList(@Param("e") Admin admin, @Param("start") int start, @Param("pageSize") int pageSize);

    public int selectListCount(@Param("e") Admin admin);

    public int add(Admin admin);

    public int update(Admin admin);

    public int delete(String[] ids);
    //重置密码
    public int resetPwd(Admin admin);
}
