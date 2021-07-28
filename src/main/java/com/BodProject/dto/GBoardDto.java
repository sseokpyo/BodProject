package com.BodProject.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GBoardDto {
	private String gbmid;
	private String gbdate;
	private String gbcontent;
	private String gbcode;
	private String gbvideo;
	private String gbgcode;
	
	MultipartFile[] gbphotofile;
}
