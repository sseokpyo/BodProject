package com.BodProject.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDto {
	private String mid;
	private String mpw;
	private String mname;
	private String maddr;
	private String mnick;
	private String mbirth;
	private String mgender;
	private int mphone;
	private String mprofile;
	private String minfo;

	private MultipartFile mfile;
	
	//친구인경우 1 아닐때 0  : 그룹불러올때 사용.
	private int friendcheck;
}
