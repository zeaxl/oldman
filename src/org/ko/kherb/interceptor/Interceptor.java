package org.ko.kherb.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ko.kherb.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);

	static final String[] EXCLUDE_URL_LIST = { "/admin", "/login", "/join", "/index", "/resources", 
			"/idCheck", "/pro", "/kakao", "/emailAuth", "/cart", "idSearch", "pwSearch" };
	static final String[] EXCLUDE_SESSION_LIST = { "/admin", "/login", "/join", "/index", "/idCheck", "/kakao", "/callback", "/logout", "/login/joinSNS", "/login/callback",
			"/emailAuth", "/cart/insert", "idSearch", "pwSearch"};

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String url = request.getRequestURL().toString();
		HttpSession session = request.getSession();

		if(request.getParameter("valueArr")!=null) {
			session.setAttribute("valueArr", request.getParameter("valueArr"));
		}
		
		if (url.indexOf("resources") < 0) {
			int sum=0;
			for(String target:EXCLUDE_SESSION_LIST) {
				if(url.indexOf(target) < 0) {
					sum += url.indexOf(target);
				}
			}
			if(sum==-14) {
				String reqUrl = url;
				session.setAttribute("reqUrl", reqUrl);
				System.out.println("reqUrl : " + reqUrl);
			}
		}

		
		/* 로그인 체크 제외 리스트 */
		for (String target : EXCLUDE_URL_LIST) {
			if (url.indexOf(target) > -1) {
				return true;
			}
		}

		MemberVO userId = (MemberVO) session.getAttribute("sessionMember");
		
		if (userId == null) {
			logger.info(">> interceptor catch!!! userId is null.. ");
		
			
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		return true;
	}
}
