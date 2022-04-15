package org.ko.kherb.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.ko.kherb.admin.order.service.AdminOrderService;
import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.OrderVO;
import org.ko.kherb.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminOrderController {

	@Autowired
	private AdminOrderService AdorderService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new LinkedHashMap<String, String>();
		conditionMap.put("id", "아이디");
		conditionMap.put("payno", "주문번호");
		System.out.println(conditionMap);
		return conditionMap;
	}

	@RequestMapping(value="/admin/order", method=RequestMethod.GET)
	public String memberlist(PageVO pageVO, OrderVO order, Model model,
			@RequestParam(value = "searchKeyword", required = true, defaultValue = "") String searchKeyword,
			@RequestParam(value = "searchCondition", required = true, defaultValue = "id") String searchCondition) {
		
		Map<String, String> countMap = new HashMap<String, String>();
		countMap.put("searchKeyword", searchKeyword);
		countMap.put("searchCondition", searchCondition);
		
		int total = AdorderService.getCountP(order);
		
		String page = pageVO.getPage();
		int pageNo = 1;
		int listSize = 10;
		int pageSize = 5;
		if(page != null) {
			pageNo = Integer.parseInt(page);
		}
		int startRow = (pageNo - 1) * listSize;
		
		OrderVO search = new OrderVO(searchCondition, searchKeyword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", listSize);
		map.put("offset", startRow);
		
		PageVO paging = new PageVO(total, pageNo, listSize, pageSize);
		
		model.addAttribute("paging", paging);
		model.addAttribute("search", search);
		model.addAttribute("allOrder", AdorderService.getAdOrderList(map));
		return "adminOrder/adminAllOrderList";
	}
	
	@RequestMapping(value="/admin/order/{Opage}", method=RequestMethod.POST)
	public String memberlist2(PageVO pageVO, OrderVO order, Model model,
			@PathVariable ("Opage") String Opage,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(value = "searchCondition", required = false) String searchCondition,
			@ModelAttribute("conditionMap") Map<String, String> conditionMap) {
		
		Map<String, String> countMap = new HashMap<String, String>();
		countMap.put("searchKeyword", searchKeyword);
		countMap.put("searchCondition", searchCondition);
		
		int total = AdorderService.getCountP(order);
		
		int pageNo = 1;
		int listSize = 10; // limit
		int pageSize = 5; // offset
		if (total == 0) {
			total = 10;
		}
		if (Opage != null) {
			pageNo = Integer.parseInt(Opage);
		}
		
		if (pageNo > total) {
			System.out.println("PageNo> total 일때 조건 진입");
			pageNo = 1;
		}
		int startRow = (pageNo - 1) * listSize;
		PageVO paging = new PageVO(total, pageNo, listSize, pageSize);
		OrderVO search = new OrderVO(searchCondition, searchKeyword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", listSize);
		map.put("offset", startRow);
		map.put("searchKeyword", searchKeyword);
		map.put("searchCondition", searchCondition);
		
		model.addAttribute("paging", paging);
		model.addAttribute("search", search);
		model.addAttribute("allOrder", AdorderService.getSearchOrderList(map));
		return "adminOrder/adminAllOrderList";
	}

	
	@RequestMapping(value="/admin/order/{page}/detail", method=RequestMethod.POST)
	public String AdOrderDetail(OrderVO order, Model model, PageVO pageVO, @PathVariable("page") int pageNo,
			@RequestParam("payno") String payno, @RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("searchCondition") String searchCondition) {
		
		order.setPayno(payno);
		System.out.println("payno 출력: "+ payno);
		OrderVO search = new OrderVO(searchCondition, searchKeyword);
		PageVO page = new PageVO(pageNo);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("allOrderD", AdorderService.allOrderDetail(order));
		return "adminOrder/adminOrderDetail";
	}
	
	@RequestMapping(value="/admin/order/del", method=RequestMethod.POST)
	public String adOrderDelete(@RequestParam(value="payno") String payno, Model model, HttpSession session) {
		 
	    AdorderService.deleteAdOrder(payno);

		return "redirect:/admin/order";
	}
}
