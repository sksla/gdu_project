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
public class StuAttendDto {
	
	private String attendNo;
	private String stuNo;
	private String stuName;
	private String attendance;
	private String lectureNo;
	private String lectureDate;

}
