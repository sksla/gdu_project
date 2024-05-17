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
	private String majorNo;
	private String affLocation;
	private String latitude;
	private String longitude;
	private String affEtc;
}
