package org.ko.kherb.admin.order.service;

import java.util.List;
import java.util.Map;
import org.ko.kherb.admin.order.dao.AdminOrderDAO;
import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService {
	@Autowired
	private AdminOrderDAO AdOrderDAO;

	@Override
	public int getCount(OrderVO order) {
		return AdOrderDAO.getCount();
	}
	
	@Override
	public int getCountP(OrderVO order) {
		return AdOrderDAO.getCountP();
	}
	
	@Override
	public List<OrderVO> list(OrderVO order) {
		
		return AdOrderDAO.allOrderList(order);
	}
	
	public List<MemberVO> getSearchOrderList(Map<String, Object> map) {
		System.out.println("AdminOrderServiceImpl에서 검색 List 기능");
		return AdOrderDAO.getSearchOrderList(map);
	}
	
	@Override
	public List<OrderVO> allOrderDetail(OrderVO order) {
		
		return AdOrderDAO.allOrderDetail(order);
	}

	@Override
	public List<OrderVO> getAdOrderList(Map<String, Object> map) {
		
		return AdOrderDAO.getAdOrderList(map);
	}

	@Override
	public void deleteAdOrder(String payno) {
		
		AdOrderDAO.AdOrderDelete(payno);
		
	}

}
