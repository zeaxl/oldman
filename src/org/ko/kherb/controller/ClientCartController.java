package org.ko.kherb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ko.kherb.client.cart.service.ClientCartService;
import org.ko.kherb.vo.CartVO;
import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ClientCartController {
	
	@Autowired
	private ClientCartService ClientCartService;
	private int pcount;
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartList(Model model, HttpSession session, CartVO cart, MemberVO mem) {
		if(session.getAttribute("sessionMember")!=null) {
			System.out.println("세션있음");
			MemberVO user = (MemberVO) session.getAttribute("sessionMember");
			String userId = user.getId();
			System.out.println("controller cart 목록진입");
	
			int sumPrice = ClientCartService.sumPrice(userId); //전체금액호출		
					
			model.addAttribute("sumPrice", sumPrice);
			model.addAttribute("mem", user);
			model.addAttribute("cartList", ClientCartService.getCartList(userId));		
			return "clientCart/clientCartList";
		} else {
			System.out.println("세션없음");
			return "clientCart/clientCartNoLogin";
		}
	}
	
	
	@RequestMapping(value = "/cart/insert", method = RequestMethod.POST)
	public String insertCart(ProductVO product, CartVO cart, Model model, HttpSession session, HttpServletRequest req, HttpServletResponse res) throws IOException {
		if(session.getAttribute("sessionMember")!=null) {
			MemberVO user = (MemberVO) session.getAttribute("sessionMember");
			String userid = user.getId();
			System.out.println("장바구니담기 controller진입");
			
			cart.setId(userid);
			cart.setPno(product.getPno());
			int checkcnt = ClientCartService.checkCart(cart);
			System.out.println("controller"+ClientCartService.checkCart(cart));
			
			if(checkcnt == 0) {
				int pcount = Integer.parseInt(req.getParameter("pcount"));
				System.out.println(pcount);
				
				cart.setId(userid);
				cart.setPname(product.getPname());
				cart.setPrice(product.getPrice());
				cart.setPno(product.getPno());
				cart.setPcount(pcount);
				cart.setImg1(product.getImg1());
				ClientCartService.insertCart(cart);
				
				res.setContentType("text/html;charset=UTF-8");
		        PrintWriter out = res.getWriter();
		        out.println("<script>");
		        out.println("var confirm = confirm('상품을 장바구니에 담았습니다.\\n장바구니로 이동하시겠습니까?');");
		        out.println("if(confirm){location.href='/cart';}else{history.back();}");
		        out.println("</script>");
		        out.flush();
			}else {
				res.setContentType("text/html;charset=UTF-8");
		        PrintWriter out = res.getWriter();
		        out.println("<script>");
		        out.println("alert('이미 담겨있는 상품입니다.');");
		        out.println("history.back()");
		        out.println("</script>");
		        out.flush();
			}
		} else {
			List<CartVO> cartList = new ArrayList<CartVO>();
			int pcount = Integer.parseInt(req.getParameter("pcount"));
			
			if(session.getAttribute("cartList")!=null) {
				cartList = (List<CartVO>) session.getAttribute("cartList");
			}
			int i=0;
			for(CartVO x : cartList) {
				if(x.getPno()==product.getPno()) {
					i=1;
			        break;
				}
			}
			if(i==1) {
				res.setContentType("text/html;charset=UTF-8");
		        PrintWriter out = res.getWriter();
		        out.println("<script>");
		        out.println("alert('이미 담겨있는 상품입니다.');");
		        out.println("history.back()");
		        out.println("</script>");
		        out.flush();
			} else {
				cart.setPname(product.getPname());
				cart.setPrice(product.getPrice());
				cart.setPno(product.getPno());
				cart.setPcount(pcount);
				cart.setImg1(product.getImg1());
				cartList.add(cart);
				session.setAttribute("cartList", cartList);
				
				res.setContentType("text/html;charset=UTF-8");
		        PrintWriter out = res.getWriter();
		        out.println("<script>");
		        out.println("var confirm = confirm('상품을 장바구니에 담았습니다.\\n장바구니로 이동하시겠습니까?');");
		        out.println("if(confirm){location.href='/cart';}else{history.back();}");
		        out.println("</script>");
		        out.flush();
			}
		}
		return null;
	}
	
	
	@RequestMapping(value = "/cart/del", method = RequestMethod.GET)
	public String deleteCart(@RequestParam int cno, CartVO cart, HttpSession session) {
		if(session.getAttribute("sessionMember")!=null) {
			cart.setCno(cno);
			ClientCartService.deleteCart(cart);
		} else {
			List<CartVO> cartList = new ArrayList<CartVO>();
			cartList = (List<CartVO>) session.getAttribute("cartList");
			int i=0;
			for(CartVO x : cartList) {
				if(x.getPno()==cno) {
					cartList.remove(i);
					break;
				}
				i+=1;
			}
		}
		return "redirect:/cart";
	}
	
	@RequestMapping(value = "/cart/del/all", method = RequestMethod.GET)
	public String deleteAllCart(HttpSession session, CartVO cart) {
		if(session.getAttribute("sessionMember")!=null) {
		MemberVO user = (MemberVO) session.getAttribute("sessionMember");
		String userId = user.getId();
		
		cart.setId(userId);
		ClientCartService.deleteAllCart(userId);
		} else {
			session.removeAttribute("cartList");
		}
		return "redirect:/cart";
	}
	
	@RequestMapping(value = "/cart/del/cho", method = RequestMethod.POST)
	public String deleteChoCart(@RequestParam String valueArr, HttpServletRequest request, HttpServletResponse res, CartVO cart, HttpSession session) throws IOException {		
		System.out.println("valueArr : " + valueArr);		
		String[] array = valueArr.split(",");
		
		if(session.getAttribute("sessionMember")!=null) {
			for(int i=0;i<array.length;i++) {
				System.out.println(array[i]);
				ClientCartService.deleteChoiceCart(array[i]);
			}	
		} else {
			List<CartVO> cartList = new ArrayList<CartVO>();
			cartList = (List<CartVO>) session.getAttribute("cartList");
			for(int i=0; i<array.length; i++) {
				int arrayI = Integer.parseInt(array[i]);
				int j=0;
				for(CartVO x : cartList) {
					if(x.getPno()==arrayI) {
						cartList.remove(j);
						break;
					}
					j+=1;
				}
			}			
		}
		return "redirect:/cart";
	}
	
	@RequestMapping(value = "/cart/upd", method = RequestMethod.POST)
	public String updateCart(@RequestParam int pcount, HttpSession session, CartVO cart, HttpServletRequest req) {
		if(session.getAttribute("sessionMember")!=null) {
			MemberVO user = (MemberVO) session.getAttribute("sessionMember");
			String userId = user.getId();
			
			cart.setId(userId);
			System.out.println(pcount);
			System.out.println("controller cart수량변경"+cart.toString());
			
			ClientCartService.updateCart(cart);
		} else {
			List<CartVO> cartList = new ArrayList<CartVO>();
			cartList = (List<CartVO>) session.getAttribute("cartList");
			for(CartVO x : cartList) {
				if(x.getPno()==cart.getCno()) {
					x.setPcount(pcount);
					break;
				}
			}
		}
		return "redirect:/cart";
	}
	
	
} 
