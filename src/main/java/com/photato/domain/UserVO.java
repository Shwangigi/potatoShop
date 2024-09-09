package com.photato.domain;

import lombok.Data;

@Data
public class UserVO {
	
	//UserVO
		private String user_number;	  //유저번호(=회원번호) sys_guid()
		private int likes;			  //좋아요 수
		private int reports;		  //신고당한 수
		private int temper;			  //온도
		private int trades;			  //거래완료 수

}
