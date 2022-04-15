package org.ko.kherb.client.cart.service;

import java.util.List;

import org.ko.kherb.client.cart.dao.ClientCartDAO;
import org.ko.kherb.vo.CartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("clientCartService")
public class ClientCartServiceImpl implements ClientCartService {
	
	@Autowired
	private ClientCartDAO clientCartDAO;
	
	public List<CartVO> getCartList(String userId){
		return clientCartDAO.getCartList(userId);
	}
	
	public int sumPrice(String userId) {
		return clientCartDAO.sumPrice(userId);
	}
	
	public void insertCart(CartVO cart) {
		clientCartDAO.insertCart(cart);
	}
	
	public int checkCart(CartVO cart) {
		return clientCartDAO.checkCart(cart);
	}
	
	public void updateCart(CartVO cart) {
		clientCartDAO.updateCart(cart);
	}
	
	public void deleteCart(CartVO cart) {
		clientCartDAO.deleteCart(cart);
	}
	public void deleteAllCart(String userId) {
		clientCartDAO.deleteAllCart(userId);
	}
	public void deleteChoiceCart(String cno) {
		clientCartDAO.deleteChoiceCart(cno);
	}
	
}
