package com.photato.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.photato.domain.BoardVO;
import com.photato.domain.MemberVO;
import com.photato.domain.ReplyVO;
import com.photato.domain.ReportVO;
import com.photato.service.AdminService;

//import com.photato.service.PotatoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/potato/*")
@AllArgsConstructor
public class PotatoController {

	private AdminService service;

	@GetMapping("/shop")
	public void shop() {
	}

	@GetMapping("/index")
	public void index() {
	}

	@GetMapping("/contact")
	public void contact() {
	}

	// 관리자 페이지
	@GetMapping("/admin")
	public void admin(Model model) {
		/* MemberVO admin = service.getList(id); */

		model.addAttribute("reportList", service.readReport());
		model.addAttribute("black", service.viewBlack());
	}

	 // 회원 정보 검색
    @GetMapping("/admin/memberList")
    public String getMemberList(@RequestParam("id") String id, Model model, RedirectAttributes redirectAttributes) {
            MemberVO member = service.getMemberList(id);
            
            
            if(member == null) {
            	log.info("회원아이디 : " + id);
            	redirectAttributes.addFlashAttribute("message", "회원이 없습니다.");
            	 return "redirect:/admin/memberList"; 
            }
            log.info("검색된 회원 ID: " + id); // 로그 추가
            model.addAttribute("member", member);
            return "potato/memberList"; // JSP 파일 경로 수정
    }
	
	
	/*
	 * @PostMapping("/admin/memberList") public String
	 * getMemberList(@RequestParam("id") String id, @RequestParam("status") String
	 * status) { service.getMemberList(id); }
	 */

	// 블랙리스트 등록 -> 세션 아이디 넣어야 함
	@PostMapping("/blacklist")
	public String updateBlack(@RequestParam("id") String id, @RequestParam("grade") int grade) {
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setGrade(grade);
		
		service.updateBlack(member);
		return "redirect:/potato/admin/memberList?id=qqq"; // 블랙리스트 등록 후 회원 목록으로 리다이렉트
	}

	// 공지 추가
	@PostMapping("/board")
	public String insertBoard(@ModelAttribute BoardVO board) {
		service.insertBoard(board);
		return "redirect:/admin/boardList"; // 공지 추가 후 게시판 목록으로 리다이렉트
	}

	/*
	 * 게시글 삭제
	 * 
	 * @DeleteMapping("/board") public String
	 * deleteReport(@RequestParam("boardNumber") String boardNumber) {
	 * service.deleteReport(boardNumber); return "redirect:/admin/boardList"; // 게시글
	 * 삭제 후 게시판 목록으로 리다이렉트 }
	 */

	/*
	 * 댓글 삭제
	 * 
	 * @DeleteMapping("/reply") public String replyDelete(@RequestParam("id") String
	 * id) { service.replyDelete(id); return "redirect:/admin/replyList"; // 댓글 삭제 후
	 * 댓글 목록으로 리다이렉트 }
	 */

	// 신고 내역 확인
	@GetMapping("/reports")
	public String readReport(Model model) {
		List<ReportVO> reports = service.readReport();
		model.addAttribute("reports", reports);
		return "reportList"; // JSP 파일 이름
	}

	/*
	 * 신고 처리
	 * 
	 * @PostMapping("/report") public String updateReport(@ModelAttribute ReportVO
	 * report) { service.updateReport(report); return "redirect:/admin/reports"; //
	 * 신고 처리 후 신고 목록으로 리다이렉트 }
	 */

	// 회원 상세 정보 조회 (AJAX)
	@GetMapping("/memberDetail")
	@ResponseBody
	public MemberVO memberDetail(@RequestParam("id") String id) {
		return service.getMemberList(id);
	}

}
