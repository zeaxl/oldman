package org.ko.kherb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.ko.kherb.client.cart.service.ClientCartService;
import org.ko.kherb.client.member.service.ClientMemberService;
import org.ko.kherb.login.service.KakaoAPIService;
import org.ko.kherb.login.service.LoginService;
import org.ko.kherb.login.service.NaverLoginBO;
import org.ko.kherb.vo.CartVO;
import org.ko.kherb.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	@Autowired
	private KakaoAPIService kakaoAPIService;

	@Autowired
	private NaverLoginBO naverLoginBO;

	@Autowired
	private ClientMemberService clientMemberService;

	@Autowired
	private ClientCartService ClientCartService;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping(value="/")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(MemberVO vo, Model model, HttpSession session) {
		if (session.getAttribute("sessionMember") != null) {
			// 알림 추가? index로 이동?
			return "redirect:/";
		}
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginCheck(@Valid MemberVO member, BindingResult result, Model model, HttpSession session) {

		String reqUrl = (String) session.getAttribute("reqUrl");
		if (result.hasErrors()) {
			model.addAttribute("member", member);
			return "login";
		}

		MemberVO login = loginService.getPw(member);
		boolean mcodeMatch = false;
		boolean pwdMatch = false;
		if (login != null) {
			mcodeMatch = login.getMcode().equals(member.getMcode());
			pwdMatch = bCryptPasswordEncoder.matches(member.getPw(), login.getPw());
		}

		if (!pwdMatch || !mcodeMatch) {
			model.addAttribute("alertMsg", "아이디 혹은 비밀번호가 일치하지 않습니다.");
			return "login";
		} else {
			session.setAttribute("sessionMember", loginService.getID(member));
			session.removeAttribute("reqUrl");

			// 카트
			if (session.getAttribute("cartList") != null) {
				if (session.getAttribute("valueArr") != null) {
					System.out.println("주문하기");
					String valueArr = (String) session.getAttribute("valueArr");
					String[] valueArray = valueArr.split(",");

					List<CartVO> cartList = new ArrayList<CartVO>();
					cartList = (List<CartVO>) session.getAttribute("cartList");
					for (CartVO x : cartList) {
						x.setId(member.getId());
						ClientCartService.insertCart(x);
						for (int i = 0; i < valueArray.length; i++) {
							if (valueArray[i].equals(Integer.toString(x.getPno()))) {
								valueArray[i] = Integer.toString(loginService.getCno());
							}
						}

					}
					session.setAttribute("cno", valueArray);
					System.out.println(Arrays.toString(valueArray));
				} else {
					System.out.println("장바구니만");
					List<CartVO> cartList = new ArrayList<CartVO>();
					cartList = (List<CartVO>) session.getAttribute("cartList");
					for (CartVO x : cartList) {
						x.setId(member.getId());
						ClientCartService.insertCart(x);
					}
				}

				session.removeAttribute("cartList");

			}

			if (reqUrl == null)
				return "redirect:/";
			else
				return "redirect:" + reqUrl;
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("logout 진입");
		session.invalidate();
		return "redirect:/";
	}

	// 네이버 로그인
	@RequestMapping(value = "/login/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, MemberVO member,
			HttpSession session) throws IOException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result", apiResult);

		System.out.println("============dddd===================");
		System.out.println("responseBody : " + apiResult);
		session.setAttribute("sns", "naver");

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(apiResult);
		JsonObject properties = element.getAsJsonObject().get("response").getAsJsonObject();
		member.setEmail(properties.getAsJsonObject().get("email").getAsString());

		int emailResult = loginService.getMemberByEmail(member);
		if (emailResult == 0) {
			member.setName(properties.getAsJsonObject().get("name").getAsString());
			member.setHp("0" + properties.getAsJsonObject().get("mobile_e164").getAsString().substring(3));

			session.setAttribute("snsMember", member);

			return "redirect:/login/joinSNS";
		} else {
			MemberVO snsMember = loginService.getMember(member);

			String reqUrl = (String) session.getAttribute("reqUrl");
			session.removeAttribute("reqUrl");
			session.setAttribute("sessionMember", snsMember);

			// 카트
			if (session.getAttribute("cartList") != null) {
				if (session.getAttribute("valueArr") != null) {
					System.out.println("주문하기");
					String valueArr = (String) session.getAttribute("valueArr");
					String[] valueArray = valueArr.split(",");

					List<CartVO> cartList = new ArrayList<CartVO>();
					cartList = (List<CartVO>) session.getAttribute("cartList");
					for (CartVO x : cartList) {
						x.setId(member.getId());
						ClientCartService.insertCart(x);
						for (int i = 0; i < valueArray.length; i++) {
							if (valueArray[i].equals(Integer.toString(x.getPno()))) {
								valueArray[i] = Integer.toString(loginService.getCno());
							}
						}

					}
					session.setAttribute("cno", valueArray);
					System.out.println(Arrays.toString(valueArray));
				} else {
					System.out.println("장바구니만");
					List<CartVO> cartList = new ArrayList<CartVO>();
					cartList = (List<CartVO>) session.getAttribute("cartList");
					for (CartVO x : cartList) {
						x.setId(member.getId());
						ClientCartService.insertCart(x);
					}
				}

				session.removeAttribute("cartList");
			}

			if (reqUrl == null)
				return "redirect:/";
			else
				return "redirect:" + reqUrl;
		}
	}

	// 카카오 로그인
	@RequestMapping(value = "/login/oauth_kakao")
	public String oauthKakao(@RequestParam(value = "code", required = false) String code, Model model,
			HttpSession session, MemberVO member) throws Exception {
		String access_Token = kakaoAPIService.getAccessToken(code);
		HashMap<String, Object> userInfo = kakaoAPIService.getUserInfo(access_Token);
//		System.out.println("#########" + code);
//		System.out.println("###access_Token#### : " + access_Token);
//		System.out.println("###userInfo#### : " + userInfo.get("email"));

		JSONObject kakaoInfo = new JSONObject(userInfo);
		model.addAttribute("kakaoInfo", kakaoInfo);

		System.out.println("===============================");
		session.setAttribute("sns", "kakao");
		member.setEmail((String) kakaoInfo.get("email"));

		int emailResult = loginService.getMemberByEmail(member);
		if (emailResult == 0) {
			session.setAttribute("snsMember", member);
			return "redirect:/login/joinSNS";
		} else {
			MemberVO snsMember = loginService.getMember(member);

			String reqUrl = (String) session.getAttribute("reqUrl");
			session.removeAttribute("reqUrl");
			session.setAttribute("sessionMember", snsMember);

			// 카트
			if (session.getAttribute("cartList") != null) {
				if (session.getAttribute("valueArr") != null) {
					System.out.println("주문하기");
					String valueArr = (String) session.getAttribute("valueArr");
					String[] valueArray = valueArr.split(",");

					List<CartVO> cartList = new ArrayList<CartVO>();
					cartList = (List<CartVO>) session.getAttribute("cartList");
					for (CartVO x : cartList) {
						x.setId(member.getId());
						ClientCartService.insertCart(x);
						for (int i = 0; i < valueArray.length; i++) {
							if (valueArray[i].equals(Integer.toString(x.getPno()))) {
								valueArray[i] = Integer.toString(loginService.getCno());
							}
						}

					}
					session.setAttribute("cno", valueArray);
					System.out.println(Arrays.toString(valueArray));
				} else {
					System.out.println("장바구니만");
					List<CartVO> cartList = new ArrayList<CartVO>();
					cartList = (List<CartVO>) session.getAttribute("cartList");
					for (CartVO x : cartList) {
						x.setId(member.getId());
						ClientCartService.insertCart(x);
					}
				}

				session.removeAttribute("cartList");
			}

			if (reqUrl == null)
				return "redirect:/";
			else
				return "redirect:" + reqUrl;
		}
	}

	@RequestMapping(value = "/login/joinSNS", method = RequestMethod.GET)
	public String joinAPIForm(MemberVO member) {
		return "clientMember/apiMemberJoin";
	}

	@RequestMapping(value = "/login/joinSNS", method = RequestMethod.POST)
	public String joinAPI(MemberVO member, HttpSession session, Model model) {

		// 비밀번호 암호화
		String rawPassword = member.getPw();
		String encodedPwd = bCryptPasswordEncoder.encode(rawPassword);
		member.setPw(encodedPwd);

		clientMemberService.insertMember(member);

		MemberVO snsMember = new MemberVO();
		snsMember.setId(member.getId());
		snsMember.setMcode(member.getMcode());
		snsMember.setName(member.getName());
		snsMember.setEmail(member.getEmail());
		session.setAttribute("sessionMember", snsMember);

		String reqUrl = (String) session.getAttribute("reqUrl");
		session.removeAttribute("reqUrl");

		// 카트
		if (session.getAttribute("cartList") != null) {
			if (session.getAttribute("valueArr") != null) {
				System.out.println("주문하기");
				String valueArr = (String) session.getAttribute("valueArr");
				String[] valueArray = valueArr.split(",");

				List<CartVO> cartList = new ArrayList<CartVO>();
				cartList = (List<CartVO>) session.getAttribute("cartList");
				for (CartVO x : cartList) {
					x.setId(member.getId());
					ClientCartService.insertCart(x);
					for (int i = 0; i < valueArray.length; i++) {
						if (valueArray[i].equals(Integer.toString(x.getPno()))) {
							valueArray[i] = Integer.toString(loginService.getCno());
						}
					}

				}
				session.setAttribute("cno", valueArray);
				System.out.println(Arrays.toString(valueArray));
			} else {
				System.out.println("장바구니만");
				List<CartVO> cartList = new ArrayList<CartVO>();
				cartList = (List<CartVO>) session.getAttribute("cartList");
				for (CartVO x : cartList) {
					x.setId(member.getId());
					ClientCartService.insertCart(x);
				}
			}

			session.removeAttribute("cartList");
		}

		if (reqUrl == null)
			return "redirect:/";
		else
			return "redirect:" + reqUrl;
	}

// *********************관리자 로그인****************************************	

	@RequestMapping(value = "/admin/login", method = RequestMethod.GET)
	public String adminLogin(MemberVO vo, HttpSession session) {

		if (session.getAttribute("sessionMember") != null) {
			MemberVO user = (MemberVO) session.getAttribute("sessionMember");
			String userId = user.getId();
			if (userId.equals("admin")) {
				return "redirect:/admin/info";
			} else {
				return "redirect:/";
			}
		}
		return "adminLogin";
	}

	@RequestMapping(value = "/admin/login", method = RequestMethod.POST)
	public String adminLoginCheck(@Valid MemberVO member, BindingResult result, Model model, HttpSession session) {
		String adreqUrl = (String) session.getAttribute("adreqUrl");
		if (result.hasErrors()) {
			return "adminLogin";
		}

		MemberVO login = loginService.getPw(member);
		boolean pwdMatch = false;
		if (login != null) {
			pwdMatch = bCryptPasswordEncoder.matches(member.getPw(), login.getPw());
		}
		if (!pwdMatch) {
			model.addAttribute("alertMsg", "아이디 혹은 비밀번호가 일치하지 않습니다.");
			return "adminLogin";
		} else {
			session.setAttribute("sessionMember", loginService.getAdminID(member));
			session.removeAttribute("reqUrl");
			if (adreqUrl == null) {
				return "redirect:/admin/info";
			} else {
				return "redirect:" + adreqUrl;
			}
		}
	}

	@RequestMapping(value = "/admin/logout", method = RequestMethod.GET)
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin/login";
	}
}