package com.cykj.admin.mapper;


import com.cykj.pojo.LogInfo;

import java.util.List;

public interface LogMapper  {
    public int insert(LogInfo logInfo);

    public List<LogInfo> findAll();
}
