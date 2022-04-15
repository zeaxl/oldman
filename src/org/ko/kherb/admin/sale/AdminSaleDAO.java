package org.ko.kherb.admin.sale;

import java.util.List;

import org.ko.kherb.vo.AdminSaleVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminSaleDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<AdminSaleVO> getSale(AdminSaleVO sv) {
		   System.out.println("--->mybatis로 getSale() 기능 처리");
			return mybatis.selectList("SaleDAO.getSale",sv);
			
			}
	
	public List<AdminSaleVO> getSaleSearch(AdminSaleVO sv) {
		   System.out.println("--->mybatis로 getSaleSearch() 기능 처리");
			return mybatis.selectList("SaleDAO.getSaleSearch",sv);
			
			}
	public List<AdminSaleVO> getSaleSort(AdminSaleVO sv) {
		   System.out.println("--->mybatis로 getSaleSort() 기능 처리");
			return mybatis.selectList("SaleDAO.getSaleSort",sv);
			
			}
	public List<AdminSaleVO> getSaleInfo(AdminSaleVO sv) {
		   System.out.println("--->mybatis로 getSaleInfo() 기능 처리");
			return mybatis.selectList("SaleDAO.getSaleInfo",sv);
			
			}
	public int getCount(AdminSaleVO sv) {
		return mybatis.selectOne("SaleDAO.getCount", sv);
	}
	public int getSaleInfoCount(AdminSaleVO sv) {
		return mybatis.selectOne("SaleDAO.getSaleInfoCount", sv);
	}
	}
	

