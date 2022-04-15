package org.ko.kherb.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.ko.kherb.client.member.service.ClientMailService;
import org.ko.kherb.client.member.service.ClientMemberService;
import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ClientMemberController {
	@Autowired
	private ClientMemberService clientMemberService;
	@Autowired
	private ClientMailService mailService;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	@RequestMapping(value = "/idSearch", method = RequestMethod.GET)
	public String idSearchForm() {
		return "clientMember/idSearch";
	}
	
	@RequestMapping(value = "/idSearch", method = RequestMethod.POST)
	@ResponseBody
	public String idSearch(@RequestParam String name, @RequestParam String email, MemberVO member) {
		member.setName(name);
		member.setEmail(email);
		String id = clientMemberService.getIdSearch(member);
		System.out.println(id);
		return id;
	}
	
	@RequestMapping(value = "/pwSearch", method = RequestMethod.GET)
	public String pwSearchForm() {
		return "clientMember/pwSearch";
	}
	
	@RequestMapping(value = "/pwSearch", method = RequestMethod.POST)
	@ResponseBody
	public int pwSearch(@RequestParam String name, @RequestParam String email, @RequestParam String id, MemberVO member) {
		member.setName(name);
		member.setEmail(email);
		member.setId(id);
	
		int result = clientMemberService.getPwSearch(member);
		System.out.println(result);
		if(result>0) {
			String key = mailService.pwSearchEmail(email);
			String encodedPwd = bCryptPasswordEncoder.encode(key);
			member.setPw(encodedPwd);
		System.out.println(key);	
			clientMemberService.updateMyPw(member);
			return 1;
		} else {
			return 0;
		}
		// 1. 정보 체크 2. 결과 따라 메일 보낸다  3. 비번 바꾼다
		
		
	}
	
	
	@RequestMapping(value = "/my/info", method = RequestMethod.GET)
	public String myInfo(MemberVO member, Model model, HttpSession session) {
		member = (MemberVO) session.getAttribute("sessionMember");
		model.addAttribute("member", clientMemberService.getMyInfo(member));
		return "clientMember/clientMemberMyInfo";
	}

	@RequestMapping(value = "/my/pwd", method = RequestMethod.GET)
	public String myPwdChange() {

		return "clientMember/clientMemberMyPwd";
	}

	@RequestMapping(value = "/my/pwd", method = RequestMethod.POST)
	@ResponseBody
	public boolean myPwdChaneForm( @RequestParam String pw1, @RequestParam String pw, MemberVO member, Model model, HttpSession session) {
		member = (MemberVO) session.getAttribute("sessionMember");
		member.setPw(pw);
		MemberVO login = clientMemberService.getMyPw(member);
		boolean pwdMatch = bCryptPasswordEncoder.matches(member.getPw(), login.getPw());
		if(!pwdMatch) {
			return false;
		} else {
			String encodedPwd = bCryptPasswordEncoder.encode(pw1);
			member.setPw(encodedPwd);
			
			clientMemberService.updateMyPw(member);
			return true;
		}
	}
	
	
/*	
	@RequestMapping(value = "/my/pwd", method = RequestMethod.POST)
	public String myPwdChaneForm(@RequestParam String pw1, MemberVO member, Model model, HttpSession session) {
		
		MemberVO login = clientMemberService.getMyPw(member);
		boolean pwdMatch = bCryptPasswordEncoder.matches(member.getPw(), login.getPw());
		
		if(!pwdMatch) {
			model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			return "clientMember/clientMemberMyPwd";
		} else {
			String rawPassword = member.getPw();
			String encodedPwd = bCryptPasswordEncoder.encode(rawPassword);
			member.setPw(encodedPwd);
			
			clientMemberService.updateMyPw(member);
			return "redirect:/my/info";
		}
	}
*/
	@RequestMapping(value = "/my/upd", method = RequestMethod.GET)
	public String myInfoUpdForm(MemberVO member, Model model, HttpSession session) {
		member = (MemberVO) session.getAttribute("sessionMember");
		model.addAttribute("member", clientMemberService.getMyInfo(member));

		return "clientMember/clientMemberMyUpd";
	}

	@RequestMapping(value = "/my/upd", method = RequestMethod.POST)
	public String myInfoUpd(MemberVO member, Model model, HttpSession session) throws IOException{
		System.out.println("도매/소매 회원 회원 정보수정 시도");
		MultipartFile uploadFile = member.getUploadFile();
		if (member.getMcode()=="D" && !uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			String path = "C:\\kherb\\kherb\\src\\main\\resources\\MimgFile";
			
			System.out.println("저장파일 경로: "+ path);
			String bFileName = member.getMimg();
			File file  = new File (path + "\\" + bFileName);
			if (file.exists()) {
				System.out.println(bFileName + " 존재 합니다.");
				file.delete();
			}else {
				System.out.println(bFileName +"이 존재 하지 않습니다.");
			}
			member.setMimg(fileName);
			uploadFile.transferTo(new File("C:\\kherb\\kherb\\src\\main\\resources\\MimgFile", fileName));
		}
		System.out.println("파일 업로드 완료");
		System.out.println(member.getMcode());
		clientMemberService.updateMyInfo(member);
		return "redirect:/my/info";
	}


	@RequestMapping(value = "/my/del", method = RequestMethod.GET)
	public String myDeleteForm(Model model, OrderVO order, HttpSession session, MemberVO member) {
		member = (MemberVO) session.getAttribute("sessionMember");
		String a = clientMemberService.delDate(member);
		model.addAttribute("delDate", clientMemberService.delDate(member));
		
		return "clientMember/clientMemberMyDel";
	}

	@RequestMapping(value = "/my/del", method = RequestMethod.POST)
	@ResponseBody
	public boolean myDelete(@RequestParam String pw, MemberVO member, Model model, HttpSession session) {
		member = (MemberVO) session.getAttribute("sessionMember");
		member.setPw(pw);
		MemberVO login = clientMemberService.getMyPw(member);
		boolean pwdMatch = bCryptPasswordEncoder.matches(member.getPw(), login.getPw());
		if(!pwdMatch) {
			return false;
		} else {
			List<OrderVO> orders = clientMemberService.getOrders(member);
			for(OrderVO i:orders) {
				clientMemberService.insertBackup(i);
			}
			
			clientMemberService.deleteMe(member);
			session.invalidate();
						
			return true;
		}
	}

	/*
	@RequestMapping(value = "/my/del", method = RequestMethod.POST)
	public String myDelete(MemberVO member, HttpSession session, Model model) {
		
		MemberVO login = clientMemberService.getMyPw(member);
		boolean pwdMatch = bCryptPasswordEncoder.matches(member.getPw(), login.getPw());
		
		if(!pwdMatch) {
			model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			return "clientMember/clientMemberMyDel";
		} else {
			
			List<OrderVO> orders = clientMemberService.getOrders(member);
			for(OrderVO i:orders) {
				clientMemberService.insertBackup(i);
			}
			
			clientMemberService.deleteMe(member);
			session.invalidate();
			
		}
		return "redirect:/";
	}
*/
	

	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String MemberJoinView(MemberVO memberVO) {
		System.out.println("회원 가입 화면으로 이동");
		return "clientMember/clientMemberJoin";
	}
	
	@RequestMapping(value = "/join/test", method = RequestMethod.GET)
	public String MemberJoin(MemberVO memberVO) {
		System.out.println("회원 가입 화면으로 이동");
		return "clientMember/test";
	}
	@RequestMapping(value = "join/do", method = RequestMethod.POST)
	public String doMemberJoin(Model model, @Valid MemberVO memberVO, BindingResult result) throws IOException {

		System.out.println("도매 회원 회원가입 시도");
		if (result.hasErrors()) {
			System.out.println("도매 회원가입 에러 발생");
			model.addAttribute("do_memberVO", memberVO);
			return "clientMember/clientMemberJoin";

		} else {
			MultipartFile uploadFile = memberVO.getUploadFile();
			if (!uploadFile.isEmpty()) {
				String fileName = uploadFile.getOriginalFilename();
				memberVO.setMimg(fileName);
				uploadFile.transferTo(new File("C:\\kherb\\kherb\\src\\main\\resources\\MimgFile", fileName));
			}
			System.out.println("파일 업로드 완료");
			
			
			// 비밀번호 암호화
			String rawPassword = memberVO.getPw();
			String encodedPwd = bCryptPasswordEncoder.encode(rawPassword);
			System.out.println(rawPassword); System.out.println(encodedPwd);
			memberVO.setPw(encodedPwd);
			
			clientMemberService.insertMember(memberVO);
			System.out.println("도매 회원/회원가입 완료");
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value = "/join/so", method = RequestMethod.POST)
	public String soMemberJoin(Model model, @Valid MemberVO memberVO, BindingResult result) throws IOException {

		System.out.println("소매 회원 회원가입 시도");
		if (result.hasErrors()) {
			System.out.println("소매 회원가입 에러 발생");
			model.addAttribute("so_memberVO", memberVO);
			return "clientMember/clientMemberJoin";

		} else {
			// 비밀번호 암호화
			String rawPassword = memberVO.getPw();
			String encodedPwd = bCryptPasswordEncoder.encode(rawPassword);
			memberVO.setPw(encodedPwd);
			
			memberVO.setMimg("개인(소매)/img2");
			clientMemberService.insertMember(memberVO);
			System.out.println("소매 회원/회원가입 완료");
			return "redirect:/login";
		}
	}

	@RequestMapping(value = "/idCheck", method = { RequestMethod.POST })
	@ResponseBody
	public int idCheckFunction(@RequestBody String id) throws Exception {
		System.out.println("Controller 중복확인");
		int result = clientMemberService.idCheck(id);
		System.out.println(result);
		return result;
	}

	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	@ResponseBody
	public String emailAuthFunc(@RequestBody String email) throws Exception {
		System.out.println("email Controller 중복확인");
		int result = clientMemberService.emailAuthBack(email);
		System.out.println(result);
		String key = "alJoin";
		if(result > 1) {
			// 이미 가입된 회원
			System.out.println(key);
			return key;			
		}else {
			// 가입 되지 않은 회원
		System.out.println("가입되지 않은 회원");
		key = mailService.sendMail(email);
		System.out.println(key);
		return key;		
		}
	}
}
