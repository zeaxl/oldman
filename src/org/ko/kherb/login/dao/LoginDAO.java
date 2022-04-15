package org.ko.kherb.login.dao;

import org.ko.kherb.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MemberVO getID(MemberVO member) {
		System.out.println("===> Mybatis로 getID() 기능 처리");
		return (MemberVO) mybatis.selectOne("loginDAO.getID", member);
//		return (BoardVO) getSqlSession().selectOne("BoardDAO.getBoard", vo);
	}
	
	public MemberVO getAdminID(MemberVO member) {
		System.out.println("===> Mybatis로 getAdminID() 기능 처리");
		return (MemberVO) mybatis.selectOne("loginDAO.getAdminID", member);
	}
	
	public int getMemberByEmail(MemberVO member) {
		return mybatis.selectOne("loginDAO.getMemberByEmail", member);
	}
	
	public MemberVO getMember(MemberVO member) {
		return mybatis.selectOne("loginDAO.getMember", member);
	}
	
	public MemberVO getPw(MemberVO member) {
		return mybatis.selectOne("loginDAO.getPw", member);
	}
	public int getCno() {
		return mybatis.selectOne("loginDAO.getCno");
	}
}
