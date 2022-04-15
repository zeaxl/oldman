package org.ko.kherb.client.order.service;

import java.util.List;
import java.util.Map;

import org.ko.kherb.vo.CartVO;
import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.OrderVO;

public interface OrderService {
	
	int getCount(String id);
	
	public CartVO orderList(OrderVO order);
	
	public MemberVO memberList(String id); 
	
	public int insertOrder(OrderVO order);
	
	public int insertPay(OrderVO order);
	
	public int deleteCart(OrderVO order);
	
	public List<OrderVO> myOrder(OrderVO order);
	
	public List<OrderVO> myOrderDetail(OrderVO order);
	
	List<OrderVO> getMyOrderList(Map<String, Object> map);
	
	public void deleteMyOrder(String payno);

}
