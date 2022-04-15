package org.ko.kherb.admin.sale;

import java.util.List;

import org.ko.kherb.vo.AdminSaleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service

public class AdminSaleServiceImpl implements AdminSaleService{
	@Autowired
	AdminSaleDAO SaleDAO;
	
	public List<AdminSaleVO> getSale(AdminSaleVO sv){
		return SaleDAO.getSale(sv);
		
	}
	public List<AdminSaleVO> getSaleSort(AdminSaleVO sv){
		return SaleDAO.getSaleSort(sv);
		
	}
	
	
	public List<AdminSaleVO> getSaleSearch(AdminSaleVO sv){
		return SaleDAO.getSaleSearch(sv);
		
	}
	public List<AdminSaleVO> getSaleInfo(AdminSaleVO sv){
		return SaleDAO.getSaleInfo(sv);
		
	}
	
	public int getCount(AdminSaleVO sv) {
		return SaleDAO.getCount(sv);
	}
	public int getSaleInfoCount(AdminSaleVO sv) {
		return SaleDAO.getSaleInfoCount(sv);
	}
	
	
	
}
