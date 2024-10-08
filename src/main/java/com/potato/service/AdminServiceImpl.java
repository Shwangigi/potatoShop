package com.potato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.potato.domain.BoardVO;
import com.potato.domain.MemberVO;
import com.potato.domain.ReplyVO;
import com.potato.domain.ReportVO;
import com.potato.domain.NotificationVO;
import com.potato.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper mapper;
	
	@Override // 관리자 정보 확인
	public MemberVO getList(String id) {
		log.info("관리자 id : " + id);
		return mapper.getList(id);
	}

	@Override // 회원 정보 검색
	public MemberVO getMemberList(String id) {
		log.info("회원 아이디 : " + id);
		return mapper.getMemberList(id);
	}

	@Override // 블랙리스트 등록
	public void updateBlack(MemberVO member) {
		mapper.updateBlack(member);
	}

	@Override // 공지 추가
	public void insertBoard(BoardVO board) {
		log.info("공지 추가 : " + board);
		mapper.insertBoard(board);
	}

	@Override // 게시글 삭제
	public void deleteReport(BoardVO boardVO) {
		log.info("게시글 삭제 : " + boardVO);
         mapper.deleteReport(boardVO);
	}

	@Override // 댓글 삭제
	public void replyDelete(ReplyVO replyVO) {
		log.info("댓글 삭제 : " + replyVO);
		 mapper.replyDelete(replyVO);
	}

	@Override // 신고내역확인
	public List<ReportVO> readReport() {
		log.info("게시글 삭제" );
		return mapper.readReport();
	}

	@Override // 신고 처리
	public void updateReport(ReportVO reportVO) {
		mapper.updateReport(reportVO);
	}

	@Override   // 블랙리스트 보기
	public List<MemberVO> viewBlack() {
		log.info("블랙리스트 확인");
		return mapper.viewBlack();
	}

	@Override
	public ReportVO get_report(String report_number) {
		// TODO 신고내역 확인
		return mapper.get_report(report_number);
	}
	
	@Override // 블랙리스트 해제
	public void clearBlack(String member_number) {
		
		mapper.clearBlack(member_number);
	}

	@Override
	public List<NotificationVO> notification() {
		// TODO Auto-generated method stub
		return mapper.notification();
	}

	
}
