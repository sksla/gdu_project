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
public class AttendDto {

	
	 private int atdNo;
	 private String memNo;
	 private String startTime;
	 private String endTime;
	 private String registDate;
	 private String modifyDate;
	 private int modNo;
	 private String status;
}
