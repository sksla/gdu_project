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
public class TodoListDto {

	private int tdlNo;
	private int tdlWriter;
	private String tdlContent;
	private String tdlDate;
	private String isCompleted;
	private int orderNo;
	private String status;
	private List<TodoListDto> tdList;
	
}
