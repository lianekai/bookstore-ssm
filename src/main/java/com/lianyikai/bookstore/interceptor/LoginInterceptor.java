package com.lianyikai.bookstore.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*
* 拦截器：
* 实现HandlerInterceptor接口，或者继承HandlerInterceptorAdapter这个父类
* preHandle方法：在适配器适配成功后，控制器执行目标方法前，调用preHandle方法
* 返回一个布尔值：true 表示请求可以继续，接下来会执行控制的目标方法。
*                false 表示请求到此为止，不会继续执行，包括控制器的方法也不会被调用。
* */


public class LoginInterceptor implements HandlerInterceptor {
    private static String[] arr={
            "/fpc/finddata","bc/showbook","lc/login"
    };
    public static boolean checkUrl(String requestname){
        if(requestname==null||requestname.equals(""))
        {return true;}
        if(requestname.endsWith(".js")||requestname.endsWith(".css")||requestname.endsWith(".jpg")||requestname.endsWith(".png")||requestname.endsWith(".gif"))
        {return true;}
            for(int i=0;i<arr.length;i++){
            if(arr[i].equals(requestname)){
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("执行了preHandle方法~");
        HttpSession session=request.getSession();
        Object obj=session.getAttribute("myuser");
        String uri=request.getRequestURI();
        String contextpath=request.getContextPath();
        String requestname=uri.substring(contextpath.length()+1);
        if(obj==null){
            if(checkUrl(requestname)){
                return true;
            }
         request.getRequestDispatcher("/login.jsp").forward(request,response);
        return false;
        }
        else{
        return true;
        }
    }

    /*
    *  控制器的目标方法执行之后，要调用的内容
    * 前提：preHandler必须返回true，即会进入控制器执行相应的方法后才继续postHandle方法
    *
    * */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("执行了postHandle方法");

    }

    /*
    * 当完成请求处理的时候，在相应之前，要调用afterCompletion方法
    *一般用来释放资源
    * 前提：preHandler必须返回true，
    * */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("执行了afterCompletion方法");
    }
}