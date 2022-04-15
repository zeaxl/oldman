package org.ko.kherb.admin.chart;

import java.util.List;

import org.ko.kherb.vo.AdminChartVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminChartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<AdminChartVO> getCash(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getCash() 기능 처리");
			return mybatis.selectList("CashDAO.getCash",cv);
			
			}
	
	public List<AdminChartVO> getSumListMonth(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumList() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListMonth",cv);
			
			}
	public List<AdminChartVO> getSumListMonth20(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListMonth20() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListMonth20",cv);
			
			}
	public List<AdminChartVO> getSumListMonth21(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListMonth21() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListMonth21",cv);
			
			}
	public List<AdminChartVO> getSumListDay(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListDay() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListDay",cv);
			
			}
	public List<AdminChartVO> getSumListYear(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumList() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListYear",cv);
			
			}
	public List<AdminChartVO> getSumListRank(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListRank() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListRank",cv);
			
			}
	public List<AdminChartVO> getSumListRankD(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListRankD() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListRankD",cv);
			
			}
	
	public AdminChartVO getSum(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSum() 기능 처리");
			return (AdminChartVO) mybatis.selectOne("CashDAO.getSum",cv);
			
			}
	public AdminChartVO getSumToday(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSum() 기능 처리");
			return (AdminChartVO) mybatis.selectOne("CashDAO.getSumToday",cv);
			
			}
	
	public AdminChartVO getSumMonth(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSum() 기능 처리");
			return (AdminChartVO) mybatis.selectOne("CashDAO.getSumMonth",cv);
			
			}
	public AdminChartVO getSumYear(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSum() 기능 처리");
			return (AdminChartVO) mybatis.selectOne("CashDAO.getSumYear",cv);
			
			}
	public  List<AdminChartVO> getSumListPie(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListPie() 기능 처리");
			return  mybatis.selectList("CashDAO.getSumListPie",cv);
			
			}
	public  List<AdminChartVO> getSumListPieDay(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListPieDay() 기능 처리");
			return  mybatis.selectList("CashDAO.getSumListPieDay",cv);
			
			}
	public  List<AdminChartVO> getSumListBarDay(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListBarDay() 기능 처리");
			return  mybatis.selectList("CashDAO.getSumListBarDay",cv);
			
			}
	public  List<AdminChartVO> getSumListBarWeek(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListBarWeek() 기능 처리");
			return  mybatis.selectList("CashDAO.getSumListBarWeek",cv);
			
			}
	public  List<AdminChartVO> getSumListBarMonth(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListBarMonth() 기능 처리");
			return  mybatis.selectList("CashDAO.getSumListBarMonth",cv);
			
			}
	public  List<AdminChartVO> getSumListPieMonth(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListPieMonth() 기능 처리");
			return  mybatis.selectList("CashDAO.getSumListPieMonth",cv);
			
			}
	public List<AdminChartVO> getSumListMonth1(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListMonth1() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListMonth1",cv);
			
			}
	public List<AdminChartVO> getSumListMonth2(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListMonth2() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListMonth2",cv);
			
			}
	public List<AdminChartVO> getSumListMonth4(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListMonth4() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListMonth4",cv);
			
			}
	public List<AdminChartVO> getSumListMonth5(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListMonth5() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListMonth5",cv);
			
			}
	public List<AdminChartVO> getSumListMonth6(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListMonth6() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListMonth6",cv);
			
			}
	public List<AdminChartVO> getSumListMonth7(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListMonth7() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListMonth7",cv);
			
			}
	public List<AdminChartVO> getSumListMonth8(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListMonth8() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListMonth8",cv);
			
			}
	public List<AdminChartVO> getSumListMonth9(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListMonth9() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListMonth9",cv);
			
			}
	public List<AdminChartVO> getSumListMonth10(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListMonth10() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListMonth10",cv);
			
			}
	public List<AdminChartVO> getSumListMonth11(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListMonth11() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListMonth11",cv);
			
			}
	public List<AdminChartVO> getSumListMonth12(AdminChartVO cv) {
		   System.out.println("--->mybatis로 getSumListMonth12() 기능 처리");
			return mybatis.selectList("CashDAO.getSumListMonth12",cv);
			
			}
	}
	

