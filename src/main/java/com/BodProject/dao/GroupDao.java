package com.BodProject.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.BodProject.dto.GBoardDto;
import com.BodProject.dto.GroupPageDto;
import com.BodProject.dto.MemberDto;
import com.BodProject.dto.PhotoDto;
import com.BodProject.dto.TimeLineDto;

public interface GroupDao {

	@Select("SELECT GNAME FROM GROUPPAGE WHERE GNAME = #{gname}")
	String checkGroupName(@Param("gname") String gname);

	@Insert("INSERT INTO GROUPPAGE VALUES(#{gname},#{ginfo},#{gprofile},#{gmanager},#{gcode})")
	int groupCreate(GroupPageDto newGroup);
	
	@Select("SELECT GR.GCODE, GR.GNAME, GR.GINFO, GR.GPROFILE, GR.GMANAGER, GU.GCOUNT AS GUSERNUM "
			+"FROM GROUPPAGE GR, (SELECT COUNT(GUMID) AS GCOUNT, GUGCODE FROM GUSER "
			+"GROUP BY GUGCODE) GU WHERE ( GR.GCODE = GU.GUGCODE)")
	ArrayList<GroupPageDto> getGroupList();
	
	@Select("SELECT GR.GCODE, GR.GNAME, GR.GINFO, GR.GPROFILE, GR.GMANAGER, GU.GCOUNT AS GUSERNUM "
			+ "FROM GROUPPAGE GR, (SELECT COUNT(GUMID) AS GCOUNT, GUGCODE FROM GUSER "
			+ "GROUP BY GUGCODE) GU WHERE (GR.GCODE = GU.GUGCODE) AND (GR.GNAME LIKE #{search} OR GR.GINFO LIKE #{search})")
	ArrayList<GroupPageDto> getSearchGroupList(@Param("search") String search);

	@Insert("INSERT INTO GUSER VALUES(#{gcode},#{gmanager})")
	int addgManager(@Param("gmanager")String gmanager, @Param("gcode")String gCode);

	@Insert("INSERT INTO GUSER VALUES(#{gcode}, #{guser})")
	int joinGroup(@Param("gcode")String gcode, @Param("guser")String guser);

	@Select("SELECT GR.GCODE, GR.GNAME, GR.GINFO, GR.GPROFILE, GR.GMANAGER, GU.GCOUNT AS GUSERNUM "
			+ "FROM GROUPPAGE GR, (SELECT COUNT(GUMID) AS GCOUNT, GUGCODE FROM GUSER "
			+ "GROUP BY GUGCODE) GU WHERE ( GR.GCODE = GU.GUGCODE) AND GCODE = #{gcode}")
	GroupPageDto getGroupPage(String gcode);

	@Select("SELECT COUNT(GUMID) FROM GUSER WHERE GUGCODE = #{gname}")
	int getGusersNum(String gname);

	@Select("SELECT GUMID FROM GUSER WHERE GUGCODE = #{gname} ")
	ArrayList<String> getGroupUsers(String gname);

	@Select("SELECT GUMID FROM GUSER WHERE GUGCODE = #{gcode} AND GUMID = #{gumid}")
	String checkGroupUser(@Param ("gcode") String gcode, @Param("gumid") String loginid);

	@Select("SELECT MNICK, MPROFILE, MID FROM MEMBER WHERE MID IN (SELECT GUMID FROM GUSER WHERE GUGCODE = #{gcode})")
	ArrayList<MemberDto> getGroupMemList(String gcode);

	@Select("SELECT MAX(GBCODE) FROM GBOARD")
	String maxGroupBoardNum();

	@Select("SELECT GR.GCODE, GR.GNAME, GR.GINFO, GR.GPROFILE, GR.GMANAGER, GU.GCOUNT AS GUSERNUM "
			+"FROM GROUPPAGE GR, (SELECT COUNT(GUMID) AS GCOUNT, GUGCODE FROM GUSER "
			+"GROUP BY GUGCODE) GU WHERE ( GR.GCODE = GU.GUGCODE) AND GR.GCODE IN (SELECT GUGCODE FROM GUSER WHERE GUMID = #{loginId})")
	ArrayList<GroupPageDto> getMyGroupList(String loginId);

	@Select("SELECT MAX (GCODE) FROM GROUPPAGE")
	String maxGroupCode();

	@Select("SELECT FRMID FROM FRIEND WHERE MYMID = ( SELECT FRMID FROM FRIEND WHERE FRMID = #{friendId} AND MYMID = #{loginId})"
			+" AND FRMID = #{loginId}")
	String friendCheck(@Param ("loginId") String loginId, @Param ("friendId") String friendId);

	@Select("DELETE FROM GUSER WHERE GUGCODE = #{gcode} AND GUMID = #{gumid}")
	String signOutGroup(@Param ("gcode") String gcode, @Param("gumid")String userId);

	@Delete("DELETE FROM GUSER WHERE GUGCODE = #{gcode}")
	int deleteGuer(String gcode);

	@Delete("DELETE FROM GROUPPAGE WHERE GCODE = #{gcode}")
	int deleteGroup(String gcode);

	@Update("UPDATE GROUPPAGE SET GMANAGER = #{userId} WHERE GCODE = #{gcode}")
	int giveGroupManager(@Param("gcode") String gcode, @Param("userId") String userId);

	@Delete("DELETE FROM GUSER WHERE GUGCODE = #{gcode} AND GUMID = #{userId}")
	int signOutUser(@Param("gcode") String gcode, @Param("userId") String userId);

	@Select("SELECT * FROM GROUPPAGE WHERE GCODE = #{gcode}")
	GroupPageDto getGroupInfo(String gcode);

	@Update("UPDATE GROUPPAGE SET GNAME = #{gname}, GINFO = #{ginfo}, GPROFILE = #{gprofile} WHERE GCODE = #{gcode}")
	int modifyGroup(GroupPageDto modifyGroup);
	
	//그룹 삭제시 게시글, 댓글, 좋아요, 사진 삭제
	@Select("SELECT * FROM PHOTO WHERE PBCODE IN (SELECT BCODE FROM BOARD WHERE BGCODE = #{bgcode})")
	ArrayList<PhotoDto> photoInfoByGcode(String bgcode);
	
	@Delete("DELETE PHOTO WHERE PHOTO = #{photo}")
	int deletePhoto(String photo);
	
	@Select("SELECT BCODE FROM BOARD WHERE BGCODE = #{bgcode}")
	String[] selectBcodeByGcode(String bgcode);
	
	@Delete("DELETE REPLY WHERE RECCODE IN (SELECT CCODE FROM COMM WHERE CBCODE = #{bcode})")
	int deleteReplyBybcode(String bcode);
	
	@Delete("DELETE COMM WHERE CBCODE = #{bcode}")
	int deleteCommBybcode(String bcode);
	
	@Delete("DELETE BOARDLIKE WHERE LICODE IN (SELECT RECODE FROM REPLY WHERE RECCODE IN (SELECT CCODE FROM COMM WHERE CBCODE = #{bcode}))")
	int deleteReplyLikeBybcode(String bcode);
	
	@Delete("DELETE BOARDLIKE WHERE LICODE IN (SELECT CCODE FROM COMM WHERE CBCODE = #{bcode})")
	int deleteCommLikeBybcode(String bcode);
	
	@Delete("DELETE BOARDLIKE WHERE LICODE = #{bcode}")
	int deleteBoardLikeBybcode(String bcode);
	
	@Delete("DELETE BOARD WHERE BCODE = #{bcode}")
	int deleteBoardByBcode(String bcode);
	
	@Delete("DELETE FROM GUSER WHERE GUGCODE = #{gcode}")
	int deleteGuserByGcode(String gcode);
	//

	//일반 회원 탈퇴시 그룹내 게시글, 댓글, 답글, 좋아요, 사진 삭제
	@Select("SELECT BCODE FROM BOARD WHERE BGCODE = #{bgcode} AND BMID = #{bmid}")
	String[] getBcode(@Param("bgcode") String gcode, @Param("bmid") String userId);
	
	@Select("SELECT * FROM PHOTO WHERE PBCODE = #{gbcode}")
	ArrayList<PhotoDto> gBoardPhotoInfo(String gbcode);
	
	@Delete("DELETE BOARD WHERE BCODE = #{bcode}")
	int deleteBoardBybcode(String bcode);

	//userId가 쓴 gcode 그룹내 좋아요, 답글, 댓글, 게시글 삭제
	@Delete("DELETE BOARDLIKE WHERE LIMID = #{limid}")
	int deleteLikeByMid(@Param("limid") String userId);

	
	
	@Delete("DELETE REPLY WHERE REMID = #{remid}")
	int deleteReplyByMid(@Param("remid") String userId);

	@Delete("DELETE BOARDLIKE WHERE LICODE IN (SELECT RECODE FROM REPLY WHERE REMID = #{remid})")
	int deleteReplyLikeByMid(@Param("remid") String userId);

	@Delete("DELETE BOARDLIKE WHERE LICODE IN (SELECT RECODE FROM REPLY WHERE RECCODE IN (SELECT CCODE FROM COMM WHERE CMID = #{userId}))")
	int deleteLikeByComm(String userId);

	@Delete("DELETE REPLY WHERE RECCODE IN (SELECT CCODE FROM COMM WHERE CMID = #{userId})")
	int deleteReplyByComm(String userId);

	@Delete("DELETE BOARDLIKE WHERE LICODE IN (SELECT CCODE FROM COMM WHERE CMID = #{userId})")
	int deleteCommLikeByMid(String userId);

	@Delete("DELETE COMM WHERE CMID = #{userId}")
	int deleteCommByMid(String userId);
	
	@Delete("DELETE FROM HASGTAG WHERE TAGCODE IN (SELECT BCODE FROM BOARD WHERE BGCODE = #{gcode})")
	int deleteGroupBoardTag(String gcode);
	
	//그룹 탈퇴시
	   @Select("SELECT * FROM PHOTO WHERE PBCODE IN (SELECT BCODE FROM BOARD WHERE BGCODE = #{bgcode} AND BMID = #{bmid})")
	   ArrayList<PhotoDto> signOutphotoInfo(@Param ("bgcode") String bgcode,@Param ("bmid") String userId);
	   
	   @Select("SELECT BCODE FROM BOARD WHERE BGCODE = #{bgcode} AND BMID=#{bmid}")
	   String[] singOutUserBoard(@Param ("bgcode") String bgcode,@Param ("bmid") String userId);
	   
	   @Delete("DELETE FROM HASHTAG WHERE TAGCODE = #{bcode}")
	   int signOitGroupBoardTag(String bcode);
	

}
