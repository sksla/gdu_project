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
public class AffReservationDto {

	private int affResNo;
	private String affNo;
	private String memNo;
	private String startDate;
	private String endDate;
	private String reason;
	private String majorNo;
	private String affLocation;
}
