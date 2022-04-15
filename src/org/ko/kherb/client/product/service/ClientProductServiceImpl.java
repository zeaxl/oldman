package org.ko.kherb.client.product.service;

import java.util.List;
import java.util.Map;

import org.ko.kherb.client.product.dao.ClientProductDAO;
import org.ko.kherb.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("clientProductService")
public class ClientProductServiceImpl implements ClientProductService {
	@Autowired
	private ClientProductDAO clientProductDAO;
	
	public List<ProductVO> searchProductList(Map<String, Object> map) {
		return clientProductDAO.searchProductList(map);
	}
	
	public List<Integer> returnProductList(ProductVO pro) {
		return clientProductDAO.returnProductList(pro);
	}
	
	public int selectCount(ProductVO pro) {
		return clientProductDAO.selectCount(pro);
	}
	
	public ProductVO getProductDetail(int pno) {
		return clientProductDAO.getProductDetail(pno);
	}
}