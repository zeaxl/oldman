package org.ko.kherb.client.cart.service;

import java.util.List;

import org.ko.kherb.vo.CartVO;

public interface ClientCartService {
	
	/* 카트 목록 */
	List<CartVO> getCartList(String userId);
	
	public int sumPrice(String userId);
	
	public void insertCart(CartVO cart);
	public int checkCart(CartVO cart);
	
	
	public void updateCart(CartVO cart);
	
	public void deleteCart(CartVO cart);
	public void deleteAllCart(String userId);	
	public void deleteChoiceCart(String cno);

}
