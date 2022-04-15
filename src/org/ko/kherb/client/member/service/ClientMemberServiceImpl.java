package org.ko.kherb.client.member.service;

import java.util.List;

import org.ko.kherb.client.member.dao.ClientMemberDAO;
import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("clientMemberService")
public class ClientMemberServiceImpl implements ClientMemberService {

	@Autowired
	private ClientMemberDAO memberDAO;
	
	public MemberVO getMyInfo(MemberVO member) {
		return memberDAO.getMyInfo(member);
	}
	
	public void updateMyInfo(MemberVO member) {
		memberDAO.updateMyInfo(member);
	}
	
	public MemberVO getMyPw(MemberVO member) {
		return memberDAO.getMyPw(member);
	}
	
	public void updateMyPw(MemberVO member) {
		memberDAO.updateMyPw(member);
	}
	
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);
	}
	
	public int idCheck(String id) throws Exception{
		int result = memberDAO.idCheck(id);
		return result;
	}
	
	public int emailAuthBack(String email) throws Exception{
		int result = memberDAO.emailAuthBack(email);
		return result;
	}
	
	public void deleteMe(MemberVO member) {
		memberDAO.deleteMe(member);
	}
	
	public String delDate(MemberVO member) {
		return memberDAO.delDate(member);
	}
	
	public List<OrderVO> getOrders(MemberVO member){
		return memberDAO.getOrders(member);
	}
	
	public void insertBackup(OrderVO order) {
		memberDAO.insertBackup(order);
	}
	
	public String getIdSearch(MemberVO member) {
		return memberDAO.getIdSearch(member);
	}
	
	public int getPwSearch(MemberVO member) {
		return memberDAO.getPwSearch(member);
	}
}
