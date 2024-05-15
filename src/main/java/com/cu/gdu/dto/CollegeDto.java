package com.cu.gdu.dto;

import java.util.List;

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
public class CollegeDto {

	private int colNo;
	private String colName;
	private MajorDto major;
	private List<MajorDto> majorList;
	
}
