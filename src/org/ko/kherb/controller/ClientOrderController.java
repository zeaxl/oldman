package org.ko.kherb.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.ko.kherb.client.order.service.OrderService;
import org.ko.kherb.vo.CartVO;
import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.OrderVO;
import org.ko.kherb.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ClientOrderController {

	@Autowired 
	private OrderService orderService;
	
	// 비회원 장바구니 => 주문하기
	@RequestMapping(value="/order", method=RequestMethod.GET)
	public String order(OrderVO order, MemberVO member, Model model, HttpSession session) {
		
		MemberVO sessionMember = (MemberVO) session.getAttribute("sessionMember");
		String id = sessionMember.getId();
        
		order.setId(id);
		member.setId(id);
		
		List<CartVO> OrderServiceLis = new ArrayList<CartVO>();
		String[] cno = (String[]) session.getAttribute("cno");
		System.out.println(Arrays.toString(cno));
		for(int i=0;i<cno.length;i++) {
			order.setCno(Integer.parseInt(cno[i]));
			OrderServiceLis.add(orderService.orderList(order));
		}
		session.removeAttribute("cno");
//		model.addAttribute("member", orderService.memberList(member));
		model.addAttribute("member", orderService.memberList(member.getId()));
		model.addAttribute("order", OrderServiceLis);
		
		return "clientOrder/orderList";
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String orderlist(@RequestParam String valueArr, OrderVO order, MemberVO member, Model model, HttpSession session) {

		MemberVO sessionMember = (MemberVO) session.getAttribute("sessionMember");
		String id = sessionMember.getId();
        
		order.setId(id);
		member.setId(id);
		System.out.println(valueArr);
		
		List<CartVO> OrderServiceLis = new ArrayList<CartVO>();
		String[] cno = valueArr.split(","); 
		
		
		for(int i=0;i<cno.length;i++) {
		order.setCno(Integer.parseInt(cno[i]));
		
		OrderServiceLis.add(orderService.orderList(order));
		/*
		 * System.out.println(orderService.orderList(order));
		 * System.out.println(order.getCno()); System.out.println(order.getId());
		 * System.out.println(OrderServiceLis);
		 */
		}
		
		//model.addAttribute("order", OrderService);
		
		
		MemberVO MemberList = orderService.memberList(id);

		model.addAttribute("member", MemberList);
		model.addAttribute("order", OrderServiceLis);
		
		
		return "clientOrder/orderList";
	} 

	

	@RequestMapping(value = "/order/result", method = RequestMethod.GET) public
	  String MemberJoinView(MemberVO memberVO) {
	  System.out.println("결제완료 화면으로 이동"); return "clientOrder/orderResult"; }
	 
	
	
	@RequestMapping(value = "/order/check", method=RequestMethod.POST)
	@ResponseBody
	public int orderResult(
	    @RequestParam(value="payno") String payno, @RequestParam(value="oname") String oname, 
	    @RequestParam(value="ohp") String ohp, @RequestParam(value="oaddr1") String oaddr1, 
	    @RequestParam(value="oaddr2") String oaddr2, 
	    @RequestParam(value="opostcode") String opostcode, @RequestParam(value="pnoarr")  String pnoarr,
		@RequestParam(value="pnamearr") String pnamearr, @RequestParam(value="pricearr") String pricearr,
		@RequestParam(value="pcountarr")  String pcountarr, @RequestParam(value="dpricearr") String dpricearr,
		@RequestParam(value="mcode") String mcode, @RequestParam(value="totalprice") int totalprice,
		OrderVO order, Model model, HttpSession session) throws Exception {
		  
			System.out.println("결제 내용 입력");
			
			
			MemberVO sessionMember = (MemberVO) session.getAttribute("sessionMember");
			String id = sessionMember.getId();
			
			int result = 0;
			
			order.setId(id);
			order.setPayno(payno); 
		    order.setOaddr1(oaddr1); order.setOname(oname); order.setOaddr2(oaddr2); 
	        order.setOhp(ohp); order.setOpostcode(opostcode);
	        order.setMcode(mcode); 
			
			
			String[] pno = pnoarr.split(",");
			String[] pname = pnamearr.split(",");
			String[] price = pricearr.split(",");
			String[] pcount = pcountarr.split(",");
			String[] dprice = dpricearr.split(",");
			
			for(int i=0;i<pname.length;i++) {
			order.setPno(Integer.parseInt(pno[i])); 
			order.setPname(pname[i]); 
			order.setPrice(Integer.parseInt(price[i]));
			order.setPcount(Integer.parseInt(pcount[i]));
			order.setDprice(Integer.parseInt(dprice[i]));
			result = orderService.insertOrder(order);
			         orderService.deleteCart(order);
			System.out.println(order.toString());
			}	
			
			order.setPname(pnamearr);
			order.setTotalprice(totalprice);
			orderService.insertPay(order);


		  return result;
	}

	@RequestMapping(value = "/my/order", method = RequestMethod.GET)
	public String myOrder(PageVO pageVO, OrderVO order, Model model, HttpSession session) {
		
        MemberVO sessionMember = (MemberVO) session.getAttribute("sessionMember");
		String id = sessionMember.getId();
		order.setId(id);
		int total = orderService.getCount(id);
		
		String page = pageVO.getPage();
		int pageNo = 1;
		int listSize = 10;
		int pageSize = 5;
		if(page != null) {
			pageNo = Integer.parseInt(page);
		}
		int startRow = (pageNo - 1) * listSize;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", listSize);
		map.put("offset", startRow);
		
		PageVO paging = new PageVO(total, pageNo, listSize, pageSize);
		
		model.addAttribute("paging", paging);
		/*
		 * MemberVO sessionMember = (MemberVO) session.getAttribute("sessionMember");
		 * String id = sessionMember.getId(); order.setId(id);
		 */

		model.addAttribute("myOrder", orderService.myOrder(order));
		return "clientOrder/myOrder";
	}
	
	@RequestMapping(value="/my/order/{page}", method=RequestMethod.GET)
	public String memberlist2(@PathVariable("page") String page, 
			PageVO pageVO, OrderVO order, Model model, HttpSession session) {
		
		MemberVO sessionMember = (MemberVO) session.getAttribute("sessionMember");
		String id = sessionMember.getId();
		order.setId(id);
		System.out.println("마이 페이지 페이징 id: " + order.getId());
		int total = orderService.getCount(id);
		System.out.println("전체 글갯수: " + orderService.getCount(id));
		
		String pageinfo = pageVO.getPage();
		int pageNo = 1;
		int listSize = 10;
		int pageSize = 5;
		if(page != null) {
			pageNo = Integer.parseInt(page);
		}
		int startRow = (pageNo - 1) * listSize;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", listSize);
		map.put("offset", startRow);
		map.put("id", id);
		System.out.println("controller 세션 아이디: " + sessionMember.getId());
		
		PageVO paging = new PageVO(total, pageNo, listSize, pageSize);
		
		model.addAttribute("paging", paging);
		model.addAttribute("pageinfo", pageinfo);
		model.addAttribute("myOrder", orderService.getMyOrderList(map));
		return "clientOrder/myOrder";
	}



	@RequestMapping(value = "/my/order/{page}/{payno}", method = RequestMethod.GET)
	public String myOrderDetail(@PathVariable("payno") String payno, @PathVariable("page") String page,
			PageVO pageVO, OrderVO order, Model model, HttpSession session) {

		MemberVO sessionMember = (MemberVO) session.getAttribute("sessionMember");
		String id = sessionMember.getId();
		
		String pageinfo = pageVO.getPage();

		
		order.setId(id);
		order.setPayno(payno);
		System.out.println(order.getPayno());
		

		model.addAttribute("myOrderDetail", orderService.myOrderDetail(order));
		model.addAttribute("pageinfo", pageinfo);
		System.out.println(order.toString());
		return "clientOrder/myOrderDetail";
	}

	@RequestMapping(value="/my/order/del", method=RequestMethod.POST)
	public String myOrderDelete(@RequestParam(value="payno") String payno, Model model, HttpSession session) {
		 
		orderService.deleteMyOrder(payno);

		return "redirect:/my/order";
	}
}
