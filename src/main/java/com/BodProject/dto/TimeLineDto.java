package com.BodProject.dto;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TimeLineDto {
	
	private String bmnick;
	private String bmid;
	private String bdate;
	private String bcode;
	private String bcontent;
	private String[] photo;
	private String bvideo;
	private String mprofile;
	private int commcount;
	private int likecount;
	private String likemodify;
	private String bgcode;
	private String bgname;
	private String gprofile;
	
	MultipartFile[] bphotofile;
	private ArrayList<String> taglist;

}
