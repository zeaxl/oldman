package org.ko.kherb.admin.chart;

import java.util.List;

import org.ko.kherb.vo.AdminChartVO;

public interface AdminChartService {
	
	List<AdminChartVO> getCash(AdminChartVO cv);
	
	List<AdminChartVO> getSumListDay(AdminChartVO cv);
	
	List<AdminChartVO> getSumListYear(AdminChartVO cv);
	
	List<AdminChartVO> getSumListPie(AdminChartVO cv);
	
	List<AdminChartVO> getSumListPieDay(AdminChartVO cv);
	
	List<AdminChartVO> getSumListPieMonth(AdminChartVO cv);
	
	List<AdminChartVO> getSumListBarDay(AdminChartVO cv);
	
	List<AdminChartVO> getSumListBarWeek(AdminChartVO cv);
	
	List<AdminChartVO> getSumListBarMonth(AdminChartVO cv);
	
	List<AdminChartVO> getSumListRank(AdminChartVO cv);
	
	List<AdminChartVO> getSumListRankD(AdminChartVO cv);
	
	List<AdminChartVO> getSumListMonth(AdminChartVO cv);
	
	List<AdminChartVO> getSumListMonth20(AdminChartVO cv);
	
	List<AdminChartVO> getSumListMonth21(AdminChartVO cv);
	
	List<AdminChartVO> getSumListMonth1(AdminChartVO cv);
	List<AdminChartVO> getSumListMonth2(AdminChartVO cv);
	List<AdminChartVO> getSumListMonth4(AdminChartVO cv);
	List<AdminChartVO> getSumListMonth5(AdminChartVO cv);
	List<AdminChartVO> getSumListMonth6(AdminChartVO cv);
	List<AdminChartVO> getSumListMonth7(AdminChartVO cv);
	List<AdminChartVO> getSumListMonth8(AdminChartVO cv);
	List<AdminChartVO> getSumListMonth9(AdminChartVO cv);
	List<AdminChartVO> getSumListMonth10(AdminChartVO cv);
	List<AdminChartVO> getSumListMonth11(AdminChartVO cv);
	List<AdminChartVO> getSumListMonth12(AdminChartVO cv);
	
	
	
	
	AdminChartVO getSum(AdminChartVO cv);
	AdminChartVO getSumToday(AdminChartVO cv);
	AdminChartVO getSumMonth(AdminChartVO cv);
	AdminChartVO getSumYear(AdminChartVO cv);

}
