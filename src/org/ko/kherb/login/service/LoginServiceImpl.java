package org.ko.kherb.login.service;

import org.ko.kherb.login.dao.LoginDAO;
import org.ko.kherb.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO loginDAO;
	
	
	public MemberVO getID(MemberVO member) {
		return loginDAO.getID(member);
	}
	
	public MemberVO getAdminID(MemberVO member) {
		return loginDAO.getAdminID(member);
	}
	
	public int getMemberByEmail(MemberVO member) {
		return loginDAO.getMemberByEmail(member);
	}
	
	public MemberVO getMember(MemberVO member) {
		return loginDAO.getMember(member);
	}
	
	public MemberVO getPw(MemberVO member) {
		return loginDAO.getPw(member);
	}
	
	public int getCno() {
		return loginDAO.getCno();
	}
}
