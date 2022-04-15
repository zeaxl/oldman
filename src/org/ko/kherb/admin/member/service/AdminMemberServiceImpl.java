package org.ko.kherb.admin.member.service;

import java.util.List;
import java.util.Map;

import org.ko.kherb.admin.member.dao.AdminMemberDAO;
import org.ko.kherb.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
/*
	public List<MemberVO> getMemberList(MemberVO member) {
		return adminMemberDAO.getMemberList(member);
	}
	*/
	public List<MemberVO> getMemberList(Map<String, Object> map) {
		return adminMemberDAO.getMemberList(map);
	}
	public List<MemberVO> getSearchMemberList(Map<String, Object> map) {
		System.out.println("AdminMemberServiceImpl에서 검색 List 기능");
		return adminMemberDAO.getSearchMemberList(map);
	}
	
	
	public int getCount(Map<String, String> countMap) {
		return adminMemberDAO.getCount(countMap);
	}
	
	public String getSearchKeyword(MemberVO member) {
		return adminMemberDAO.getSearchKeyword(member);
	}
	
	public MemberVO getMemberDetail(MemberVO member) {
		return adminMemberDAO.getMemberDetail(member);
	}
	
	public void updateMember(MemberVO member) {
		adminMemberDAO.updateMember(member);
	}
	
	public int deleteMember(MemberVO member) {
		return adminMemberDAO.deleteMember(member);
	}
	
	public int passMember(MemberVO member) {
		return adminMemberDAO.passMember(member);
	}
	

	public void insertMember(MemberVO vo) {
		adminMemberDAO.insertMember(vo);
	}
	
	public int idCheck(String id) throws Exception{
		int result = adminMemberDAO.idCheck(id);
		return result;
	}


// 도소매 구분
	public int getCount1(MemberVO member) {
		return adminMemberDAO.getCount1(member);
	}
	
	public int getCount2(MemberVO member) {
		return adminMemberDAO.getCount2(member);
	}
	
	public List<MemberVO> getSelectMemberD(Map<String, Object> map) {
		return adminMemberDAO.getSelectMemberD(map);
	}
	
	public List<MemberVO> getSelectMemberS(Map<String, Object> map) {
		return adminMemberDAO.getSelectMemberS(map);
	}	
	
	/* ******************	 테스트중 **************************	
	public List<MemberVO> getDoMember(MemberVO member) {
		return adminMemberDAO.getDoMember(member);
	}
	public List<MemberVO> getMemberListTest() {
		return adminMemberDAO.getMemberListTest();
	}
		//********************	 테스트중 **************************/
}
