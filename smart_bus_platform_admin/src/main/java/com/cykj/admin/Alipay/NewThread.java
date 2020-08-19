package com.cykj.admin.Alipay;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.service.AddRedisService;
import com.cykj.pojo.Fee;
import com.cykj.redis.util.RedisUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class NewThread implements Runnable  {

    @Autowired
    private AddRedisService addRedisService;
    @Autowired
    private RedisUtil redisUtil;
    private Logger logger = LoggerFactory.getLogger(NewThread.class);
    public static volatile List<String> redisKeyList = new ArrayList<>();
    private boolean flag = true;

    public NewThread() {
        System.out.println("新线程启动");
        logger.info("新线程启动");
        new Thread(this).start();
    }

    @Override
    public void run() {
        System.out.println("线程run");
        int j = 0;
        while (flag) {
            if (redisKeyList != null && redisKeyList.size() != 0) {
                String remove = redisKeyList.remove(0);
                Object o = redisUtil.get(remove);
                String s = (String) o;
                Fee fee = JSON.parseObject(s, Fee.class);
                redisUtil.del(remove);
                int i = addRedisService.insertTestData(fee);
                if (i == 0) {
                    logger.info("数据插入失败");
                }
                j += i;
                logger.info("插入" + j + "条数据");
            }
        }
    }
}
