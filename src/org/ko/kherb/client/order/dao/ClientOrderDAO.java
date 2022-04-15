package org.ko.kherb.client.order.dao;

import java.util.List;
import java.util.Map;

import org.ko.kherb.vo.CartVO;
import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.OrderVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientOrderDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int getCount(String id) {
		System.out.println("orderDAO에서 전체글 갯수" + mybatis.selectOne("clientOrderDAO.getcount"));
		return mybatis.selectOne("clientOrderDAO.getcount", id);
	}

	public CartVO orderList(OrderVO order) {
		System.out.println("orderDAO 목록조회기능");
		System.out.println("orderDAO에서 orderVO" + order);
		return mybatis.selectOne("clientOrderDAO.orderList", order);
	}

	
	public MemberVO memberList(String id) {
	    System.out.println("OrderDAO 회원주소조회기능"); 
	    return mybatis.selectOne("clientOrderDAO.memberInfo", id); }
	 

	public int insertOrder(OrderVO order) {
		System.out.println("OrderDAO 주문내역 입력");
		return mybatis.insert("clientOrderDAO.orderInsert", order);	
	}
	
	public int insertPay(OrderVO order) {
		return mybatis.insert("clientOrderDAO.payInsert", order);
	}
	
	public int deleteCart(OrderVO order) {
		return mybatis.delete("clientOrderDAO.cartDelete", order);
	}
	
	public List<OrderVO> myOrder(OrderVO order) {
		System.out.println("OrderDAO 내 주문 목록 조회");
		return mybatis.selectList("clientOrderDAO.myOrder", order);
	}
	
	public List<OrderVO> myOrderDetail(OrderVO order) {
		System.out.println("OrderDAO 내 주문 목록 상세 조회");
		return mybatis.selectList("clientOrderDAO.myOrderDetail", order);
	}
	
	public List<OrderVO> allOrderList(OrderVO order) {
		System.out.println("OrderDAO 내 주문 목록 조회");
		return mybatis.selectList("clientOrderDAO.myOrder", order);
	}
	
	public List<OrderVO> getMyOrderList(Map<String, Object> map) {
		System.out.println("OrderDAO 목록조회기능");
		return mybatis.selectList("clientOrderDAO.getMyOrderList", map);
	}
	
	public void MyOrderDelete(String payno) {
		System.out.println("OrderDAO 관리자 주문 삭제");
		mybatis.delete("clientOrderDAO.deleteOrder", payno);
		mybatis.delete("clientOrderDAO.deletePay", payno);
	}
	
	
}
