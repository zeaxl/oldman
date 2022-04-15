package org.ko.kherb.client.order.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.javassist.compiler.ast.Stmnt;
import org.ko.kherb.client.order.dao.ClientOrderDAO;
import org.ko.kherb.vo.CartVO;
import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("orderService")
public class OrderServiceImpl implements OrderService {
	@Autowired
	private ClientOrderDAO orderDAO;
	
	@Override
	public int getCount(String id) {
		System.out.println("OrderService에서 아이디: " + id);
		System.out.println("OrderService에서 전체 글 갯수: " + orderDAO.getCount(id));
		
		return orderDAO.getCount(id);
	}

	@Override
	public CartVO orderList(OrderVO order) {
		System.out.println("OrderService에서 orderVO" + order);
		return orderDAO.orderList(order);
	}

	
	@Override 
	public MemberVO memberList(String id) {
	    return orderDAO.memberList(id); 
	}
	 

	@Override
	public int insertOrder(OrderVO order) {
		
		return orderDAO.insertOrder(order);
	}
	
	@Override
	public int insertPay(OrderVO order) {
		
		return orderDAO.insertPay(order);
	}
	
	@Override
	public int deleteCart(OrderVO order) {
		
		return orderDAO.deleteCart(order);
	}
	
	@Override
	public List<OrderVO> myOrder(OrderVO order) {
		return orderDAO.myOrder(order); 
	}
	
	@Override
	public List<OrderVO> myOrderDetail(OrderVO order) {
		return orderDAO.myOrderDetail(order);
	}
	
	@Override
	public List<OrderVO> getMyOrderList(Map<String, Object> map) {
		
		return orderDAO.getMyOrderList(map);
	}

	@Override
	public void deleteMyOrder(String payno) {
		
		orderDAO.MyOrderDelete(payno);
		
	}

}
