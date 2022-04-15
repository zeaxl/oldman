package org.ko.kherb.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ko.kherb.vo.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);

//	static final String[] EXCLUDE_URL_LIST = { "/admin/login" };
	static final String EXCLUDE_URL = "/admin/login";

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String adreqUrl = request.getRequestURL().toString();

		if (adreqUrl.indexOf(EXCLUDE_URL) > -1) {
			System.out.println("가");
			return true;
		}

		/*
		 * 로그인 체크 제외 리스트 for (String target : EXCLUDE_URL_LIST) { if
		 * (reqUrl.indexOf(target) > -1) { System.out.println("가"); return true; } }
		 */
		HttpSession session = request.getSession();
		MemberVO userId = (MemberVO) session.getAttribute("sessionMember");

		// 일반회원 관리자 url 접근 불가
		if (userId != null) {
			if (!userId.getId().equals("admin")) {

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('접근 불가'); location.href='/kherb'; </script>");
				out.flush();
				out.close();

				// response.sendRedirect(request.getContextPath() + "/");
				return false;
			}
		}

		if (userId == null) {
			logger.info(">> interceptor catch!!! userId is null.. ");

			session.setAttribute("adreqUrl", adreqUrl);

			response.sendRedirect(request.getContextPath() + "/admin/login");
			return false;
		}

		return true;
	}
}