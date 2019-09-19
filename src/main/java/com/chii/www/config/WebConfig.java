package com.chii.www.config;

import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import com.guige.core.ext.i18n.filter.LocaleFilter;
import com.guige.mis.filter.JspFilter;
import com.guige.mis.listener.ContextListener;
import com.guige.mis.listener.OnlineUserListener;
import com.guige.oim.filter.CORSFilter;
import com.guige.oim.servlet.*;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * 对应web.xml
 *
 * @author songaw
 * @date 2018/7/17 9:10
 */
@Configuration
public class WebConfig {
    //----------------------Filter
    //跨域过滤器
    @Bean
    public FilterRegistrationBean corsRegistrationBean() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new CORSFilter());
        filterRegistrationBean.addUrlPatterns("/*");
        return filterRegistrationBean;
    }
    //字符集utf-8
    @Bean
    public FilterRegistrationBean characterRegistrationBean() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
        filterRegistrationBean.setFilter(characterEncodingFilter);
        filterRegistrationBean.addUrlPatterns("/*");
        //filterRegistrationBean.addInitParameter("encoding", "UTF-8");
        // filterRegistrationBean.addInitParameter("ForceEncoding", "true");
        return filterRegistrationBean;
    }
    //对jsp进行权限日志过滤
    @Bean
    public FilterRegistrationBean jspFilterRegistrationBean() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        JspFilter jspFilter = new JspFilter();
        filterRegistrationBean.setFilter(jspFilter);
        filterRegistrationBean.addUrlPatterns("*.do");
        return filterRegistrationBean;
    }

    /**
     * 如果session中没有设置locale串或者locale串不合法，默认采用request的locale，
     * @return
     */
    @Bean
    public FilterRegistrationBean localeRegistrationBean() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new LocaleFilter());
        filterRegistrationBean.addUrlPatterns("*.do");
        return filterRegistrationBean;
    }
    //阿里druid界面设置
    @Bean
    public FilterRegistrationBean webStatFilterRegistrationBean() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new WebStatFilter());
        filterRegistrationBean.addUrlPatterns("/*");
        filterRegistrationBean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
        return filterRegistrationBean;
    }



    //--------------------------------Listener

    @Bean
    public ServletListenerRegistrationBean<OnlineUserListener> onlineUserListenerRegistrationBean(){
        ServletListenerRegistrationBean<OnlineUserListener>
                sessionListener = new ServletListenerRegistrationBean<OnlineUserListener>(new OnlineUserListener());
        return sessionListener;

    }
    @Bean
    public ServletListenerRegistrationBean<ContextListener> contextListenerRegistrationBean(){
        ServletListenerRegistrationBean<ContextListener>
                sessionListener = new ServletListenerRegistrationBean<ContextListener>(new ContextListener());
        return sessionListener;

    }
//    --------------------------------------Servlet

    @Bean
    public ServletRegistrationBean dispatcher() {

        ServletRegistrationBean reg = new ServletRegistrationBean();
        DispatcherServlet dispatcherServlet = new DispatcherServlet();
        dispatcherServlet.setContextConfigLocation("classpath:config/core/spring-mvc.xml," +
                " classpath:config/core/dao/dao_authority.xml," +
                " classpath:config/core/dao/dao_manager.xml," +
                " classpath:config/core/dao/dao_oim.xml," +
                " classpath:config/core/dao/dao_oim_v2.xml," +
                " classpath:config/core/dao/dao_orgacus.xml," +
                " classpath:config/core/service/service_authority.xml," +
                " classpath:config/core/service/service_manager.xml," +
                " classpath:config/core/service/service_oim.xml," +
                " classpath:config/core/service/service_oim_v2.xml," +
                " classpath:config/core/service/service_orgacus.xml," +
                " classpath:config/client/i18n.xml," +
                " classpath:config/client/http.xml," +
                " classpath:config/client/action/action_main.xml," +
                " classpath:config/client/action/action_authority.xml," +
                " classpath:config/client/action/action_manager.xml," +
                " classpath:config/client/action/action_oim.xml," +
                " classpath:config/client/action/action_oim_v2.xml," +
                " classpath:config/client/action/action_orgacus.xml");
        reg.setServlet(dispatcherServlet);
        reg.addUrlMappings("*.do");
        reg.setLoadOnStartup(30);
        return reg;
    }


    //阿里druid界面设置
    @Bean
    public ServletRegistrationBean statViewServlet() {

        ServletRegistrationBean reg = new ServletRegistrationBean();
        reg.setServlet(new StatViewServlet());
        reg.addUrlMappings("/druid/*");
        reg.addInitParameter("loginUsername", "111");
        reg.addInitParameter("loginPassword", "111");
        return reg;
    }

}