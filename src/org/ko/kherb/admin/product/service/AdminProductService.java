package org.ko.kherb.admin.product.service;

import java.util.List;
import java.util.Map;

import org.ko.kherb.vo.ProductVO;

public interface AdminProductService {

	List<ProductVO> getProductList(Map<String, Object> map);
	
	int getCount(ProductVO pro);
	
	ProductVO getProductDetail(ProductVO product);
	
	void updateProduct(ProductVO product);
	
	void deleteProduct(ProductVO product);
	
	ProductVO searchImg(ProductVO product);
	
	void insertProduct(ProductVO product);
	
	
}
