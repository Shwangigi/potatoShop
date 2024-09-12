package com.photato.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	//MemberVO
		private String member_number; //회원번호 sys_guid()
		private String id; 			  //아이디
		private String pass;		  //비밀번호
		private String name;		  //이름
		private String nickName;	  //닉네임
		private String phone;		  //전화번호
		private String address;		  //주소
		private int grade;
		private String profile_image; //프로필 사진
		private Date regidate;		  //회원 가입일 (default sysdate)
		private Date update_date;	  //정보 수정일 (default sysdate)
		

}
