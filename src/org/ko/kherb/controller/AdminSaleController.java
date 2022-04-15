package org.ko.kherb.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.ko.kherb.admin.sale.AdminSaleService;
import org.ko.kherb.vo.AdminSaleVO;
import org.ko.kherb.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminSaleController {

	@Autowired
	private AdminSaleService SaleService;
	
   	
	 @ModelAttribute("Search")//ModelAttribute가 설정된 메서드는 RequestMapping보다 먼저 호출됨
	    
     public Map<String,String>LinkedHashMap(AdminSaleVO sv,Model model){
   	 Map<String,String> conditionMap=new LinkedHashMap<String,String>();
 	//conditionMap.put("전체보기","all");
   	 System.out.println(sv.getTitle());
   	if(sv.getTitle()==null) {
   	conditionMap.put("상품명","pname");
   	conditionMap.put("상품번호","pno"); 	 
   	}else if(sv.getTitle().equals("pname")) {
   	conditionMap.put("상품명","pname");
   	conditionMap.put("상품번호","pno");
   	}else if(sv.getTitle().equals("pno")) {
   	conditionMap.put("상품번호","pno");
   	conditionMap.put("상품명","pname");
   	 }
   	
   	 return conditionMap; //ModelAttribute메소드의 실행결과로 리턴된 객체는 자동으로 Model에 저장
    }
	
	 @ModelAttribute("sort")//ModelAttribute가 설정된 메서드는 RequestMapping보다 먼저 호출됨
	    
     public Map<String,String>sort(AdminSaleVO sv,Model model){
   	 Map<String,String> conditionMap=new LinkedHashMap<String,String>();
 	//conditionMap.put("-----------------------","ALL");
   	if(sv.getSort()==null) {
   		conditionMap.put("신상품","new");
      	conditionMap.put("판매액(높은순)","high"); 	 
      	conditionMap.put("판매액(낮은순)","low");
      	
   	}else if (sv.getSort().equals("new")) {
   		conditionMap.put("신상품","new");
      	conditionMap.put("판매액(높은순)","high"); 	 
      	conditionMap.put("판매액(낮은순)","low");
      	
   	}else if (sv.getSort().equals("high")) {
   		System.out.println(sv.getSort());
   		conditionMap.put("판매액(높은순)","high");       		 
      	conditionMap.put("판매액(낮은순)","low");
      	conditionMap.put("신상품","new");
      	
   	}else if (sv.getSort().equals("low")) {
   		conditionMap.put("판매액(낮은순)","low"); 		
      	conditionMap.put("판매액(높은순)","high");
      	conditionMap.put("신상품","new");
   	}
   	
   	 
   	
   	 return conditionMap; //ModelAttribute메소드의 실행결과로 리턴된 객체는 자동으로 Model에 저장
    }
	 
	 @RequestMapping(value="admin/sale/{Ajaxpage}/info/{Ajaxpage2}/{Ajaxpage3}",method=RequestMethod.POST)
	  public @ResponseBody List<AdminSaleVO> Lit(@PathVariable("Ajaxpage")String page1,
			  @PathVariable("Ajaxpage2")String page2,@PathVariable("Ajaxpage")String page3,AdminSaleVO sv,Model model,HttpSession session) {
		 String a= (String) session.getAttribute("sangpum");
		    sv.setPname(a);
		
			System.out.println(page3);
			 session.setAttribute("pname",sv.getPname());
			 session.setAttribute("page",page3);
			 
			int total = SaleService.getSaleInfoCount(sv);
			
			String page = page2;
			int pageNo = 1;
			int listSize = 10;
			int pageSize = 10;
			if(page != null) {
				pageNo = Integer.parseInt(page);
			}
			int startRow = (pageNo - 1) * listSize;		
			sv.setLimit(listSize);
			sv.setOffset(startRow);
			
				
			PageVO paging = new PageVO(total, pageNo, listSize, pageSize);			
			model.addAttribute("paging", paging);	
			
		 List<AdminSaleVO> turtle= SaleService.getSaleInfo(sv);
			//model.addAttribute("SaleList", SaleService.getSale(sv));
		 	
				return turtle;	
	} 
		
		@RequestMapping(value = "/admin/sale/login.do", method = RequestMethod.POST)
		public  @ResponseBody List<AdminSaleVO> Listt(AdminSaleVO sv,Model model,HttpSession session) {
			 

			System.out.println(sv.getPname());
			session.setAttribute("sangpum", sv.getPname());
			List<AdminSaleVO> turtle= SaleService.getSaleInfo(sv);	
				return turtle;	
		}
		
	 
		@RequestMapping(value = "/admin/sale/{page1}/info/{page2}", method = RequestMethod.GET)
		public String SaleInfo1(@PathVariable("page1")String page1,@PathVariable("page2")String page2,@PathVariable("page1")String page3,AdminSaleVO sv,Model model,PageVO pro,HttpSession session) {

			    String a= (String) session.getAttribute("sangpum");
			    sv.setPname(a);
			
				System.out.println(page3);
				 session.setAttribute("pname",sv.getPname());
				 session.setAttribute("page",page3);
				 
				int total = SaleService.getSaleInfoCount(sv);
				
				String page = page2;
				int pageNo = 1;
				int listSize = 10;
				int pageSize = 10;
				if(page != null) {
					pageNo = Integer.parseInt(page);
				}
				int startRow = (pageNo - 1) * listSize;		
				sv.setLimit(listSize);
				sv.setOffset(startRow);
				
					
				PageVO paging = new PageVO(total, pageNo, listSize, pageSize);			
				model.addAttribute("paging", paging);	
				model.addAttribute("SaleInfo",SaleService.getSaleInfo(sv));
				
				//return "adminSale/adminSaleInfo";
				return "adminSale/adminSaleInfo";
						
			}		
	@RequestMapping(value = "/admin/sale/{page}", method = RequestMethod.GET)
	public String table1(@PathVariable("page")String page1,AdminSaleVO sv,Model model,PageVO pro, HttpSession session) {
		LocalDate now = LocalDate.now();
		LocalDate month = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");	
		sv.setDd(now);	
		sv.setYear("2022");
		sv.setMonth(month.format(formatter));
		
		int total = SaleService.getCount(sv);
		System.out.println(pro.getPage());
		String page = page1;
		session.setAttribute(page, page1);
		int pageNo = 1;
		int listSize = 10;
		int pageSize = 10;
		if(page != null) {
			pageNo = Integer.parseInt(page);
		}
		int startRow = (pageNo - 1) * listSize;	
		sv.setLimit(listSize);
		sv.setOffset(startRow);		
				
		PageVO paging = new PageVO(total, pageNo, listSize, pageSize);			
		model.addAttribute("paging", paging);	
		model.addAttribute("SaleList", SaleService.getSale(sv));
		
		return "adminSale/adminSaleList"; 
	}
	
	
	@RequestMapping(value = "/admin/sale/search/{pagee}", method = RequestMethod.POST)
	public String adminSaleSearch(@PathVariable("pagee")String page1,AdminSaleVO sv,Model model,PageVO pro, HttpSession session) {	

		int total = 10;
		System.out.println(pro.getPage());
		String page = page1;
		session.setAttribute(page, page1);
		int pageNo = 1;
		int listSize = 10;
		int pageSize = 10;
		if(page != null) {
			pageNo = Integer.parseInt(page);
		}
		int startRow = (pageNo - 1) * listSize;	
		sv.setLimit(listSize);
		sv.setOffset(startRow);		
				
		PageVO paging = new PageVO(total, pageNo, listSize, pageSize);			
		model.addAttribute("paging", paging);			
		model.addAttribute("content",sv.getContent());	
		model.addAttribute("SaleList", SaleService.getSaleSearch(sv));
		//List<AdminSaleVO> list= SaleService.getSaleSearch(sv);
		//model.addAttribute("SaleList",list);
		return "adminSale/adminSaleList"; 
	}
	
	
	@RequestMapping(value = "/admin/sale/sort/{sort}/{page}", method = RequestMethod.GET)
	public String adminSaleSort(@PathVariable("page")String page1,@PathVariable("sort") String sort,AdminSaleVO sv,Model model,PageVO pro) {		  
		
			int total = SaleService.getCount(sv);
			String page = page1;
			int pageNo = 1;
			int listSize = 10;
			int pageSize = 10;
			if(page != null) {
				pageNo = Integer.parseInt(page);
			}
			int startRow = (pageNo - 1) * listSize;		
			sv.setLimit(listSize);
			sv.setOffset(startRow);
			PageVO paging = new PageVO(total, pageNo, listSize, pageSize);			
			model.addAttribute("paging", paging);	
			
			 String returnPage = "MAIN";
			    
			
		if(sort.equals("new")){
			sv.setSort(sort);		
			returnPage = "adminSale/adminSaleListNew";				
		}
		else if(sort.equals("high")){
                  sv.setSort(sort);		
			returnPage = "adminSale/adminSaleListHigh";	
			
		}else if(sort.equals("low")){
            sv.setSort(sort);
			
		returnPage = "adminSale/adminSaleListLow";		
			
		}else if(sort.equals("ALL")){
            sv.setSort("ALL");
			
		returnPage = "adminSale/adminSaleList";
		}
			
		
		model.addAttribute("SaleList",SaleService.getSaleSort(sv));	
		return returnPage;
		
		
			
		
		}
			
		
}
