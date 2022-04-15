package org.ko.kherb.client.member.service;

import java.util.List;

import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.OrderVO;

public interface ClientMemberService {

	MemberVO getMyInfo(MemberVO member);
	
	void updateMyInfo(MemberVO member);
	
	MemberVO getMyPw(MemberVO member);
	
	void updateMyPw(MemberVO member);
	
	void insertMember(MemberVO vo);
	
	int idCheck(String id) throws Exception;
	
	int emailAuthBack(String email) throws Exception;

	void deleteMe(MemberVO member);
	String delDate(MemberVO member);
	List<OrderVO> getOrders(MemberVO member);
	void insertBackup(OrderVO order);
	
	String getIdSearch(MemberVO member);
	int getPwSearch(MemberVO member);
}
