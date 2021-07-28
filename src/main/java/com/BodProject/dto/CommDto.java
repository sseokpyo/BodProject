package com.BodProject.dto;

import lombok.Data;

@Data
public class CommDto {
	private String cmid;
	private String ccomment;
	private String cdate;
	private String ccode;
	private String mprofile;
	private String cbcode;
	private String cmnick;
	private int replycount;
	private int commcount;
	private int likecount;
	private String likemodify;
}
