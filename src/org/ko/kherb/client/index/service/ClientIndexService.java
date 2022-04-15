package org.ko.kherb.client.index.service;

import java.util.List;

import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.OrderVO;
import org.ko.kherb.vo.ProductVO;

public interface ClientIndexService {
	// 신상품 3개 가져오기
	List<ProductVO> getNewPro();
	
	// 추천상품 가져오기
	List<ProductVO> getRecomPro();
		
	// Payno 가져오기
	List<ProductVO> getPopularPro();
	
		
}
