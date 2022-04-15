package org.ko.kherb.client.cart.dao;

import java.util.List;

import org.ko.kherb.vo.CartVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientCartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CartVO> getCartList(String userId){
		System.out.println("CartDAO 장바구니 목록 조회");
		return mybatis.selectList("clientCartDAO.getCartList", userId);
	}

	public int sumPrice(String userId){
		System.out.println("CartDAO 장바구니 총금액");
		Integer totalSum = mybatis.selectOne("clientCartDAO.sumPrice", userId);
		if (totalSum != null) {
			System.out.println("totalSum : null 이 아닐 때");
			return totalSum;
		}else {
			System.out.println("totalSum : null일 때");
			return 0;		
		}
	}
	
	public void insertCart(CartVO cart) {
		System.out.println("CartDAO 장바구니 등록");
		mybatis.insert("clientCartDAO.insertCart", cart);
	}
	
	public int checkCart(CartVO cart) {
		System.out.println("CartDAO 장바구니 확인");
		return mybatis.selectOne("clientCartDAO.checkCart", cart);
	}
	
	public void updateCart(CartVO cart) {
		System.out.println("CartDAO 장바구니 수량 변경");
		mybatis.update("clientCartDAO.updateCart", cart);
	}
	
	public void deleteCart(CartVO cart){
		System.out.println("CartDAO 장바구니 삭제");
		mybatis.delete("clientCartDAO.deleteCart", cart);
	}
	
	public void deleteAllCart(String userId){
		System.out.println("CartDAO 장바구니 전체삭제");
		mybatis.delete("clientCartDAO.deleteAllCart", userId);
	}
	
	public void deleteChoiceCart(String cno){
		System.out.println("CartDAO 장바구니 선택삭제");
		mybatis.delete("clientCartDAO.deleteCart", cno);
	}
	
}