package org.ko.kherb.login.service;

import org.ko.kherb.vo.MemberVO;

public interface LoginService {

	MemberVO getID(MemberVO member);
	
	MemberVO getAdminID(MemberVO member);
	
	int getMemberByEmail(MemberVO member);
	
	MemberVO getMember(MemberVO member);
	
	MemberVO getPw(MemberVO member);
	
	int getCno();
}
