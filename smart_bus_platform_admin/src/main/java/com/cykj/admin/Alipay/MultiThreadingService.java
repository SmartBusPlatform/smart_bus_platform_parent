package com.cykj.admin.Alipay;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.mapper.AliPayMapper;
import com.cykj.pojo.Fee;
import com.cykj.pojo.LineSite;
import com.cykj.redis.util.RedisUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.sound.midi.Soundbank;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Service
public class MultiThreadingService {

    @Autowired
    private RedisUtil redisUtil;

    private Logger logger = LoggerFactory.getLogger(MultiThreadingService.class);

    @Autowired
    private AliPayMapper mapper;

    @Async
    public void executeAysncTask(Map<String, String> map) {

        Fee fee = new Fee();
        fee.setBusId(8);
        fee.setFeeTime(map.get("gmt_create"));
        fee.setSiteId(26);
        fee.setLineId(18);
        fee.setUserId(1);

        int i = mapper.insertByPay(fee);

    }

    //插入大量数据进redis
    @Async
    public void simulationData(Fee fee, int i) {
        String key = String.valueOf(new Date().getTime()+Math.random()*1000);
        redisUtil.set(key, JSON.toJSONString(fee));
        NewThread.redisKeyList.add(key);
        System.out.println("当前线程为="+i);

    }


}
