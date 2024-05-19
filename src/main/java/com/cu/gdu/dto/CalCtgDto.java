package com.cu.gdu.dto;

import java.sql.Date;
import java.util.List;

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
public class CalCtgDto {
	
	private int ctgNo; 
	private String ctgType; 
	private String ctgWriter; 
	private String ctgName; 
	private String color; 
	private String isShow; 
	private Date registDate; 
	private Date modifyDate; 
	private String status;
	private int shareCount;
	private List<ShareMemDto> sList;
	
}
