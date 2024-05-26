package com.cu.gdu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class ReservationDto {
	private int revNo;
	private String revReason;
	private String revDate;
	private String startTime;
	private String endTime;
	private String registDate;
	private String status;
	private String memNo;
	private String resNo;
	private String resType;
	private int revCount;
}
