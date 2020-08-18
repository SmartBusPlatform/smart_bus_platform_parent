package com.cykj.admin.Alipay;

import com.cykj.admin.mapper.AliPayMapper;
import com.cykj.pojo.Fee;
import com.cykj.pojo.LineSite;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;



@Service
public class MultiThreadingService {

    private Logger logger = LoggerFactory.getLogger(MultiThreadingService.class);
    private static List<String> redisKeyList = new ArrayList<>();

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

    @Async
    public int simulationData(Fee fee) {


        int j = mapper.insertByPay(fee);

        return 0;
    }
}
