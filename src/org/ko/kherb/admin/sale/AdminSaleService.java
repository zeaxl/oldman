package org.ko.kherb.admin.sale;

import java.util.List;

import org.ko.kherb.vo.AdminSaleVO;

public interface AdminSaleService {
	
	List<AdminSaleVO> getSale(AdminSaleVO sv);
	
	List<AdminSaleVO> getSaleSort(AdminSaleVO sv);
	
	List<AdminSaleVO> getSaleSearch(AdminSaleVO sv);
	
	List<AdminSaleVO> getSaleInfo(AdminSaleVO sv);
	
	
	
	int getSaleInfoCount(AdminSaleVO sv);
	
	int getCount(AdminSaleVO sv); 
	
	
	
	
	
	
	

}
