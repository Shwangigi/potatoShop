package com.photato.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.photato.domain.BoardVO;
import com.photato.domain.MemberVO;
import com.photato.domain.ReportVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = { org.zerock.config.PersistenceConfig.class
// })
@Log4j2
public class AdminMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	@Test
	public void testMapper() {
		
		log.info(mapper);
	}
	
	@Test // 관리자 정보 확인
	public void testGet() {
		String id = "qqq";
	
		MemberVO result = mapper.getList(id);
		
		log.info(result);
	}
	
	@Test // 회원정보 검색
	public void testMemberList() {
		String id = "qqq";
		
		MemberVO vo = mapper.getMemberList(id);
		
		log.info(vo);
		
	}
	
	@Test // 블랙리스트
	public void testBlack() {
		String id = "sql3";  // 테스트할 회원 ID
	    
	    log.info("id: " + id);
	    
	    int result = mapper.updateBlack(id);
	    
	    assertEquals(1, result);  // 업데이트가 성공하면 1이 반환됨

	    // 업데이트된 회원 정보 다시 조회하여 확인
	    MemberVO updatedMember = mapper.getList(id);
	    assertNotNull(updatedMember);
	}
	
	@Test // 공지 추가
	public void testupdate() {
		BoardVO vo = new BoardVO();
		vo.setTypes("중고거래 게시판");
		vo.setTitle("핸드폰 팝니다.");
		vo.setContent("배터리 잔량 95");
		vo.setWriter("sql3");
		vo.setWriter_number("9A3897B0C5C643B3A7DF98EB5697C3F3");
		vo.setStatus("굿");
		vo.setPhoto_name("최고의 사진");
		
		mapper.insertBoard(vo);
	}
	
	@Test // 게시판 삭제
	public void testDelete() {
		
	}
	
	@Test // 신고내역 확인
	public void testView() {
		List<ReportVO> rep = new ArrayList<>();
		
	    rep =  mapper.readReport();
		
		log.info(rep);
	}
	

}
