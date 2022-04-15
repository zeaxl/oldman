package org.ko.kherb.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.validation.Valid;

import org.ko.kherb.admin.member.service.AdminMemberService;
import org.ko.kherb.vo.MemberVO;
import org.ko.kherb.vo.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;
	
	
	// 검색 조건 목록
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new LinkedHashMap<String, String>();
		conditionMap.put("id", "아이디");
		conditionMap.put("name", "회원명");
		System.out.println(conditionMap);
		return conditionMap;
	}

	@RequestMapping(value = "/admin/mem", method = RequestMethod.GET)
	public String memberlist(PageVO pageVO, MemberVO member, Model model,
			@RequestParam(value = "searchKeyword", required = true, defaultValue = "") String searchKeyword,
			@RequestParam(value = "searchCondition", required = true, defaultValue = "id") String searchCondition) {
		Map<String, String> countMap = new HashMap<String, String>();
		countMap.put("searchKeyword", searchKeyword);
		countMap.put("searchCondition", searchCondition);

		int total = adminMemberService.getCount(countMap);// 나중에 page 총 갯수도 나눠야함.
		String page = pageVO.getPage();
		int pageNo = 1;
		int listSize = 10;
		int pageSize = 5;
		if (page != null) {
			pageNo = Integer.parseInt(page);
		}
		int startRow = (pageNo - 1) * listSize;
		MemberVO search = new MemberVO(searchCondition, searchKeyword);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", listSize);
		map.put("offset", startRow);

		PageVO paging = new PageVO(total, pageNo, listSize, pageSize);
		model.addAttribute("paging", paging);
		model.addAttribute("search", search);
		model.addAttribute("member", adminMemberService.getMemberList(map));
		return "adminMember/adminMemberList";
	}

	// http://localhost:8080/admin/mem/1
	@RequestMapping(value = "/admin/mem/{gPage}", method = RequestMethod.POST)
	public String memberlist2(PageVO pageVO, MemberVO member, Model model, @PathVariable("gPage") String gPage,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(value = "searchCondition", required = false) String searchCondition,
			@ModelAttribute("conditionMap") Map<String, String> conditionMap) {
		System.out.println("/admin/mem/{gPage} //post 검색 컨트롤러");
		System.out.println(conditionMap);
		Map<String, String> countMap = new HashMap<String, String>();
		countMap.put("searchKeyword", searchKeyword);
		countMap.put("searchCondition", searchCondition);

		int total = adminMemberService.getCount(countMap);// 나중에 page 총 갯수도 나눠야함.
		int pageNo = 1;
		int listSize = 10; // limit
		int pageSize = 5; // offset
		if (total == 0) {
			total = 10;
		}
		if (gPage != null) {
			pageNo = Integer.parseInt(gPage);
		}
		System.out.println("PathVariable로 들어온 Data 조건 통과 후: " + pageNo);
		if (pageNo > total) {
			System.out.println("PageNo> total 일때 조건 진입");
			pageNo = 1;
		}
		int startRow = (pageNo - 1) * listSize;
		System.out.println("함수 실행 total Data:" + total);
		System.out.println("함수 실행 pageNo Data:" + pageNo);
		PageVO paging = new PageVO(total, pageNo, listSize, pageSize);
		MemberVO search = new MemberVO(searchCondition, searchKeyword);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", listSize);
		map.put("offset", startRow);
		map.put("searchKeyword", searchKeyword);
		map.put("searchCondition", searchCondition);

		System.out.println("첫번쨰 MemberVO:" + searchKeyword);
		System.out.println("첫번쨰 MemberVO:" + searchCondition);

		model.addAttribute("paging", paging);
		model.addAttribute("search", search);
		model.addAttribute("member", adminMemberService.getSearchMemberList(map));
		System.out.println("1차 완료");
		return "adminMember/adminMemberList";
	}

	/* *************************** mno 숨기기 ********************* */
	@RequestMapping(value = "/admin/mem/{pageNo}/detail", method = RequestMethod.POST)
	public String memberDetail(MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo,
			@RequestParam("mno") int mno, @RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("searchCondition") String searchCondition) {
		System.out.println("member 상세페이지 Controller/ 넘어온 mno 값: " + mno);

		member.setMno(mno);
		MemberVO search = new MemberVO(searchCondition, searchKeyword);
		PageVO page = new PageVO(pageNo);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("member", adminMemberService.getMemberDetail(member));

		return "adminMember/adminMemberDetail";
	}

	@RequestMapping(value = "/admin/mem/{pageNo}/upd", method = RequestMethod.POST)
	public String memberUpdateForm(MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo,
			@RequestParam("mno") int mno, @RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("searchCondition") String searchCondition) {
		System.out.println("member upd Controller/method: get/ 넘어온 mno 값: " + mno);

		member.setMno(mno);
		MemberVO search = new MemberVO(searchCondition, searchKeyword);
		PageVO page = new PageVO(pageNo);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("member", adminMemberService.getMemberDetail(member));
		return "adminMember/adminMemberUpdate";
	}

	@RequestMapping(value = "/admin/mem/{pageNo}/upd/ok", method = RequestMethod.POST)
	public String memberUpdate(MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo,
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("searchCondition") String searchCondition) throws IOException {
		System.out.println("member upd Controller/method: post");

		MultipartFile uploadFile = member.getUploadFile();
		if (member.getMcode() == "D" && !uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			String path = "C:\\kherb\\kherb\\src\\main\\resources\\MimgFile";

			System.out.println("저장파일 경로: " + path);
			String bFileName = member.getMimg();
			File file = new File(path + "\\" + bFileName);
			if (file.exists()) {
				System.out.println(bFileName + " 존재 합니다.");
				file.delete();
			} else {
				System.out.println(bFileName + "이 존재 하지 않습니다.");
			}
			member.setMimg(fileName);
			uploadFile.transferTo(new File("C:\\kherb\\kherb\\src\\main\\resources\\MimgFile", fileName));
		}
		System.out.println("파일 업로드 완료");
		System.out.println(member.getMcode());
		adminMemberService.updateMember(member);
		if (searchKeyword == null) {
			searchKeyword = "";
		}
		MemberVO search = new MemberVO(searchCondition, searchKeyword);
		PageVO page = new PageVO(pageNo);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("member", adminMemberService.getMemberDetail(member));

		return "adminMember/adminMemberDetail";
	}

	@RequestMapping(value = "/admin/mem/{pageNo}/del", method = RequestMethod.POST)
	public String memberDelete(MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo,
			@RequestParam("mno") int mno, @RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("searchCondition") String searchCondition) {
		// 예약정보 확인해서 탈퇴 안되게끔 추가 > Not yet
		// 삭제 가능하면 예약정보 백업테이블 업데이트 추가 > Not yet
		// 삭제하기 fin.
		System.out.println("member Delete/ 넘어온 mno 값: " + mno);
		member.setMno(mno);
		int del = adminMemberService.deleteMember(member);
		if (del == 0) {
			System.out.println("삭제 실패");
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("member", mno);
			model.addAttribute("url", "http://localhost:8080/admin/mem");
			return "alert";

		} else {
			System.out.println("삭제 성공");
			MemberVO search = new MemberVO(searchCondition, searchKeyword);
			PageVO page = new PageVO(pageNo);
			model.addAttribute("page", page);
			model.addAttribute("search", search);
			model.addAttribute("member", adminMemberService.getMemberDetail(member));
			model.addAttribute("del", "del");
			model.addAttribute("member", mno);
			model.addAttribute("msg", "삭제에 성공하였습니다.");
			model.addAttribute("url", "http://localhost:8080/admin/mem");
			return "alert";
		}
		// 삭제 완료 후 목록 돌아가서 '삭제완료' alert 가능?
	}

	@RequestMapping(value = "/admin/mem/{pageNo}/pass", method = RequestMethod.POST)
	public String memberPass(MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo,
			@RequestParam("mno") int mno, @RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("searchCondition") String searchCondition) {

		member.setMno(mno);

		// 승인하기
		int pass = adminMemberService.passMember(member);
		MemberVO search = new MemberVO(searchCondition, searchKeyword);
		PageVO page = new PageVO(pageNo);

		// 승인 완료 후 alert ? fin.
		if (pass == 0) {
			System.out.println("승인 실패");
			model.addAttribute("msg", "승인 실패");
			model.addAttribute("page", page);
			model.addAttribute("member", mno);
			model.addAttribute("url", "http://localhost:8080/admin/mem");
			return "alert";

		} else {
			System.out.println("승인 성공");
			model.addAttribute("page", page);
			model.addAttribute("search", search);
			model.addAttribute("member", adminMemberService.getMemberDetail(member));
			model.addAttribute("pass", "pass");
			model.addAttribute("member", mno);
			model.addAttribute("msg", "승인되었습니다.");
			model.addAttribute("url", "http://localhost:8080/admin/mem");
			return "alert";
		}

	}

	@RequestMapping(value = "/admin/mem/join", method = RequestMethod.GET)
	public String MemberJoinView(MemberVO memberVO) {
		System.out.println("Admin 회원 가입 화면으로 이동");
		return "adminMember/adminMemberJoin";
	}

	@RequestMapping(value = "/admin/mem/join/do", method = RequestMethod.POST)
	public String doMemberJoin(Model model, @Valid MemberVO memberVO, BindingResult result) throws IOException {

		System.out.println("도매 회원 회원가입 시도");
		if (result.hasErrors()) {
			System.out.println("도매 회원가입 에러 발생");
			model.addAttribute("memberVO", memberVO);
			return "adminMember/adminMemberJoin";

		} else {
			MultipartFile uploadFile = memberVO.getUploadFile();
			if (!uploadFile.isEmpty()) {
				String fileName = uploadFile.getOriginalFilename();
				memberVO.setMimg(fileName);
				uploadFile.transferTo(new File("C:\\kherb\\kherb\\src\\main\\resources\\MimgFile", fileName));
			}
			System.out.println("파일 업로드 완료");
			adminMemberService.insertMember(memberVO);
			System.out.println("도매  회원/회원가입 완료");
			return "redirect:/admin/mem";
		}
	}

	@RequestMapping(value = "/admin/mem/join/so", method = RequestMethod.POST)
	public String soMemberJoin(Model model, @Valid MemberVO memberVO, BindingResult result) throws IOException {

		System.out.println("소매 회원 회원가입 시도");
		if (result.hasErrors()) {
			System.out.println("소매 회원가입 에러 발생");
			model.addAttribute("so_memberVO", memberVO);
			return "adminMember/adminMemberJoin";

		} else {
			memberVO.setMimg("개인(소매)/img2");
			adminMemberService.insertMember(memberVO);
			System.out.println("소매 회원/회원가입 완료");
			return "redirect:/admin/mem";
		}
	}

	@RequestMapping(value = "/admin/mem/idCheck", method = { RequestMethod.POST })
	@ResponseBody
	public int idCheckFunction(@RequestBody String id) throws Exception {
		System.out.println("Controller 중복확인");
		int result = adminMemberService.idCheck(id);
		System.out.println(result);
		return result;
	}
	
	
	

	
	/* *************************** 여기서부터 도소매컨트롤러 ********************* */
	// 도,소매 리스트
		@RequestMapping(value="/admin/mem/do/{Page}", method=RequestMethod.GET)
		public String memberlistdo(PageVO pageVO, MemberVO member, Model model) {
			
			int total = adminMemberService.getCount1(member);
			String page = pageVO.getPage();
			int pageNo = 1;
			int listSize = 10;
			int pageSize = 5;
			if(page != null) {
				pageNo = Integer.parseInt(page);
			}
			int startRow = (pageNo - 1) * listSize;
		
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("limit", listSize);
			map.put("offset", startRow);
			
			PageVO paging = new PageVO(total, pageNo, listSize, pageSize);
			
			model.addAttribute("paging", paging);
			model.addAttribute("member", adminMemberService.getSelectMemberD(map));
			return "adminMember/adminMemberDo";
		}
		
		
		@RequestMapping(value="/admin/mem/so/{Page}", method=RequestMethod.GET)
		public String memberlistso(PageVO pageVO, MemberVO member, Model model) {
			
			int total = adminMemberService.getCount2(member);// 나중에 page 총 갯수도 나눠야함.
			String page = pageVO.getPage();
			int pageNo = 1;
			int listSize = 10;
			int pageSize = 5;
			if(page != null) {
				pageNo = Integer.parseInt(page);
			}
			int startRow = (pageNo - 1) * listSize;
		
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("limit", listSize);
			map.put("offset", startRow);
			
			PageVO paging = new PageVO(total, pageNo, listSize, pageSize);
			
			model.addAttribute("paging", paging);
			model.addAttribute("member", adminMemberService.getSelectMemberS(map));
			return "adminMember/adminMemberSo";
		}	
		
		
		//도,소매 리스트삭제
			@RequestMapping(value="/admin/mem/do/{Page}", method=RequestMethod.POST)
			public String memberlistdwo(PageVO pageVO, MemberVO member, Model model,@PathVariable("Page") int page1) {
				
				int total = adminMemberService.getCount1(member);
				int page = page1;
				int pageNo = 1;
				int listSize = 10;
				int pageSize = 5;
				if(page != 0) {
					pageNo = page; 
				}
				int startRow = (pageNo - 1) * listSize;
			 
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("limit", listSize);
				map.put("offset", startRow);
				
				PageVO paging = new PageVO(total, pageNo, listSize, pageSize);
				
				model.addAttribute("paging", paging);
				model.addAttribute("member", adminMemberService.getSelectMemberD(map));
				return "adminMember/adminMemberDo";
			}
			
			@RequestMapping(value="/admin/mem/so/{Page}", method=RequestMethod.POST)
			public String memberlistswo(PageVO pageVO, MemberVO member, Model model,@PathVariable("Page") int page1) {
				
				int total = adminMemberService.getCount2(member);
				int page = page1;
				int pageNo = 1;
				int listSize = 10;
				int pageSize = 5;
				if(page != 0) {
					pageNo = page; 
				}
				int startRow = (pageNo - 1) * listSize;
			 
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("limit", listSize);
				map.put("offset", startRow);
				
				PageVO paging = new PageVO(total, pageNo, listSize, pageSize);
				
				model.addAttribute("paging", paging);
				model.addAttribute("member", adminMemberService.getSelectMemberS(map));
				return "adminMember/adminMemberSo";
			}
			
		
			@RequestMapping(value = "/admin/mem/do/{pageNo}/del/{mno2}", method = RequestMethod.GET)
			public String memberDeletedo( @PathVariable("mno2")int mno2, MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo) {

				member.setMno(mno2);
				int deldo = adminMemberService.deleteMember(member);
				if (deldo == 0) {
					System.out.println("삭제 실패");
					model.addAttribute("msg", "삭제에 실패하였습니다.");
					model.addAttribute("member", mno2);
					model.addAttribute("url", "http://localhost:8080/admin/mem/do/"+pageNo);
					return "alert";

				} else {
					PageVO page = new PageVO(pageNo);
					model.addAttribute("page", page);
					model.addAttribute("member", adminMemberService.getMemberDetail(member));
					model.addAttribute("deldo", deldo);
					model.addAttribute("member", mno2);
					model.addAttribute("msg", "삭제에 성공하였습니다.");
					model.addAttribute("url", "http://localhost:8080/admin/mem/do/"+pageNo);
					return "alert";
				}
			}
			
			@RequestMapping(value = "/admin/mem/so/{pageNo}/del/{mno1}", method = RequestMethod.GET)
			public String memberDeleteso( @PathVariable("mno1")int mno1,MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo) {
				
				member.setMno(mno1);
				int delso = adminMemberService.deleteMember(member);
				if (delso == 0) {
					System.out.println("삭제 실패");
					model.addAttribute("msg", "삭제에 실패하였습니다.");
					model.addAttribute("member", mno1);
					model.addAttribute("url", "http://localhost:8080/admin/mem/so/"+pageNo);
					return "alert";

				} else {
					PageVO page = new PageVO(pageNo);
					model.addAttribute("page", page);
					model.addAttribute("member", adminMemberService.getMemberDetail(member));
					model.addAttribute("delso", delso);
					model.addAttribute("member", mno1);
					model.addAttribute("msg", "삭제에 성공하였습니다.");
					model.addAttribute("url", "http://localhost:8080/admin/mem/so/"+pageNo);
					return "alert";
				}
			}

			
		//도,소매상세보기
			@RequestMapping(value = "/admin/mem/do/{pageNo}/detail", method = RequestMethod.POST)
			public String memberDetail1(MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo,
					@RequestParam("mno") int mno, @RequestParam("searchKeyword") String searchKeyword,
					@RequestParam("searchCondition") String searchCondition) {
				System.out.println("member 상세페이지 Controller/ 넘어온 mno 값: " + mno);

				member.setMno(mno);
				MemberVO search = new MemberVO(searchCondition, searchKeyword);
				PageVO page = new PageVO(pageNo);
				model.addAttribute("page", page);
				model.addAttribute("search", search);
				//adminMemberService.updateMember(member);
				model.addAttribute("member", adminMemberService.getMemberDetail(member));
				
				return "adminMember/adminMemberDetailDo";
			}
			
			@RequestMapping(value = "/admin/mem/so/{pageNo}/detail", method = RequestMethod.POST)
			public String memberDetail2(MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo,
					@RequestParam("mno") int mno, @RequestParam("searchKeyword") String searchKeyword,
					@RequestParam("searchCondition") String searchCondition) {
				System.out.println("member 상세페이지 Controller/ 넘어온 mno 값: " + mno);

				member.setMno(mno);
				MemberVO search = new MemberVO(searchCondition, searchKeyword);
				PageVO page = new PageVO(pageNo);
				model.addAttribute("page", page);
				model.addAttribute("search", search);
				model.addAttribute("member", adminMemberService.getMemberDetail(member));
				
				return "adminMember/adminMemberDetailSo";
			}
			
			//도,소매 수정
			@RequestMapping(value = "/admin/mem/do/{pageNo}/upd", method = RequestMethod.POST)
			public String memberUpdateForm1(MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo,
					@RequestParam("mno") int mno, @RequestParam("searchKeyword") String searchKeyword,
					@RequestParam("searchCondition") String searchCondition) {
				System.out.println("member upd Controller/method: get/ 넘어온 mno 값: " + mno);

				member.setMno(mno);
				MemberVO search = new MemberVO(searchCondition, searchKeyword);
				PageVO page = new PageVO(pageNo);
				model.addAttribute("page", page);
				model.addAttribute("search", search);
				model.addAttribute("member", adminMemberService.getMemberDetail(member));
				return "adminMember/adminMemberUpdateDo";
			}

			@RequestMapping(value = "/admin/mem/do/{pageNo}/detaiI", method = RequestMethod.POST)
			public String memberUpdate1(MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo,
					@RequestParam("searchKeyword") String searchKeyword,
					@RequestParam("searchCondition") String searchCondition) throws IOException {
				System.out.println("member upd Controller/method: post");

				MultipartFile uploadFile = member.getUploadFile();
				if (member.getMcode() == "D" && !uploadFile.isEmpty()) {
					String fileName = uploadFile.getOriginalFilename();
					String path = "C:\\kherb\\kherb\\src\\main\\resources\\MimgFile";

					System.out.println("저장파일 경로: " + path);
					String bFileName = member.getMimg();
					File file = new File(path + "\\" + bFileName);
					if (file.exists()) {
						System.out.println(bFileName + " 존재 합니다.");
						file.delete();
					} else {
						System.out.println(bFileName + "이 존재 하지 않습니다.");
					}
					member.setMimg(fileName);
					uploadFile.transferTo(new File("C:\\kherb\\kherb\\src\\main\\resources\\MimgFile", fileName));
				}
				System.out.println("파일 업로드 완료");
				System.out.println(member.getMcode());
				adminMemberService.updateMember(member);
				if (searchKeyword == null) {
					searchKeyword = "";
				}
				MemberVO search = new MemberVO(searchCondition, searchKeyword);
				PageVO page = new PageVO(pageNo);
				model.addAttribute("page", page);
				model.addAttribute("search", search);
				model.addAttribute("member", adminMemberService.getMemberDetail(member));

				return "adminMember/adminMemberDetailDo";
			}
			
			@RequestMapping(value = "/admin/mem/so/{pageNo}/upd", method = RequestMethod.POST)
			public String memberUpdateForm2(MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo,
					@RequestParam("mno") int mno, @RequestParam("searchKeyword") String searchKeyword,
					@RequestParam("searchCondition") String searchCondition) {
				System.out.println("member upd Controller/method: get/ 넘어온 mno 값: " + mno);

				member.setMno(mno);
				MemberVO search = new MemberVO(searchCondition, searchKeyword);
				PageVO page = new PageVO(pageNo);
				model.addAttribute("page", page);
				model.addAttribute("search", search);
				model.addAttribute("member", adminMemberService.getMemberDetail(member));
				return "adminMember/adminMemberUpdateSo";
			}

			@RequestMapping(value = "/admin/mem/so/{pageNo}/detaiI", method = RequestMethod.POST)
			public String memberUpdate2(MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo,
					@RequestParam("searchKeyword") String searchKeyword,
					@RequestParam("searchCondition") String searchCondition) throws IOException {
				System.out.println("member upd Controller/method: post");

				MultipartFile uploadFile = member.getUploadFile();
				if (member.getMcode() == "D" && !uploadFile.isEmpty()) {
					String fileName = uploadFile.getOriginalFilename();
					String path = "C:\\kherb\\kherb\\src\\main\\resources\\MimgFile";

					System.out.println("저장파일 경로: " + path);
					String bFileName = member.getMimg();
					File file = new File(path + "\\" + bFileName);
					if (file.exists()) {
						System.out.println(bFileName + " 존재 합니다.");
						file.delete();
					} else {
						System.out.println(bFileName + "이 존재 하지 않습니다.");
					}
					member.setMimg(fileName);
					uploadFile.transferTo(new File("C:\\kherb\\kherb\\src\\main\\resources\\MimgFile", fileName));
				}
				System.out.println("파일 업로드 완료");
				System.out.println(member.getMcode());
				adminMemberService.updateMember(member);
				if (searchKeyword == null) {
					searchKeyword = "";
				}
				MemberVO search = new MemberVO(searchCondition, searchKeyword);
				PageVO page = new PageVO(pageNo);
				model.addAttribute("page", page);
				model.addAttribute("search", search);
				model.addAttribute("member", adminMemberService.getMemberDetail(member));

				return "adminMember/adminMemberDetailSo";
			}
		
			//도매 회원승인
			@RequestMapping(value = "/admin/mem/do/{pageNo}/pass", method = RequestMethod.POST)
			public String memberPass1(MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo,
					@RequestParam("mno") int mno, @RequestParam("searchKeyword") String searchKeyword,
					@RequestParam("searchCondition") String searchCondition) {

				member.setMno(mno);

				int pass1 = adminMemberService.passMember(member);
				MemberVO search = new MemberVO(searchCondition, searchKeyword);
				PageVO page = new PageVO(pageNo);

				if (pass1 == 0) {
					System.out.println("승인 실패");
					model.addAttribute("msg", "승인 실패");
					model.addAttribute("page", page);
					model.addAttribute("member", mno);
					model.addAttribute("url", "http://localhost:8080/admin/mem");
					return "alert";

				} else {
					System.out.println("승인 성공");
					model.addAttribute("page", page);
					model.addAttribute("search", search);
					model.addAttribute("member", adminMemberService.getMemberDetail(member));
					model.addAttribute("pass", "pass");
					model.addAttribute("member", mno);
					model.addAttribute("msg", "승인되었습니다.");
					model.addAttribute("url", "http://localhost:8080/admin/mem");
					return "alert";
				}
			}
			 
			//도, 소매 상세보기에서 삭제
			@RequestMapping(value = "/admin/mem/do/{pageNo}/del", method = RequestMethod.POST)
			public String memberDelete1(MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo,
					@RequestParam("mno") int mno, @RequestParam("searchKeyword") String searchKeyword,
					@RequestParam("searchCondition") String searchCondition) {
				
				member.setMno(mno);
				int del1 = adminMemberService.deleteMember(member);
				if (del1 == 0) {
					System.out.println("삭제 실패");
					model.addAttribute("msg", "삭제에 실패하였습니다.");
					model.addAttribute("member", mno);
					model.addAttribute("url", "http://localhost:8080/admin/mem");
					return "alert";

				} else {
					System.out.println("삭제 성공");
					MemberVO search = new MemberVO(searchCondition, searchKeyword);
					PageVO page = new PageVO(pageNo);
					model.addAttribute("page", page);
					model.addAttribute("search", search);
					model.addAttribute("member", adminMemberService.getMemberDetail(member));
					model.addAttribute("del1", "del1");
					model.addAttribute("member", mno);
					model.addAttribute("msg", "삭제에 성공하였습니다.");
					model.addAttribute("url", "http://localhost:8080/admin/mem");
					return "alert";
				}
			}
			
			@RequestMapping(value = "/admin/mem/so/{pageNo}/del", method = RequestMethod.POST)
			public String memberDelete2(MemberVO member, Model model, PageVO pageVO, @PathVariable("pageNo") int pageNo,
					@RequestParam("mno") int mno, @RequestParam("searchKeyword") String searchKeyword,
					@RequestParam("searchCondition") String searchCondition) {

				member.setMno(mno);
				int del2 = adminMemberService.deleteMember(member);
				if (del2 == 0) {
					System.out.println("삭제 실패");
					model.addAttribute("msg", "삭제에 실패하였습니다.");
					model.addAttribute("member", mno);
					model.addAttribute("url", "http://localhost:8080/admin/mem");
					return "alert";

				} else {
					System.out.println("삭제 성공");
					MemberVO search = new MemberVO(searchCondition, searchKeyword);
					PageVO page = new PageVO(pageNo);
					model.addAttribute("page", page);
					model.addAttribute("search", search);
					model.addAttribute("member", adminMemberService.getMemberDetail(member));
					model.addAttribute("del2", "del2");
					model.addAttribute("member", mno);
					model.addAttribute("msg", "삭제에 성공하였습니다.");
					model.addAttribute("url", "http://localhost:8080/admin/mem");
					return "alert";
				}
			}
}
