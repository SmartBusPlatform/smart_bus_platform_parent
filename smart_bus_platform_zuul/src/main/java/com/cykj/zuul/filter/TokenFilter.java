package com.cykj.zuul.filter;

import com.alibaba.fastjson.JSON;
import com.cykj.pojo.Admin;
import com.cykj.redis.util.RedisUtil;
import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Component
public class TokenFilter extends ZuulFilter
{
    @Autowired
    private RedisUtil redisUtil;
    //非拦截地址
    private List<String> paths;
    public TokenFilter() {
        super();
        paths = new ArrayList<>();
        paths.add("/admin/manager/admin_log");
        paths.add("/admin/adminControl/login");
        paths.add("/userapp/**");
        paths.add("/static/**");
        paths.add("/**/swagger**/**");
        paths.add("/**/v2/api-docs");
        paths.add("/**/*.css");
        paths.add("/**/*.jpg");
        paths.add("/**/*.png");
        paths.add("/**/*.gif");
        paths.add("/**/*.js");
        paths.add("/**/*.svg");
    }
    @Override
    public String filterType() {//过滤器的类型
        return "pre";
    }

    @Override
    public int filterOrder() {//过滤器执行的顺序 一个请求在同一个阶段存在多个过滤器时候，多个过滤器执行顺序问题
        return 2;
    }

    @Override
    public boolean shouldFilter() {//判断过滤器是否生效
        RequestContext requestContext = RequestContext.getCurrentContext();
        HttpServletRequest request = requestContext.getRequest();
        String uri=request.getRequestURI();
        PathMatcher matcher = new AntPathMatcher();
        Optional<String> optional =paths.stream().filter(t->matcher.match(t,uri)).findFirst();
        return !optional.isPresent();
//        //1.获得工具类(请求上下文对象)
//        RequestContext requestContext = RequestContext.getCurrentContext();
//        //2.通过工具类获得request对象
//        HttpServletRequest request = requestContext.getRequest();
//        //需要注意,这里查询路径用的是string 不是stringbuilder
//        String requestURI = request.getRequestURI();
//        System.out.println(requestURI);
//        //判断路径是否相同
//        if ("/admin/manager/admin_log".equals(requestURI)||("/admin/adminControl/login").contains(requestURI)) {
//            //不向下执行
//            return false;
//        }else if(request.getRequestURI().contains("/static")&&(request.getRequestURI().contains(".js")||request.getRequestURI().contains(".css")||request.getRequestURI().contains(".png"))){
//            return false;
//        }
//        //放行
//        return true;
    }

    @Override
    public Object run() throws ZuulException {
        RequestContext currentContext = RequestContext.getCurrentContext();
        //获取request对象
        HttpServletRequest request = currentContext.getRequest();
        HttpServletResponse response = currentContext.getResponse();
        String token = CookieUtils.getCookieValue(request, "admin_token");
        System.out.println(token);
        if(token==null&& "".equals(token)){
            currentContext.setSendZuulResponse(false);
            currentContext.setResponseStatusCode(401);
            currentContext.getResponse().setContentType("text/html;charset=UTF-8");
            currentContext.setResponseBody("<script>alert('您的授权登录已过期');if(self!=top){top.location=self.location};location.href='/admin/manager/admin_log';</script>");
        }else{
            String adminJson = (String) redisUtil.get(token);
            System.out.println(adminJson);
            if(adminJson!=null&&!"".equals(adminJson)){
                Admin admin = JSON.parseObject(adminJson, Admin.class);
                System.out.println(admin);
                if(admin!=null){
                    return null;
                }else{
                    currentContext.setSendZuulResponse(false);
                    currentContext.setResponseStatusCode(401);
                    currentContext.getResponse().setContentType("text/html;charset=UTF-8");
                    currentContext.setResponseBody("<script>alert('您的授权登录已过期');if(self!=top){top.location=self.location};location.href='/admin/manager/admin_log';</script>");

                }
            }else{
                currentContext.setSendZuulResponse(false);
                currentContext.setResponseStatusCode(401);
                currentContext.getResponse().setContentType("text/html;charset=UTF-8");
                currentContext.setResponseBody("<script>alert('您的授权登录已过期');if(self!=top){top.location=self.location};location.href='/admin/manager/admin_log';</script>");
            }

        }
        return null;

    }
}
