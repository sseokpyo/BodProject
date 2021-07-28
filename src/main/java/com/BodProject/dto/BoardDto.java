package com.BodProject.dto;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDto {
	private String bmid;
	private String bdate;
	private String bcontent;
	private String bcode;
	private String bvideo;
	private String bgcode;
	
	MultipartFile[] bphotofile;
	private ArrayList<String> taglist;

} 
