package org.ko.kherb.client.index.dao;

import java.util.List;

import org.ko.kherb.vo.OrderVO;
import org.ko.kherb.vo.ProductVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientIndexDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductVO> getNewPro() {
		return mybatis.selectList("ClientIndexDAO.getNewPro");
	}
	
	public List<ProductVO> getRecomPro() {
		return mybatis.selectList("ClientIndexDAO.getRecomPro");
	}
	
	
	public List<ProductVO> getPopularPro() {
		return mybatis.selectList("ClientIndexDAO.getPopularPro");
	}

	

}



