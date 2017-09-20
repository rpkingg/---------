<%@ page contentType="text/html;charset=GBK" language="java" import="java.net.*" %>
<%
    Object obj = session.getAttribute("user_info");
    if(obj == null) {
        System.out.println("用户未登录");
        // 用户未登录
        session.setAttribute("call_backurl", "/mrsyg/YunHaiTongProject/coupon_center.jsp?" + request.getQueryString());
        request.getRequestDispatcher("/YunHaiTongProject/user_login.jsp").forward(request,response);
    } else {
        // 用户已经登录
        System.out.println("用户已登录");
        response.sendRedirect("/mrsyg/YunHaiTongProject/coupon_center.jsp?" + request.getQueryString());
    }
%>