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
public class AlertDto {

	private int alertNo;
	private int targetNo;
	private String alertContent;
	private String alertLink;
	private String registDate;
	private String sendDate;
	private String readStatus;
	private String alertType;
}
