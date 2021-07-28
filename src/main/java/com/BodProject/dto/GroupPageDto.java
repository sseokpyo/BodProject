package com.BodProject.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GroupPageDto {
	private String gname;
	private String ginfo;
	private String gprofile;
	private String gmanager;
	private int gusernum;
	private String gcode;
	
	MultipartFile gprofileUpload;
}
