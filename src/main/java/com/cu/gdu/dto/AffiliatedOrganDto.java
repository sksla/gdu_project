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
public class AffiliatedOrganDto {
	
	private String affNo;
	private String affName;
	private int majorNo;
	private String affLocation;
	private int memNo;
	private String startDate;
	private String endDate;
	private String reason;
	private String latitude;
	private String longitude;
	private String affEtc;
}
