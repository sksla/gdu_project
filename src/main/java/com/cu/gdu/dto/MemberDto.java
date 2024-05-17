package com.cu.gdu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class MemberDto {

	private int memNo;
	private String majorNo;
	private String jobNo;
	private String memName;
	private String memId;
	private String memPwd;
	private String phone;
	private String email;
	private String address;
	private String resident;
	private String hireDate;
	private String endDate;
	private String status;
	private String salary;
	private String signUrl;
	private String profileUrl;
	private int leaveCount;
	private String birth;
	private String gender;
	
}
