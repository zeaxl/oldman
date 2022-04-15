package org.ko.kherb.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ko.kherb.admin.product.service.AdminProductService;
import org.ko.kherb.vo.PageVO;
import org.ko.kherb.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminProductController {

	@Autowired
	private AdminProductService adminProductService;
	
	@RequestMapping(value = "/admin/pro/data", method=RequestMethod.GET)
	public String listData( @RequestParam("searchCondition") String searchCondition, @RequestParam("searchKeyword") String searchKeyword, @RequestParam("page") String page, HttpSession session) {
		ProductVO data = new ProductVO();
		data.setSearchCondition(searchCondition);
		data.setSearchKeyword(searchKeyword);
		data.setPage(page);
		session.setAttribute("data", data);
		return "redirect:/admin/pro/" + page;
	}
	
	@RequestMapping(value = "/admin/pro/{page}", method ={RequestMethod.POST,RequestMethod.GET})
	public String productList(PageVO pageVO, ProductVO pro, Model model, HttpSession session) {
		ProductVO data = (ProductVO) session.getAttribute("data");
		String searchKeyword = data.getSearchKeyword();
		String searchCondition = data.getSearchCondition();
		pro.setSearchKeyword(searchKeyword);
		pro.setSearchCondition(searchCondition);
		int total = adminProductService.getCount(pro);
		String page = data.getPage();
		int pageNo = 1;
		int listSize = 10;
		int pageSize = 5;
		if(page != null) {
			pageNo = Integer.parseInt(page);
		}
		int startRow = (pageNo - 1) * listSize;
		
		System.out.println(data.getSearchCondition());
		System.out.println(data.getSearchKeyword());
		System.out.println(data.getPage());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", listSize);
		map.put("offset", startRow);
		map.put("searchKeyword", searchKeyword);
		map.put("searchCondition", searchCondition);
		System.out.println(data.getPage());
		
		ProductVO log = new ProductVO();
		log.setSearchCondition(searchCondition);
		log.setSearchKeyword(searchKeyword);
		log.setPage(page);
		
		session.setAttribute("log", log);
		
		PageVO paging = new PageVO(total, pageNo, listSize, pageSize);
		
		model.addAttribute("pageInfo", page);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("paging", paging);
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("proList", adminProductService.getProductList(map));
		return "adminProduct/adminProductList";
	}

	@RequestMapping(value = "/admin/pro/{pageInfo}/detail/{pno}", method = RequestMethod.GET)
	public String productDetail(@PathVariable("pageInfo") int pageInfo , @PathVariable("pno") int pno, ProductVO product, Model model, HttpSession session) {
		ProductVO data = (ProductVO) session.getAttribute("data");
		product.setPno(pno);
		
		model.addAttribute("proInfo", adminProductService.getProductDetail(product));
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("data", data);

		return "adminProduct/adminProductDetail";
	}

	// update
	@RequestMapping(value = "/admin/pro/{pageInfo}/upd/{pno}", method = RequestMethod.GET)
	public String updateProForm(@PathVariable("pageInfo") int pageInfo, @PathVariable("pno") int pno, Model model, ProductVO product) {
		product.setPno(pno);
		model.addAttribute("proInfo", adminProductService.getProductDetail(product));
		return "adminProduct/adminProductUpd";
	}
	
	@RequestMapping(value = "/admin/pro/upd", method = RequestMethod.POST)
	public String updatePro(ProductVO product, RedirectAttributes redirect, HttpSession session) throws IOException {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		String day = now.format(formatter);
		MultipartFile uploadFile = product.getUploadFile();
		ProductVO img = adminProductService.searchImg(product);
		product.setImg1(img.getImg1());
		if(!uploadFile.isEmpty()) {
			String exImg1 = img.getImg1();
			File deleteFile1 = new File("C:\\swork\\kherb\\src\\main\\webapp\\resources\\img\\" + exImg1);
			deleteFile1.delete();
			String fileName = uploadFile.getOriginalFilename();
			String result1 = fileName.substring(0,fileName.length()-4) + day + ".png";
			product.setImg1(result1);
			uploadFile.transferTo(new File("C:\\swork\\kherb\\src\\main\\webapp\\resources\\img\\" + result1));
		} 
		adminProductService.updateProduct(product);
		ProductVO data = (ProductVO) session.getAttribute("data");
		return "redirect:/admin/pro/"+ data.getPage() +"/detail/" + product.getPno(); 
		//해당 상품번호로 이동하도록
	}
	
	
	// delete
	@RequestMapping(value = "/admin/pro/del", method = RequestMethod.GET)
	public String deletePro(@RequestParam int pno, @RequestParam String page, ProductVO product, RedirectAttributes redirect, HttpSession session) {
		product.setPno(pno);
		ProductVO img = adminProductService.searchImg(product);
		String img1 = img.getImg1();
		File deleteFile1 = new File("C:\\swork\\kherb\\src\\main\\webapp\\resources\\img\\" + img1);
		deleteFile1.delete();
		System.out.println(page);
		adminProductService.deleteProduct(product);
		ProductVO pro = (ProductVO) session.getAttribute("data");
		int total = adminProductService.getCount(pro);
		int endPage = (total-1) / 10 + 1;
		if(Integer.parseInt(page) >= endPage) {
			page = Integer.toString(endPage);
		}
		System.out.println(endPage);
		redirect.addAttribute("searchCondition", pro.getSearchCondition());
		redirect.addAttribute("searchKeyword", pro.getSearchKeyword());
		redirect.addAttribute("page", page);
		return "redirect:/admin/pro/data";
	}

	// insert
	@RequestMapping(value = "/admin/pro/insert", method = RequestMethod.GET)
	public String insertProForm(ProductVO product) {
		return "adminProduct/adminProductAdd";
	}

	// insert
	@RequestMapping(value = "/admin/pro/insert", method = RequestMethod.POST)
	public String insertPro(ProductVO product, Model model, RedirectAttributes redirect, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException {
		// 파일 업로드 처리
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		String day = now.format(formatter);
		System.out.println(product.getPrice());
		
		MultipartFile uploadFile = product.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			String result1 = fileName.substring(0,fileName.length()-4) + day + ".png";
			product.setImg1(result1);
			uploadFile.transferTo(new File("C:\\swork\\kherb\\src\\main\\webapp\\resources\\img\\" + result1));
		} else {
			res.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = res.getWriter();
	        out.println("<script>alert('파일을 업로드해주세요.');</script>");
	        out.flush();
	        model.addAttribute("data",  product);
	        return "adminProduct/adminProductAdd";
		}	
		adminProductService.insertProduct(product);
		ProductVO data = (ProductVO) session.getAttribute("data");
		redirect.addAttribute("searchCondition", data.getSearchCondition());
		redirect.addAttribute("searchKeyword", data.getSearchKeyword());
		redirect.addAttribute("page", data.getPage());
		return "redirect:/admin/pro/data";
	}

}
