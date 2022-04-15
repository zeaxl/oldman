package org.ko.kherb.admin.product.service;

import java.util.List;
import java.util.Map;

import org.ko.kherb.admin.product.dao.AdminProductDAO;
import org.ko.kherb.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService {

	@Autowired
	private AdminProductDAO adminProductDAO;
	
	public List<ProductVO> getProductList(Map<String, Object> map){
		return adminProductDAO.getProductList(map);
	}
	
	public int getCount( ProductVO pro) {
		return adminProductDAO.getCount(pro);
	}
	
	public ProductVO getProductDetail(ProductVO product) {
		return adminProductDAO.getProductDetail(product);
	}
	
	public void updateProduct(ProductVO product) {
		adminProductDAO.updateProduct(product);
	}
	
	public void deleteProduct(ProductVO product) {
		adminProductDAO.deleteProduct(product);
	}
	
	public ProductVO searchImg(ProductVO product) {
		return adminProductDAO.searchImg(product);
	}
	
	public void insertProduct(ProductVO product) {
		adminProductDAO.insertProduct(product);
	}
	
}