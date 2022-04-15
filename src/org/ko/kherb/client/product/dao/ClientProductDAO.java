package org.ko.kherb.client.product.dao;

import java.util.List;
import java.util.Map;

import org.ko.kherb.vo.ProductVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository()
public class ClientProductDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductVO> searchProductList(Map<String, Object> map) {
		System.out.println("productDAO 목록조회기능");
		return mybatis.selectList("clientProductDAO.searchProductList", map);
	}
	
	public List<Integer> returnProductList(ProductVO pro) {
		return mybatis.selectList("clientProductDAO.returnProductList", pro);
	}
	
	public int selectCount(ProductVO pro) {
		return mybatis.selectOne("clientProductDAO.selectCount", pro);
	}
	
	public ProductVO getProductDetail(int pno) {
		return mybatis.selectOne("clientProductDAO.getProductDetail", pno);
	}

}