package org.ko.kherb.admin.product.dao;

import java.util.List;
import java.util.Map;

import org.ko.kherb.vo.ProductVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductVO> getProductList(Map<String, Object> map){
		return mybatis.selectList("adminProductDAO.getProductList", map);
	}
	
	public int getCount(ProductVO pro) {
		return mybatis.selectOne("adminProductDAO.getCount", pro);
	}
	
	public ProductVO getProductDetail(ProductVO product) {
		return mybatis.selectOne("adminProductDAO.getProductDetail", product);
	}
	
	public void updateProduct(ProductVO product) {
		mybatis.update("adminProductDAO.updateProduct", product);
	}
	
	public void deleteProduct(ProductVO product) {
		mybatis.delete("adminProductDAO.deleteProduct", product);
	}
	
	public ProductVO searchImg(ProductVO product) {
		return mybatis.selectOne("adminProductDAO.searchImg", product);
	}
	
	public void insertProduct(ProductVO product) {
		mybatis.insert("adminProductDAO.insertProduct", product);
	}
	
	
	
}
