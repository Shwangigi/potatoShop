package com.photato.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
    
    
    /* 관리자 페이지
    @GetMapping("/admin")
    public String admin(@RequestParam("id") String id, Model model) {
        MemberVO admin = service.getList(id);
        model.addAttribute("", );
    } */

    // 회원 정보 검색
    @GetMapping("/memberList")
    public String getMemberList(@RequestParam("id") String id, Model model) {
        MemberVO member = service.getMemberList(id);
        model.addAttribute("member", member);
        return "memberList"; // JSP 파일 이름
    }

    // 블랙리스트 등록
    @PostMapping("/blacklist")
    public String updateBlack(@RequestParam("id") String id) {
    	service.updateBlack(id);
        return "redirect:/admin/memberList"; // 블랙리스트 등록 후 회원 목록으로 리다이렉트
    }

    // 공지 추가
    @PostMapping("/board")
    public String insertBoard(@ModelAttribute BoardVO board) {
    	service.insertBoard(board);
        return "redirect:/admin/boardList"; // 공지 추가 후 게시판 목록으로 리다이렉트
    }

    // 게시글 삭제
    @DeleteMapping("/board")
    public String deleteReport(@RequestParam("boardNumber") String boardNumber) {
    	service.deleteReport(boardNumber);
        return "redirect:/admin/boardList"; // 게시글 삭제 후 게시판 목록으로 리다이렉트
    }

    // 댓글 삭제
    @DeleteMapping("/reply")
    public String replyDelete(@RequestParam("id") String id) {
    	service.replyDelete(id);
        return "redirect:/admin/replyList"; // 댓글 삭제 후 댓글 목록으로 리다이렉트
    }

    // 신고 내역 확인
    @GetMapping("/reports")
    public String readReport(Model model) {
        List<ReportVO> reports = service.readReport();
        model.addAttribute("reports", reports);
        return "reportList"; // JSP 파일 이름
    }

    // 신고 처리
    @PostMapping("/report")
    public String updateReport(@ModelAttribute ReportVO report) {
    	service.updateReport(report);
        return "redirect:/admin/reports"; // 신고 처리 후 신고 목록으로 리다이렉트
    }

    // 회원 상세 정보 조회 (AJAX)
    @GetMapping("/memberDetail")
    @ResponseBody
    public MemberVO memberDetail(@RequestParam("id") String id) {
        return service.getMemberList(id);
    }

	
}
