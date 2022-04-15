package org.ko.kherb.client.member.dao;

import java.util.List;

import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.OrderVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientMemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MemberVO getMyInfo(MemberVO member) {
		return (MemberVO) mybatis.selectOne("clientMemberDAO.getMyInfo", member);
	}
	
	// 정보 수정
	public void updateMyInfo(MemberVO member) {
		mybatis.update("clientMemberDAO.updateMyInfo", member);
	}
	
	// 비번 일치여부 확인
	public MemberVO getMyPw(MemberVO member) {
		return (MemberVO) mybatis.selectOne("clientMemberDAO.getMyPw", member);
	}
	
	// 비번 변경
	public void updateMyPw(MemberVO member) {
		mybatis.update("clientMemberDAO.updateMyPw", member);
	}
	
	// 가입
	public void insertMember(MemberVO vo) {
		mybatis.insert("clientMemberDAO.insertDAO", vo);
	}
	
	// 아이디 중복체크
	public int idCheck(String id){
		return mybatis.selectOne("clientMemberDAO.idCheckDAO", id);	
	}

	//이메일 중복체크
	public int emailAuthBack(String email){
		return mybatis.selectOne("clientMemberDAO.emailAuthDAO", email);
	}

	// 탈퇴
	public void deleteMe(MemberVO member) {
		mybatis.delete("clientMemberDAO.deleteMe", member);
	}
	
	public String delDate(MemberVO member) {
		return mybatis.selectOne("clientMemberDAO.delDate", member);
	}
	public List<OrderVO> getOrders(MemberVO member){
		return mybatis.selectList("clientMemberDAO.getOrders", member);
	}
	public void insertBackup(OrderVO order) {
		mybatis.insert("clientMemberDAO.insertBackup", order);
	}
	// 아이디 찾기
	public String getIdSearch(MemberVO member) {
		return mybatis.selectOne("clientMemberDAO.getIdSearch", member);
	}
	// 비밀번호 찾기
	public int getPwSearch(MemberVO member) {
		return mybatis.selectOne("clientMemberDAO.getPwSearch", member);
	}
}
