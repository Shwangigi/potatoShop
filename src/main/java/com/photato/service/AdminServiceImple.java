package com.photato.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.photato.domain.BoardVO;
import com.photato.domain.MemberVO;
import com.photato.domain.ReplyVO;
import com.photato.domain.ReportVO;
import com.photato.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class AdminServiceImple implements AdminService{

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
	public void updateBlack(String id) {
		
		log.info("블랙리스트 아이디 :" + id);
		mapper.updateBlack(id);
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
	public void updateReport(int status) {
		log.info("게시글 삭제" + status );
		mapper.updateReport(status);
	}

	@Override   // 블랙리스트 보기
	public List<MemberVO> viewBlack() {
		log.info("블랙리스트 확인");
		return mapper.viewBlack();
	}

}
