package org.ko.kherb.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.ko.kherb.admin.chart.AdminChartService;
import org.ko.kherb.vo.AdminChartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminChartController {

	@Autowired
	private AdminChartService CashService;
	
	 @ModelAttribute("Pay")//ModelAttribute가 설정된 메서드는 RequestMapping보다 먼저 호출됨
	    
     public Map<String,String>LinkedHashMap(AdminChartVO cv,Model model){
   	 Map<String,String> conditionMap=new LinkedHashMap<String,String>();
 	
   	conditionMap.put("오늘","day");
   	conditionMap.put("이번주","week");
   	conditionMap.put("이번달","month");
   
   
   	
   	 return conditionMap; //ModelAttribute메소드의 실행결과로 리턴된 객체는 자동으로 Model에 저장
    }
   	
	@RequestMapping(value = "/admin/info", method = RequestMethod.GET)
	public String info1(AdminChartVO cv,Model model) {
		LocalDate now = LocalDate.now();
		LocalDate month = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");	
		cv.setDd(now);	
		cv.setYear("2022");
		cv.setMonth(month.format(formatter));		
		model.addAttribute("Sum",CashService.getSum(cv));
		model.addAttribute("SumToday",CashService.getSumToday(cv));
		model.addAttribute("SumMonth",CashService.getSumMonth(cv));
		model.addAttribute("SumYear",CashService.getSumYear(cv));
		model.addAttribute("SumListRank",CashService.getSumListRank(cv));
		model.addAttribute("SumListRankD",CashService.getSumListRankD(cv));
		return "adminChart/info";  			
	}
	
	
	@RequestMapping(value = "/admin/getSumListMonth", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> Listt(AdminChartVO cv,Model model) {
        cv.setJan("2022-01");
        cv.setFeb("2022-02");
        cv.setMar("2022-03");
        cv.setApr("2022-04");
        cv.setMay("2022-05");
        cv.setJun("2022-06");
        cv.setJul("2022-07");
        cv.setAug("2022-08");
        cv.setSep("2022-09");
        cv.setOct("2022-10");
        cv.setNov("2022-11");
        cv.setDece("2022-12");
		List<AdminChartVO> turtle= CashService.getSumListMonth(cv);	
			return turtle;	
	}
	@RequestMapping(value = "/admin/getSumListMonth20", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> Liste(AdminChartVO cv,Model model) {
        cv.setJan("2020-01");
        cv.setFeb("2020-02");
        cv.setMar("2020-03");
        cv.setApr("2020-04");
        cv.setMay("2020-05");
        cv.setJun("2020-06");
        cv.setJul("2020-07");
        cv.setAug("2020-08");
        cv.setSep("2020-09");
        cv.setOct("2020-10");
        cv.setNov("2020-11");
        cv.setDece("2020-12");
		List<AdminChartVO> turtle= CashService.getSumListMonth20(cv);	
			return turtle;	
	}
	@RequestMapping(value = "/admin/getSumListMonth21", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> Liqtt(AdminChartVO cv,Model model) {
        cv.setJan("2021-01");
        cv.setFeb("2021-02");
        cv.setMar("2021-03");
        cv.setApr("2021-04");
        cv.setMay("2021-05");
        cv.setJun("2021-06");
        cv.setJul("2021-07");
        cv.setAug("2021-08");
        cv.setSep("2021-09");
        cv.setOct("2021-10");
        cv.setNov("2021-11");
        cv.setDece("2021-12");
		List<AdminChartVO> turtle= CashService.getSumListMonth21(cv);	
			return turtle;	
	}

	@RequestMapping(value = "/admin/getSumListYear", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> Listto(AdminChartVO cv,Model model) {
		cv.setOneyear("2018");
		cv.setTwoyear("2019");
		cv.setThreeyear("2020");
		cv.setFouryear("2021");
		cv.setFiveyear("2022");
        
    
		List<AdminChartVO> turtle= CashService.getSumListYear(cv);	
			return turtle;	
	}	
	@RequestMapping(value = "/admin/getSumListBarDay", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListBarDay(AdminChartVO cv,Model model) throws Exception{
		  LocalDate now = LocalDate.now();	  
		  LocalDate BeforWeek = now.minusDays(7);
		  LocalDate month = LocalDate.now();
		  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");	
			
		  cv.setDd(now);
		  cv.setWeek(BeforWeek);
		  cv.setMonth(month.format(formatter));
		  System.out.println(month.format(formatter));
		  
	        List<AdminChartVO> turtlee= CashService.getSumListBarDay(cv);
	        List<AdminChartVO> tu= CashService.getSumListBarWeek(cv);	        
	        List<AdminChartVO> three= CashService.getSumListBarMonth(cv);
	     	        
	        turtlee.addAll(tu);
	        turtlee.addAll(three);
	        System.out.println(turtlee);   
	       
			return turtlee ;
	}
	@RequestMapping(value = "/admin/getSumListBarWeek", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListBarWeek(AdminChartVO cv,Model model) throws Exception{
		  LocalDate now = LocalDate.now();
		  LocalDate BeforWeek = now.minusDays(7);
		  cv.setDd(now);
		  cv.setWeek(BeforWeek);
	        List<AdminChartVO> turelee= CashService.getSumListBarWeek(cv);
			return turelee ;
	}
	@RequestMapping(value = "/admin/getSumListBarMonth", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListBarMonth(AdminChartVO cv,Model model) throws Exception{
		  
		  LocalDate month = LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");	
			cv.setMonth(month.format(formatter));
	        List<AdminChartVO> turelee= CashService.getSumListBarMonth(cv);
			return turelee ;
	}
	
	@RequestMapping(value = "/admin/getSumListDay", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListDay(AdminChartVO cv,Model model) throws Exception{
			
	        List<AdminChartVO> turtlee= CashService.getSumListDay(cv);
			return turtlee;	
	}	
	@RequestMapping(value = "/admin/getSumListMonth1", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListMonth1(AdminChartVO cv,Model model) throws Exception{
		
			   List<AdminChartVO> turtleee= CashService.getSumListMonth1(cv);  			   
			   return turtleee;   		   	   
	}
	@RequestMapping(value = "/admin/getSumListMonth2", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListMonth2(AdminChartVO cv,Model model) throws Exception{		   
			   List<AdminChartVO> turtleee= CashService.getSumListMonth2(cv);  			   
			   return turtleee;   		   	   
	}
	@RequestMapping(value = "/admin/getSumListMonth4", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListMonth4(AdminChartVO cv,Model model) throws Exception{
		LocalDate now = LocalDate.now();	
		cv.setDd(now);
			   List<AdminChartVO> turtleee= CashService.getSumListMonth4(cv);  			   
			   return turtleee;   		   	   
	}
	@RequestMapping(value = "/admin/getSumListMonth5", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListMonth5(AdminChartVO cv,Model model) throws Exception{
		LocalDate now = LocalDate.now();
		  cv.setDd(now);
			   List<AdminChartVO> turtleee= CashService.getSumListMonth5(cv);  			   
			   return turtleee;   		   	   
	}
	@RequestMapping(value = "/admin/getSumListMonth6", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListMonth6(AdminChartVO cv,Model model) throws Exception{
		LocalDate now = LocalDate.now();
		  cv.setDd(now);
			   List<AdminChartVO> turtleee= CashService.getSumListMonth6(cv);  			   
			   return turtleee;   		   	   
	}
	@RequestMapping(value = "/admin/getSumListMonth7", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListMonth7(AdminChartVO cv,Model model) throws Exception{
		LocalDate now = LocalDate.now();
		  cv.setDd(now);
			   List<AdminChartVO> turtleee= CashService.getSumListMonth7(cv);  			   
			   return turtleee;   		   	   
	}
	@RequestMapping(value = "/admin/getSumListMonth8", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListMonth8(AdminChartVO cv,Model model) throws Exception{
		LocalDate now = LocalDate.now();
		  cv.setDd(now);
			   List<AdminChartVO> turtleee= CashService.getSumListMonth8(cv);  			   
			   return turtleee;   		   	   
	}
	@RequestMapping(value = "/admin/getSumListMonth9", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListMonth9(AdminChartVO cv,Model model) throws Exception{
		LocalDate now = LocalDate.now();
		  cv.setDd(now);
			   List<AdminChartVO> turtleee= CashService.getSumListMonth9(cv);  			   
			   return turtleee;   		   	   
	}
	@RequestMapping(value = "/admin/getSumListMonth10", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListMonth10(AdminChartVO cv,Model model) throws Exception{
		LocalDate now = LocalDate.now();
		  cv.setDd(now);
			   List<AdminChartVO> turtleee= CashService.getSumListMonth10(cv);  			   
			   return turtleee;   		   	   
	}
	@RequestMapping(value = "/admin/getSumListMonth11", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListMonth11(AdminChartVO cv,Model model) throws Exception{
		LocalDate now = LocalDate.now();
		  cv.setDd(now);
			   List<AdminChartVO> turtleee= CashService.getSumListMonth11(cv);  			   
			   return turtleee;   		   	   
	}
	@RequestMapping(value = "/admin/getSumListMonth12", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListMonth12(AdminChartVO cv,Model model) throws Exception{
		LocalDate now = LocalDate.now();
		  cv.setDd(now);
			   List<AdminChartVO> turtleee= CashService.getSumListMonth12(cv);  			   
			   return turtleee;   		   	   
	}
	@RequestMapping(value = "/admin/getSumListPie", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListPie(AdminChartVO cv,Model model) throws Exception{		   
			   List<AdminChartVO> turtleee= CashService.getSumListPie(cv);  			   
			   return turtleee;   		   	   
	}
	@RequestMapping(value = "/admin/getSumListPieDay", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListPieDay(AdminChartVO cv,Model model) throws Exception{	
		LocalDate now = LocalDate.now();			
		cv.setDd(now);	
			   List<AdminChartVO> turtleee= CashService.getSumListPieDay(cv);  			   
			   return turtleee;   		   	   
	}
	@RequestMapping(value = "/admin/getSumListPieMonth", method = RequestMethod.POST)
	public  @ResponseBody List<AdminChartVO> getSumListPieMonth(AdminChartVO cv,Model model) throws Exception{	
		LocalDate month = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");	
		cv.setMonth(month.format(formatter));
			   List<AdminChartVO> turtleee= CashService.getSumListPieMonth(cv);  			   
			   return turtleee;   		   	   
	}
}
