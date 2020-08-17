package com.cykj.zuul.filter;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//@Component
public class TokenFilter extends ZuulFilter
{
    @Override
    public String filterType() {//过滤器的类型
        return "pre";
    }

    @Override
    public int filterOrder() {//过滤器执行的顺序 一个请求在同一个阶段存在多个过滤器时候，多个过滤器执行顺序问题
        return 0;
    }

    @Override
    public boolean shouldFilter() {//判断过滤器是否生效
        //1.获得工具类(请求上下文对象)
        RequestContext requestContext = RequestContext.getCurrentContext();
        //2.通过工具类获得request对象
        HttpServletRequest request = requestContext.getRequest();
        //需要注意,这里查询路径用的是string 不是stringbuilder
        String requestURI = request.getRequestURI();
        System.out.println(requestURI);
        //判断路径是否相同
        if ("/admin/manager/admin_log".equals(requestURI)||("/admin/adminControl/login").contains(requestURI)) {
            //不向下执行
            return false;
        }else if(request.getRequestURI().contains("/static")&&(request.getRequestURI().contains(".js")||request.getRequestURI().contains(".css")||request.getRequestURI().contains(".png"))){
            return false;
        }
        //放行
        return true;
    }

    @Override
    public Object run() throws ZuulException {
        RequestContext currentContext = RequestContext.getCurrentContext();
        //获取request对象
        HttpServletRequest request = currentContext.getRequest();

        if(request.getRequestURI().contains("/static")&&(request.getRequestURI().contains(".js")||request.getRequestURI().contains(".css"))){
            return null;
        }else{
            if(request.getSession().getAttribute("admin")==null){
                currentContext.setSendZuulResponse(false);  //false  不会继续往下执行 不会调用服务接口了 网关直接响应给客户了
                currentContext.setResponseBody("no no no  you have not userToken");
                currentContext.setResponseStatusCode(401);
                return null;
            }
        }
        return null;

    }
}
