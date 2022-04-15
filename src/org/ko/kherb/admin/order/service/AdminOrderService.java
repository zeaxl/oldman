package org.ko.kherb.admin.order.service;

import java.util.List;
import java.util.Map;

import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.OrderVO;

public interface AdminOrderService {
	
	int getCount(OrderVO order);
	
	int getCountP(OrderVO order);
	
	public List<OrderVO> list(OrderVO order);
	
	List<MemberVO> getSearchOrderList(Map<String, Object> map);
	
	List<OrderVO> getAdOrderList(Map<String, Object> map);
	
	public List<OrderVO> allOrderDetail(OrderVO order);
	
	public void deleteAdOrder(String payno);
	
	

}
