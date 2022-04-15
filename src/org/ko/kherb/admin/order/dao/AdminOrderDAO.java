package org.ko.kherb.admin.order.dao;

import java.util.List;
import java.util.Map;

import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.OrderVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminOrderDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int getCount() {
		return mybatis.selectOne("AdminOrderDAO.count");
	}
	
	public int getCountP() {
		return mybatis.selectOne("AdminOrderDAO.countP");
	}
	
	public List<OrderVO> allOrderList(OrderVO order) {
		return mybatis.selectList("AdminOrderDAO.AdOrderList", order);
	}
	
	public List<OrderVO> getAdOrderList(Map<String, Object> map) {
		System.out.println("OrderDAO 목록조회기능");
		return mybatis.selectList("AdminOrderDAO.getAdOrderList", map);
	}
	
	public List<MemberVO> getSearchOrderList(Map<String, Object> map) {
		System.out.println("memberDAO 검색기능");
		return mybatis.selectList("AdminOrderDAO.getSelectOrder", map);
	}
	
	public List<OrderVO> allOrderDetail(OrderVO order) {
		System.out.println("OrderDAO 관리자 주문 상세 조회");
		return mybatis.selectList("AdminOrderDAO.allOrderDetail", order);
	}
	
	public void AdOrderDelete(String payno) {
		System.out.println("AdOrderDAO 관리자 주문 삭제");
		mybatis.delete("AdminOrderDAO.deleteOrder", payno);
		mybatis.delete("AdminOrderDAO.deletePay", payno);
	}
}
