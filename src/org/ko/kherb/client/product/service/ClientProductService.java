package org.ko.kherb.client.product.service;

import java.util.List;
import java.util.Map;

import org.ko.kherb.vo.ProductVO;

public interface ClientProductService {

	List<ProductVO> searchProductList(Map<String, Object> map);
	
	List<Integer> returnProductList(ProductVO pro);
	
	int selectCount(ProductVO pro); 
	
	ProductVO getProductDetail(int pno);
}
