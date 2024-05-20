package com.cu.gdu.dto;

import java.sql.Date;

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
public class VacationDto {

	private int vacNo;
	private int memNo;
	private int vacUsed;
	private String vacOption;
	private Date registDate;
	private String vacReason;
	private int docNo;
	private String status;
	private String startDate;
	private String endDate;
	private int vacTypeNo;
	private String vacType;
	
}
