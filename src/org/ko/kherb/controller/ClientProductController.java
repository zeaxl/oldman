package org.ko.kherb.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.ko.kherb.client.product.service.ClientProductService;
import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.PageVO;
import org.ko.kherb.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ClientProductController {

	@Autowired
	private ClientProductService clientProductService;
	
	@RequestMapping(value="/pro/data", method=RequestMethod.GET)
	public String listData( @RequestParam("cate") String cate, @RequestParam("searchKeyword") String searchKeyword, @RequestParam("order") String order, @RequestParam("page") String page ,HttpSession session) throws UnsupportedEncodingException {
		ProductVO data = new ProductVO();
		data.setSearchKeyword(searchKeyword);
		data.setPtype(cate);
		data.setOrder(order);
		data.setPage(page);
		session.setAttribute("data", data);
		if(searchKeyword == "") {
			return "redirect:/pro/" + cate + "/" + order + "/" + page;
		} else {
			String search = URLEncoder.encode(searchKeyword,"UTF-8");
			return "redirect:/pro/" + cate + "/" + order + "/" + page+ "/" + search;
		}
	}
	
	@RequestMapping(value="/pro/{cate}/{order}/{page}", method=RequestMethod.GET)
	public String searchList1(PageVO pageVO, MemberVO mem, ProductVO pro, Model model, HttpSession session, @PathVariable("cate") String ptype, @PathVariable("order") String order, @PathVariable("page") String page) {
		String searchKeyword = "";
		pro.setPtype(ptype);
		pro.setSearchKeyword(searchKeyword);
		int total = clientProductService.selectCount(pro);
		int pageNo = 1;
		int listSize = 6;
		int pageSize = 10;
		if(page != null) {
			pageNo = Integer.parseInt(page);
		} else {
			page = "1";
		}
		int startRow = (pageNo - 1) * listSize;
		
		System.out.println(ptype);
		System.out.println(order);
		System.out.println(page);
		System.out.println(searchKeyword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", listSize);
		map.put("offset", startRow);
		map.put("searchKeyword", searchKeyword);
		map.put("cate", ptype);
		map.put("order", order);
		map.put("pageInfo", page);
		
		PageVO paging = new PageVO(total, pageNo, listSize, pageSize);
		mem = (MemberVO) session.getAttribute("sessionMember");
		
		model.addAttribute("order", order);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("mem", mem);
		model.addAttribute("paging", paging);
		model.addAttribute("cate", ptype);
		model.addAttribute("pageInfo", page);
		model.addAttribute("pro", clientProductService.searchProductList(map));
		return "clientProduct/productList";
	}
	
	@RequestMapping(value="/pro/{cate}/{order}/{page}/{searchKeyword}", method=RequestMethod.GET)
	public String searchList2(PageVO pageVO, MemberVO mem, ProductVO pro, Model model, HttpSession session, @PathVariable("cate") String ptype, @PathVariable("order") String order, @PathVariable("page") String page,  @PathVariable("searchKeyword") String searchKeyword) {
		
		pro.setPtype(ptype);
		pro.setSearchKeyword(searchKeyword);
		int total = clientProductService.selectCount(pro);
		int pageNo = 1;
		int listSize = 6;
		int pageSize = 10;
		if(page != null) {
			pageNo = Integer.parseInt(page);
		} else {
			page = "1";
		}
		int startRow = (pageNo - 1) * listSize;
		
		System.out.println(ptype);
		System.out.println(order);
		System.out.println(page);
		System.out.println(searchKeyword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", listSize);
		map.put("offset", startRow);
		map.put("searchKeyword", searchKeyword);
		map.put("cate", ptype);
		map.put("order", order);
		map.put("pageInfo", page);
		
		PageVO paging = new PageVO(total, pageNo, listSize, pageSize);
		mem = (MemberVO) session.getAttribute("sessionMember");
		
		model.addAttribute("order", order);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("mem", mem);
		model.addAttribute("paging", paging);
		model.addAttribute("cate", ptype);
		model.addAttribute("pageInfo", page);
		model.addAttribute("pro", clientProductService.searchProductList(map));
		return "clientProduct/productList";
	}
	
	@RequestMapping(value="/pro/{page}/detail/{pno}", method=RequestMethod.GET)
	public String productDetil1(ProductVO pro,  MemberVO mem, @PathVariable("pno") int pno,  @PathVariable("page") String page, Model model, HttpSession session) {
		ProductVO detail = clientProductService.getProductDetail(pno);
		ProductVO log = (ProductVO) session.getAttribute("data");
		mem = (MemberVO) session.getAttribute("sessionMember");
		
		String ptype = log.getPtype();
		String order = log.getOrder();
		String searchKeyword = log.getSearchKeyword();
		pro.setPtype(ptype);
		pro.setOrder(order);
		pro.setSearchKeyword(searchKeyword);
		List<Integer> list = clientProductService.returnProductList(pro);
		System.out.println(list);
		int count = list.indexOf(pno) + 1;
		System.out.println(count);
		page = Integer.toString((count)/6+1);
		
		ProductVO data = new ProductVO();
		data.setSearchKeyword(searchKeyword);
		data.setOrder(order);
		data.setPtype(ptype);
		data.setPage(page);
		
		System.out.println(data.getPtype());
		System.out.println(data.getSearchKeyword());
		System.out.println(data.getOrder());
		System.out.println(data.getPage());
		
		model.addAttribute("data", data);
		model.addAttribute("mem", mem);
		model.addAttribute("p", detail);
		model.addAttribute("pageInfo", page);
		return "clientProduct/productDetil";
	}
	
	@RequestMapping(value="/pro/detail/{pno}", method=RequestMethod.GET)
	public String productDetil2(ProductVO pro,  MemberVO mem, @PathVariable("pno") int pno, Model model, HttpSession session) {
		String ptype = "all";
		String order = "_";
		String searchKeyword = "";
		pro.setPtype(ptype);
		pro.setOrder(order);
		pro.setSearchKeyword(searchKeyword);
		List<Integer> list = clientProductService.returnProductList(pro);
		System.out.println(list);
		int count = list.indexOf(pno) + 1;
		System.out.println(count);
		String page = Integer.toString((count)/6+1);
		
		ProductVO detail = clientProductService.getProductDetail(pno);
		ProductVO data = new ProductVO();
		data.setSearchKeyword(searchKeyword);
		data.setOrder(order);
		data.setPtype(ptype);
		data.setPage(page);
		mem = (MemberVO) session.getAttribute("sessionMember");
		
		System.out.println(data.getPtype());
		System.out.println(data.getSearchKeyword());
		System.out.println(data.getOrder());
		System.out.println(data.getPage());
		
		model.addAttribute("data", data);
		model.addAttribute("mem", mem);
		model.addAttribute("p", detail);
		model.addAttribute("pageInfo", page);
		return "clientProduct/productDetil";
	}
}
