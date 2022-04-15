package org.ko.kherb.admin.chart;

import java.util.List;

import org.ko.kherb.vo.AdminChartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service

public class AdminChartServiceImpl implements AdminChartService{
	@Autowired
	AdminChartDAO CashDAO;
	
	public List<AdminChartVO> getCash(AdminChartVO cv){
		return CashDAO.getCash(cv);
		
	}
	public List<AdminChartVO> getSumListDay(AdminChartVO cv){
		return CashDAO.getSumListDay(cv);
		
	}
	public List<AdminChartVO> getSumListYear(AdminChartVO cv){
		return CashDAO.getSumListYear(cv);
		
	}
	public List<AdminChartVO> getSumListPie(AdminChartVO cv){
		return CashDAO.getSumListPie(cv);
		
	}
	public List<AdminChartVO> getSumListPieDay(AdminChartVO cv){
		return CashDAO.getSumListPieDay(cv);
		
	}
	public List<AdminChartVO> getSumListBarDay(AdminChartVO cv){
		return CashDAO.getSumListBarDay(cv);
		
	}
	public List<AdminChartVO> getSumListBarWeek(AdminChartVO cv){
		return CashDAO.getSumListBarWeek(cv);
		
	}
	public List<AdminChartVO> getSumListBarMonth(AdminChartVO cv){
		return CashDAO.getSumListBarMonth(cv);
		
	}
	public List<AdminChartVO> getSumListPieMonth(AdminChartVO cv){
		return CashDAO.getSumListPieMonth(cv);
		
	}
	public List<AdminChartVO> getSumListRank(AdminChartVO cv){
		return CashDAO.getSumListRank(cv);
		
	}
	public List<AdminChartVO> getSumListRankD(AdminChartVO cv){
		return CashDAO.getSumListRankD(cv);
		
	}
	public List<AdminChartVO> getSumListMonth(AdminChartVO cv){
		return CashDAO.getSumListMonth(cv);
		
	}
	public List<AdminChartVO> getSumListMonth20(AdminChartVO cv){
		return CashDAO.getSumListMonth20(cv);
		
	}
	public List<AdminChartVO> getSumListMonth21(AdminChartVO cv){
		return CashDAO.getSumListMonth21(cv);
		
	}
	
	public AdminChartVO getSum(AdminChartVO cv){
		return CashDAO.getSum(cv);
		
	}
	public AdminChartVO getSumToday(AdminChartVO cv){
		return CashDAO.getSumToday(cv);
		
	}
	public AdminChartVO getSumMonth(AdminChartVO cv){
		return CashDAO.getSumMonth(cv);
		
	}
	public AdminChartVO getSumYear(AdminChartVO cv){
		return CashDAO.getSumYear(cv);
		
	}
	
	
	
	
	public List<AdminChartVO> getSumListMonth1(AdminChartVO cv){
		return CashDAO.getSumListMonth1(cv);
		
	}
	public List<AdminChartVO> getSumListMonth2(AdminChartVO cv){
		return CashDAO.getSumListMonth2(cv);
		
	}
	public List<AdminChartVO> getSumListMonth4(AdminChartVO cv){
		return CashDAO.getSumListMonth4(cv);
		
	}
	public List<AdminChartVO> getSumListMonth5(AdminChartVO cv){
		return CashDAO.getSumListMonth5(cv);
		
	}
	public List<AdminChartVO> getSumListMonth6(AdminChartVO cv){
		return CashDAO.getSumListMonth6(cv);
		
	}
	public List<AdminChartVO> getSumListMonth7(AdminChartVO cv){
		return CashDAO.getSumListMonth7(cv);
		
	}
	public List<AdminChartVO> getSumListMonth8(AdminChartVO cv){
		return CashDAO.getSumListMonth8(cv);
		
	}
	public List<AdminChartVO> getSumListMonth9(AdminChartVO cv){
		return CashDAO.getSumListMonth9(cv);
		
	}
	public List<AdminChartVO> getSumListMonth10(AdminChartVO cv){
		return CashDAO.getSumListMonth10(cv);
		
	}
	public List<AdminChartVO> getSumListMonth11(AdminChartVO cv){
		return CashDAO.getSumListMonth11(cv);
		
	}
	public List<AdminChartVO> getSumListMonth12(AdminChartVO cv){
		return CashDAO.getSumListMonth12(cv);
		
	}
	
}
