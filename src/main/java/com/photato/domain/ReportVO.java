package com.photato.domain;

import java.util.Date;

import com.github.f4b6a3.ulid.Ulid;
import com.github.f4b6a3.ulid.UlidCreator;

import lombok.Data;

@Data
public class ReportVO {
	//ReportsVO
		private String report_number;//신고번호 sys_guid()
		private String writer_id;	  //신고자 아이디
	    private String writer_name;  // 신고자 이름
		private String defendant;     //신고당한 사람의 member_number
	    private String defendant_name;  // 신고 당한 사람 이름
		private int status;		  //신고 처리상태 1= 처리됨 / 0= 처리안됨
		private Date regidate;        //신고일 (default sysdate)
		private Date done_date; 	  //처리 완료일 (default sysdate)
		
		
		public ReportVO() { // ulid -> 중복값이 없는 랜덤 숫자영어 조합의 코드
			
			Ulid ulid = UlidCreator.getUlid();
			this.report_number = ulid.toString();
		}
}
