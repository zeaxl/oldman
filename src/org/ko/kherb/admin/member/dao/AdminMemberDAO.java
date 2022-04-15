package org.ko.kherb.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.ko.kherb.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminMemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*
	public List<MemberVO> getMemberList(MemberVO member) {
		System.out.println("memberDAO 목록조회기능");
		return mybatis.selectList("adminMemberDAO.getMemberList", member);
	}
	*/
	public List<MemberVO> getMemberList(Map<String, Object> map) {
		System.out.println("memberDAO 목록조회기능");
		return mybatis.selectList("adminMemberDAO.getMemberList", map);
	}

	
	public List<MemberVO> getSearchMemberList(Map<String, Object> map) {
		System.out.println("memberDAO 검색기능");
		return mybatis.selectList("adminMemberDAO.getSelectMember", map);
	}
	
	public int getCount(Map<String, String> countMap) {
		return mybatis.selectOne("adminMemberDAO.getCount", countMap);
	}
	
	public String getSearchKeyword(MemberVO member) {
		System.out.println("검색다오되냐");
		return mybatis.selectOne("adminMemberDAO.getSearchKeyword", member);
	}

	
	public MemberVO getMemberDetail(MemberVO member) {
		return mybatis.selectOne("adminMemberDAO.getMemberDetail", member);
	}
	
	public void updateMember(MemberVO member) {
		mybatis.update("adminMemberDAO.updateMember", member);
	}
	
	public int deleteMember(MemberVO member) {
		return mybatis.delete("adminMemberDAO.deleteMember", member);
	}
	
	public int passMember(MemberVO member) {
		return mybatis.update("adminMemberDAO.passMember", member);
	}
	
	public void insertMember(MemberVO vo) {
		System.out.println("===> Mybatis로 insertBoard() 기능 처리");
		mybatis.insert("clientMemberDAO.insertDAO", vo);
	}
	
	public int idCheck(String id){
		System.out.println("===> Mybatis로 idCheck() 기능 처리");
		return mybatis.selectOne("clientMemberDAO.idCheckDAO", id);
		
	}
	
// 도소매 구분
	public int getCount1(MemberVO member) {
		return mybatis.selectOne("adminMemberDAO.getCount1", member);
	}
	
	public int getCount2(MemberVO member) {
		return mybatis.selectOne("adminMemberDAO.getCount2", member);
	}
	
	public List<MemberVO> getSelectMemberD(Map<String, Object> map) {
		System.out.println("memberDAO 도매구분기능");
		return mybatis.selectList("adminMemberDAO.getSelectMemberD", map);
	}
	
	public List<MemberVO> getSelectMemberS(Map<String, Object> map) {
		System.out.println("memberDAO 소매구분기능");
		return mybatis.selectList("adminMemberDAO.getSelectMemberS", map);
	}
	
	/* ******************	 테스트중 **************************	
	public List<MemberVO> getDoMember(MemberVO member) {
		System.out.println("memberDAO getDoMember 목록조회기능");
		return mybatis.selectList("adminMemberDAO.getDoMember", member);
	}
	public List<MemberVO> getMemberListTest() {
		System.out.println("memberDAO 목록조회기능");
		return mybatis.selectList("adminMemberDAO.getMemberListTest");
	}
		//********************	 테스트중 **************************/		
}
