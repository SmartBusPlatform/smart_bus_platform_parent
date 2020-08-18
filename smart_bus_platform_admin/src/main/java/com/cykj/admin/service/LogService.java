package com.cykj.admin.service;

import com.cykj.pojo.LogInfo;
import com.cykj.pojo.PageBean;
import com.cykj.util.Result;

public interface LogService {
    public int insert(LogInfo logInfo);

    public Result findAll(int startSize, int pageSize);
}
