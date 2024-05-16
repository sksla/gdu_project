package com.cu.gdu.dto;

import java.sql.Date;

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
public class AttachDto {

	 private int fileNo;
	 private String originalName;
	 private String filesystemName;
	 private String filePath;
	 private Date uploadDate;
	 private String status;
	 private int refNo;
	 private String refType;
	 
}
