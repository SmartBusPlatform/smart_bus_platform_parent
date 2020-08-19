package com.cykj.admin.aop;

import com.alibaba.fastjson.JSON;
import com.cykj.admin.bean.CookieUtils;
import com.cykj.admin.service.LogService;
import com.cykj.pojo.Admin;
import com.cykj.pojo.LogInfo;
import com.cykj.redis.util.RedisUtil;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

@Component
@Aspect
public class SystemLogAspect {
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private LogService logService;
    @Pointcut("execution (* com.cykj.admin.service..*.*(..))")
    public  void serviceAspect() {
    }
    @Pointcut("execution (* com.cykj.admin.feign.*.*(..))")
    public  void feignAspect() {
    }
//    @Before("serviceAspect()||feignAspect()")
//    public void doBefore(JoinPoint joinPoint) {
//        System.out.println("==========执行service前置通知===============");
//
//    }

    @After("serviceAspect()||feignAspect()")
    public  void after(JoinPoint joinPoint) throws Throwable{
        if(((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())==null){
            return;
        }
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        String token = CookieUtils.getCookieValue(request, "admin_token");
        if(token!=null){
            String adminJson = (String) redisUtil.get(token);
            if(adminJson!=null&&!"".equals(adminJson)) {
                Admin admin = JSON.parseObject(adminJson, Admin.class);
                if(admin!=null){
                    String targetName = joinPoint.getTarget().getClass().getName();
                    System.out.println("targetName:"+targetName);
                    String methodName = joinPoint.getSignature().getName();
                    System.out.println("methodName:"+methodName);
                    Object[] arguments = joinPoint.getArgs();
                    Class targetClass = Class.forName(targetName);
                    Method[] methods = targetClass.getMethods();
                    String operationType = "";
                    String operationName = "";
                    for (Method method : methods) {
                        if (method.getName().equals(methodName)) {

                            Class[] clazzs = method.getParameterTypes();
                            if(clazzs!=null&&arguments!=null){
                                if (clazzs.length == arguments.length) {
                                    if(method.getAnnotation(Log.class)!=null){
                                        operationType = method.getAnnotation(Log.class).operationType();
                                        operationName = method.getAnnotation(Log.class).operationName();
                                        break;
                                    }

                                }
                            }

                        }
                    }
                    if(operationName!=null&&!"".equals(operationName)&&operationType!=null&&!"".equals(operationType)){
                        System.out.println("=====controller后置通知开始=====");
                        System.out.println("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+"."+operationType);
                        System.out.println("方法描述:" + operationName);
                        System.out.println("请求人:" + admin.getName());
                        LogInfo logInfo = new LogInfo();
                        logInfo.setOperator(admin.getName());
                        logInfo.setOperation(operationName);
                        logInfo.setType(operationType);
                        logService.insert(logInfo);
                    }

                }

            }
        }
    }
}
