package com.cu.gdu.dto;

import java.util.ArrayList;

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
public class StuAttendDto {
	
	private String attendNo;
	private String stuNo;
	private String stuName;
	private String attendance;
	private String lecNo;
	private String lectureDate;
	private String majorNo;
	private String majotName;
	private String lecName;
	
	// 다수의 학생객체 정보를 받을 용도의 필드 추가
	private ArrayList<StuAttendDto> stuAttendList;

}
