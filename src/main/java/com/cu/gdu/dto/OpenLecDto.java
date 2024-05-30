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
public class OpenLecDto {
	
	private String openLecNo;
	private String lecNo;
	private String resNo;
	private String startDate;
	private String endDate;
	private String startTime;
	private String endTime;
	private String maxStudent;
	private String lectureDate;

}
