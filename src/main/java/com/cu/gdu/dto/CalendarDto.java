package com.cu.gdu.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class CalendarDto {

	private int calNo;
	private int ctgNo;
	private String color;
	private String calTitle;
	private String calContent;
	private String startDate;
	private String endDate;
	private String isAllday;
	private String isRepeat;
	private String isAlert;
	private String registDate;
	private String calWriter;
	private String modifyDate;
	private String modifier;
	private String status;
}
