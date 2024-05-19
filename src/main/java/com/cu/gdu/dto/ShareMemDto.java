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
public class ShareMemDto {
	private String shareCtgNo;
	private String shareMemNo;
	private String shareMemName;
	private String rightLevel;
}
