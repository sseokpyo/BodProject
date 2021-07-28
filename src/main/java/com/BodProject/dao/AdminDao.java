package com.BodProject.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.BodProject.dto.CommDto;
import com.BodProject.dto.GroupPageDto;
import com.BodProject.dto.MemberDto;
import com.BodProject.dto.PhotoDto;
import com.BodProject.dto.ReportDto;
import com.BodProject.dto.TimeLineDto;

public interface AdminDao {

	@Select("SELECT * FROM MEMBER")
	ArrayList<MemberDto> getMemberList();

	@Select("SELECT BCODE FROM BOARD WHERE BMID = #{mid} ORDER BY BCODE")
	String[] getBoardBcode(String mid);

	@Delete("DELETE PHOTO WHERE PHOTO = #{photo}")
	int deletePhoto(String photo);

	@Select("SELECT * FROM PHOTO WHERE PBCODE = #{bcode}")
	ArrayList<PhotoDto> BoardPhotoInfo(String bcode);

	@Delete("DELETE FRIEND WHERE MYMID = #{mid}")
	int deleteFreindInMyMid(String mid);

	@Delete("DELETE FRIEND WHERE FRMID = #{mid}")
	int deleteFreindInFrMid(String mid);

	@Delete("DELETE BOARDLIKE WHERE LIMID = #{mid}")
	int deleteLikeBymid(String mid);

	@Delete("DELETE REPORT WHERE REPORTER = #{mid}")
	int deleteReportInReporter(String mid);

	@Delete("DELETE REPORT WHERE REPORTTARGET = #{mid}")
	int deleteReportInTarget(String mid);

	@Delete("DELETE QNA WHERE QAMID = #{mid}")
	int deleteQnA(String mid);

	@Delete("DELETE GUSER WHERE GUMID = #{mid}")
	int deleteGuser(String mid);

	@Delete("DELETE COMM WHERE CBCODE = #{bcode}")
	int deleteCommBybcode(String bcode);

	@Delete("DELETE REPLY WHERE RECCODE IN (SELECT CCODE FROM COMM WHERE CBCODE = #{bcode})")
	int deleteReplyBybcode(String bcode);

	@Delete("DELETE BOARDLIKE WHERE LICODE = #{bcode}")
	int deleteBoardLikeBybcode(String bcode);

	@Delete("DELETE REPLY WHERE REMID = #{mid}")
	int deleteReplyByMid(String mid);
	
	@Delete("DELETE BOARDLIKE WHERE LICODE IN (SELECT RECODE FROM REPLY WHERE RECCODE IN (SELECT CCODE FROM COMM WHERE CBCODE = #{bcode}))")
	int deleteReplyLikeBybcode(String bcode);

	@Delete("DELETE BOARDLIKE WHERE LICODE IN (SELECT CCODE FROM COMM WHERE CBCODE = #{bcode})")
	int deleteCommLikeBybcode(String bcode);

	@Delete("DELETE REPLY WHERE RECCODE IN (SELECT CCODE FROM COMM WHERE CMID = #{mid})")
	int deleteReplyInMidsComm(String mid);

	@Delete("DELETE COMM WHERE CMID = #{mid}")
	int deleteCommByMid(String mid);

	@Delete("DELETE BOARD WHERE BMID = #{mid}")
	int deleteBoard(String mid);

	@Select("SELECT BCODE FROM BOARD WHERE BMID = #{mid}")
	String[] getGBoardBcode(String mid);

	@Select("SELECT * FROM PHOTO WHERE PBCODE = #{gbcode}")
	ArrayList<PhotoDto> gBoardPhotoInfo(String gbcode);

	@Delete("DELETE MEMBER WHERE MID = #{mid}")
	int deleteMember(String mid);

	@Delete("DELETE GROUPPAGE WHERE GMANAGER = #{mid}")
	int deleteGroupPage(String mid);

	@Select("SELECT MPROFILE FROM MEMBER WHERE MID = #{mid}")
	String getMProfile(String mid);

	@Delete("DELETE BOARD WHERE BCODE = #{gbcode}")
	int deleteBoardByGBCode(String gbcode);

	@Select("SELECT * FROM MEMBER WHERE MID = #{mid}")
	MemberDto memberView(String mid);

	@Select("SELECT BMID, BDATE, BCONTENT, BCODE, BVIDEO, BGCODE, MNICK AS BMNICK FROM BOARD INNER JOIN MEMBER ON BMID = MID ORDER BY BDATE DESC")
	ArrayList<TimeLineDto> getBoardList();
	
	@Select("SELECT PHOTO FROM PHOTO WHERE PBCODE = #{bcode}")
	String[] getPhotoList(String bcode);

	@Delete("DELETE BOARD WHERE BCODE = #{bcode}")
	int deleteBoardByBcode(String bcode);

	@Select("SELECT GCODE FROM GROUPPAGE WHERE GMANAGER = #{mid}")	
	String[] selectGroupPage(String mid);

	@Select("SELECT * FROM PHOTO WHERE PBCODE IN (SELECT BCODE FROM BOARD WHERE BGCODE = #{bgcode})")
	ArrayList<PhotoDto> photoInfoByGcode(String bgcode);

	@Select("SELECT BCODE FROM BOARD WHERE BGCODE = #{bgcode}")
	String[] selectBcodeByGcode(String bgcode);

	@Delete("DELETE FROM GUSER WHERE GUGCODE = #{gcode}")
	int deleteGuserByGcode(String gcode);

	//7월20일
	@Delete("DELETE BOARDLIKE WHERE LICODE IN (SELECT RECODE FROM REPLY WHERE RECCODE IN (SELECT CCODE FROM COMM WHERE CMID = #{mid}))")
	int deleteBoardLikeByComm(String mid);

	@Delete("DELETE BOARDLIKE WHERE LICODE IN (SELECT CCODE FROM COMM WHERE CMID = #{mid})")
	int deleteCommLike(String mid);

	@Delete("DELETE BOARDLIKE WHERE LICODE IN (SELECT BCODE FROM BOARD WHERE BMID = #{mid})")	
	int deleteBoardLike(String mid);

	//AdminBoardView
	@Select("SELECT * FROM BOARD WHERE BCODE = #{bcode}")
	TimeLineDto getBoard(String bcode);

	@Select("SELECT CMID, CCOMMENT, CDATE, CBCODE, CCODE, MPROFILE, MNICK AS CMNICK FROM COMM, MEMBER, BOARD WHERE (CMID = MID) AND (CBCODE = BCODE) AND (BCODE = #{bcode}) ORDER BY CDATE DESC")
	ArrayList<CommDto> getCommList(String bcode);
	
	@Select("SELECT COUNT(RECODE) FROM REPLY WHERE RECCODE = #{ccode}")
	int getReplyCount(String ccode);
	
	@Select("SELECT COUNT(LIMID) FROM BOARDLIKE WHERE LICODE = #{code}")
	int getBoardLikeCount(String code);
	
	@Select("SELECT PBCODE, PHOTO FROM PHOTO WHERE PBCODE IN (SELECT BCODE FROM BOARD WHERE BCODE = #{bcode})")
	ArrayList<PhotoDto> photoInfo(String bcode);
	
	@Delete("DELETE FROM PHOTO WHERE PBCODE = #{bcode}")
	int deletePhotoBybCode(String bcode);

	@Select("SELECT GR.GCODE, GR.GNAME, GR.GINFO, GR.GPROFILE, GR.GMANAGER, GU.GCOUNT AS GUSERNUM "
			+"FROM GROUPPAGE GR, (SELECT COUNT(GUMID) AS GCOUNT, GUGCODE FROM GUSER "
			+"GROUP BY GUGCODE) GU WHERE ( GR.GCODE = GU.GUGCODE)")
	ArrayList<GroupPageDto> getGroupList();
	
	@Delete("DELETE FROM GUSER WHERE GUGCODE = #{gcode}")
	int deleteGuer(String gcode);
	
	@Delete("DELETE FROM GROUPPAGE WHERE GCODE = #{gcode}")
	int deleteGroup(String gcode);
	
	//신고처리
	   @Insert("INSERT INTO REPORT VALUES(#{reporter},#{reason},#{reporttarget},SYSDATE)")
	   int report(ReportDto reportdto);

	   //신고 중복확인
	   @Select("SELECT REPORTER FROM REPORT WHERE REPORTER =#{reporter} AND REPORTTARGET =#{reporttarget}")
	   String checkReport(@Param("reporter") String id,@Param("reporttarget") String code);

	   @Select("SELECT * FROM REPORT")
	   ArrayList<ReportDto> getReportList();

	   @Delete("DELETE FROM HASHTAG WHERE TAGCODE = #{bcode}")
	   int deleteBoardTag(String bcode);

	

}
