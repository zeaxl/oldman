package org.ko.kherb.client.index.service;

import java.util.List;

import org.ko.kherb.client.index.dao.ClientIndexDAO;
import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.OrderVO;
import org.ko.kherb.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("clientIndexService")
public class ClientIndexServiceImpl implements ClientIndexService {

	@Autowired
	private ClientIndexDAO clientIndexDAO;
	
	//  신상품데이터  3개 가져오기
		public List<ProductVO> getNewPro() {
			return clientIndexDAO.getNewPro();
		}
	// 필요한 상품 데이터 조회
		public List<ProductVO> getRecomPro(){
			return clientIndexDAO.getRecomPro();
		}
		
	// Payno 조회하기
		public List<ProductVO> getPopularPro() {
			return clientIndexDAO.getPopularPro();
		}

	// 신상품 3개 조회
	
}
