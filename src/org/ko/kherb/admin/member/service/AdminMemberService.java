package org.ko.kherb.admin.member.service;

import java.util.List;
import java.util.Map;

import org.ko.kherb.vo.MemberVO;

public interface AdminMemberService {

	List<MemberVO> getMemberList(Map<String, Object> map);

	List<MemberVO> getSearchMemberList(Map<String, Object> map);
	
	int getCount(Map<String, String> countMap);
	
	String getSearchKeyword(MemberVO member);
	
	MemberVO getMemberDetail(MemberVO member);
	
	void updateMember(MemberVO member);
	
	int deleteMember(MemberVO member);
	
	int passMember(MemberVO member);
	
	void insertMember(MemberVO vo);
	
	int idCheck(String id) throws Exception;
	
// 도소매 구분	
	int getCount1(MemberVO member);

	int getCount2(MemberVO member);
	
	List<MemberVO> getSelectMemberD(Map<String, Object> map);
	
	List<MemberVO> getSelectMemberS(Map<String, Object> map);
	
	
	/* ******************	 테스트중 **************************	
	List<MemberVO> getDoMember(MemberVO member);
	List<MemberVO> getMemberListTest();
		//********************	 테스트중 **************************/		
}