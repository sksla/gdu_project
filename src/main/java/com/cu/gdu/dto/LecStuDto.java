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
public class LecStuDto {

	private String lecstuNo;
	private String lecNo;
	private String stuNo;
	private String majorNo;
	private String stuName;
	private String lecName;
	private String majorName;

}
