package com.neuedu.interceptor;

import com.neuedu.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * springmvc的拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {

    /**
     * 在方法是在执行controller中方法之前执行
     * 如果此方法返回false，则控制器就不再执行controller中的方法
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //免登陆功能

        //拦截功能
        HttpSession httpSession = httpServletRequest.getSession();
        User user = (User) httpSession.getAttribute("user");
        if(user == null){
            httpServletResponse.sendRedirect("/empdemo/user/loginView");
            return false;
        }
        return true;
    }

    /**
     * 此方法在controller中方法执行完之后执行
     * 且在视图渲染之前
     *
     * 补救措施：少存值可以在这里存，多存了在这里删除
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    }

    /**
     * 此方法在controller中方法执行完之后执行
     * 且在视图渲染之后
     *
     * 清理工作和处理异常
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param e
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }
}
