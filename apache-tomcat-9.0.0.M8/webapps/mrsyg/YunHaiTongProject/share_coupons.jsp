<%@ page contentType="text/html;charset=GBK" language="java" import="java.net.*" %>
<%
    Object obj = session.getAttribute("user_info");
    if(obj == null) {
        System.out.println("�û�δ��¼");
        // �û�δ��¼
        session.setAttribute("call_backurl", "/mrsyg/YunHaiTongProject/coupon_center.jsp?" + request.getQueryString());
        request.getRequestDispatcher("/YunHaiTongProject/user_login.jsp").forward(request,response);
    } else {
        // �û��Ѿ���¼
        System.out.println("�û��ѵ�¼");
        response.sendRedirect("/mrsyg/YunHaiTongProject/coupon_center.jsp?" + request.getQueryString());
    }
%>