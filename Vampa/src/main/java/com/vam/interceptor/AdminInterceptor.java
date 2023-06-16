package com.vam.interceptor;

import com.vam.model.MemberVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    HttpSession session = request.getSession();
    MemberVO lvo = (MemberVO)session.getAttribute("member");
    System.out.println(lvo.getAdminCk());
    if (lvo == null || lvo.getAdminCk() == 0) {
      response.sendRedirect("/main");
      return false;
    } 
    return true;
  }
}
