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
public class ShareMemDto {
	private String shareCtgNo;
	private String shareMemNo;
	private String shareMemName;
	private String rightLevel;
	private String insertType; // 처음 캘린더 등록(N) | 공유 캘린더 수정할때 추가됐는지(U)
	private String majorName;
	private String jobName;
	
}
