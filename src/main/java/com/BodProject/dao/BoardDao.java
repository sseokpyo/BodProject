package com.BodProject.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.BodProject.dto.BoardDto;
import com.BodProject.dto.BoardLikeDto;
import com.BodProject.dto.CommDto;
import com.BodProject.dto.HashTagDto;
import com.BodProject.dto.MemberDto;
import com.BodProject.dto.PhotoDto;
import com.BodProject.dto.ReplyDto;
import com.BodProject.dto.SearchFriendDto;
import com.BodProject.dto.TimeLineDto;

public interface BoardDao {

	@Select("SELECT MAX(BCODE) FROM BOARD WHERE BCODE LIKE 'B%'")
	String maxBoardNum();

	@Insert("INSERT INTO BOARD (BMID, BDATE, BCONTENT, BCODE, BVIDEO) VALUES (#{bmid}, SYSDATE, #{bcontent}, #{bcode}, #{bvideo})")
	int insertBoard(BoardDto board);

	@Insert("INSERT INTO PHOTO(PBCODE, PHOTO) VALUES(#{pbcode}, #{photo})")
	int insertPhoto(PhotoDto pdto);

	@Select("SELECT BMID, BDATE, BCONTENT, BCODE, BVIDEO, MPROFILE, MNICK AS BMNICK, BGCODE FROM BOARD, MEMBER "
			+ "WHERE BMID = MID AND MID IN (SELECT MID FROM MEMBER WHERE MID = #{loginId} "
			+ "OR MID IN(SELECT FRMID FROM FRIEND WHERE MYMID IN(SELECT BMID FROM BOARD WHERE BMID = #{loginId}))) "
			+ "OR BGCODE LIKE '%'"
			+ "ORDER BY BDATE DESC")
	ArrayList<TimeLineDto> getBoardList(String loginId);
	
	@Select("SELECT PHOTO FROM PHOTO WHERE PBCODE = #{bcode}")
	String[] getPhotoList(String bcode);
	
	@Select("SELECT BMID, BCONTENT, BCODE FROM BOARD WHERE BCODE = #{bcode}")
	TimeLineDto getBoardByBcode(String bcode);

	@Select("SELECT PBCODE, PHOTO FROM PHOTO WHERE PBCODE IN (SELECT BCODE FROM BOARD WHERE BCODE = #{bcode})")
	ArrayList<PhotoDto> photoInfo(String bcode);

	@Delete("DELETE FROM PHOTO WHERE PHOTO = #{bPhoto}")
	int deletePhoto(String bPhoto);
	
	@Update("UPDATE BOARD SET BCONTENT = #{bcontent}, BDATE = SYSDATE WHERE BCODE = #{bcode}")
	int boardModify(TimeLineDto board);

	@Delete("DELETE FROM PHOTO WHERE PBCODE = #{bcode}")
	int deletePhotoBybCode(String bcode);

	@Delete("DELETE FROM BOARD WHERE BCODE = #{bcode}")
	int deleteBoard(String bcode);
	
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
	//글작성, 수정, 삭제
	
	//그룹 글작성, 수정, 삭제
	@Select("SELECT MAX(BCODE) FROM BOARD WHERE BCODE LIKE 'GB%'")
	String maxGroupBoardNum();

	@Insert("INSERT INTO BOARD (BMID, BDATE, BCONTENT, BCODE, BGCODE, BVIDEO) VALUES (#{bmid}, SYSDATE, #{bcontent}, #{bcode}, #{bgcode}, #{bvideo})")
	int insertGroupBoard(BoardDto groupBoard);

	@Select("SELECT BMID AS bmid, BDATE AS bdate, BCONTENT AS bcontent, BCODE AS bcode FROM BOARD WHERE BCODE = #{gbcode}")
	TimeLineDto getGroupBoardByBcode(String bcode);

	@Select("SELECT * FROM PHOTO WHERE PBCODE = #{gbcode}")
	ArrayList<PhotoDto> GroupPhotoInfo(String bcode);


	@Delete("DELETE FROM PHOTO WHERE PBCODE = #{gbcode}")
	int deletePhotoBygbCode(String gbcode);

	@Delete("DELETE FROM board WHERE GBCODE = #{gbcode}")
	int deleteGroupBoard(String gbcode);

	@Select("SELECT CMID, CCOMMENT, CDATE, CBCODE, CCODE, MPROFILE, MNICK AS CMNICK FROM COMM, MEMBER, BOARD WHERE (CMID = MID) AND (CBCODE = BCODE) AND (BCODE = #{bcode}) ORDER BY CDATE DESC")
	ArrayList<CommDto> getCommList(String bcode);
	
	@Select("SELECT MAX(CCODE) FROM COMM")
	String maxCcodeNum();

	@Insert("INSERT INTO COMM VALUES(#{cmid}, #{ccomment}, SYSDATE, #{ccode}, #{cbcode})")
	int commRegist(CommDto cdto);

	@Select("SELECT REMID, RECOMMENT, REDATE, RECODE, MPROFILE, MNICK AS REMNICK FROM REPLY, MEMBER, COMM WHERE (RECCODE = CCODE) AND (REMID = MID) AND (RECCODE = #{ccode}) AND (CBCODE = #{cbcode}) ORDER BY REDATE DESC")
	ArrayList<ReplyDto> getReplyList(@Param("ccode") String ccode, @Param("cbcode")String cbcode);

	@Select("SELECT MAX(RECODE) FROM REPLY")
	String maxRecodeNum();

	@Insert("INSERT INTO REPLY VALUES(#{remid}, #{recomment}, SYSDATE, #{recode}, #{reccode})")
	int replyRegist(ReplyDto rdto);
	
	@Select("SELECT COUNT(RECODE) FROM REPLY WHERE RECCODE = #{ccode}")
	int getReplyCount(String ccode);

	@Select("SELECT COUNT(CCODE) FROM COMM WHERE CBCODE = #{bcode}")
	int getCommcount(String bcode);

	@Select("SELECT * FROM BOARDLIKE WHERE LICODE = #{licode} AND LIMID = #{limid}")
	BoardLikeDto boardlike(BoardLikeDto bldto);

	@Insert("INSERT INTO BOARDLIKE VALUES(#{licode}, #{limid})")
	int setBoardlike(BoardLikeDto bldto);

	@Delete("DELETE FROM BOARDLIKE WHERE LICODE = #{licode} AND LIMID = #{limid}")
	int deleteBoardlike(BoardLikeDto bldto);

	@Select("SELECT COUNT(LIMID) FROM BOARDLIKE WHERE LICODE = #{code}")
	int getBoardLikeCount(String code);

	@Select("SELECT * FROM MEMBER WHERE MID = #{userId}")
	MemberDto getUserInfo(String userId);

	@Select("SELECT FRMID FROM FRIEND WHERE MYMID = ( SELECT FRMID FROM FRIEND WHERE FRMID = #{friendId} AND MYMID = #{loginId})"
			+" AND FRMID = #{loginId}")
	String friendCheck(@Param ("loginId") String loginId, @Param ("friendId") String friendId);

	@Select("SELECT BMID, BDATE, BCONTENT, BCODE, BVIDEO, MPROFILE, MNICK AS BMNICK, BGCODE FROM BOARD, MEMBER WHERE BMID = MID AND BGCODE = #{gcode}")
	ArrayList<TimeLineDto> getGroupBoardList(String gcode);

	@Select("SELECT * FROM MEMBER WHERE MID = #{loginId}")
	MemberDto getMyInfo(String loginId);

	@Update("UPDATE MEMBER SET MNICK = #{mnick}, MINFO=#{minfo}, MPROFILE = #{mprofile} WHERE MID = #{mid}")
	int modifyMember(MemberDto modiMem);

	@Select("SELECT COUNT(FRMID) FROM FRIEND WHERE MYMID IN ( SELECT FRMID FROM FRIEND WHERE MYMID = #{loginId}) "
	         + "AND FRMID = #{loginId}")
	int getFriendNum(String loginId);

	@Select("SELECT BMID, BDATE, BCONTENT, BCODE, BVIDEO, MPROFILE, MNICK AS BMNICK, BGCODE FROM BOARD, MEMBER WHERE BMID = MID AND MID IN (SELECT MID FROM MEMBER WHERE MID = #{loginId})")
	ArrayList<TimeLineDto> getMyBoardList(String loginId);

	@Select("SELECT GNAME FROM GROUPPAGE WHERE GCODE = #{bgcode}")
	String getBgname(String bgcode);

	@Select("SELECT GPROFILE FROM GROUPPAGE WHERE GCODE = #{bgcode}")
	String getBgprofile(String bgcode);

	@Select("SELECT MNICK AS USERNICK, MPROFILE AS USERPROFILE, MID AS USERID FROM MEMBER WHERE MNICK LIKE #{searchtext} AND NOT MID = #{loginId}")
	ArrayList<SearchFriendDto> searchFriend(@Param("searchtext") String searchtext, @Param("loginId") String loginId);

	@Select("SELECT BCODE FROM BOARD WHERE BCODE IN(SELECT CBCODE FROM COMM WHERE CCODE IN(SELECT RECCODE FROM REPLY WHERE RECCODE = #{reccode}))")
	String getReBcode(ReplyDto rdto);

	@Select("SELECT MNICK FROM MEMBER WHERE MID IN(SELECT LIMID FROM BOARDLIKE WHERE LICODE = #{bcode})")
	String[] getLikeList(String bcode);

	@Select("SELECT BMID, BDATE, BCONTENT, BCODE, BVIDEO, MPROFILE, MNICK AS BMNICK, BGCODE FROM BOARD, MEMBER WHERE BMID = MID AND MID IN (SELECT MID FROM MEMBER WHERE MID = #{userId})")
	ArrayList<TimeLineDto> getUserBoardList(String userId);
	
	//해시태그 
	   @Select("SELECT DISTINCT TAGNAME FROM HASHTAG WHERE TAGNAME LIKE #{searchTag}")
	   ArrayList<HashTagDto> getTagList(String searchTag);

	   @Insert("INSERT INTO HASHTAG VALUES(#{tagname},#{tagcode})")
	   int addTag(@Param("tagname")String string, @Param("tagcode")String tagcode);

	   @Select("SELECT COUNT(TAGCODE) FROM HASHTAG WHERE TAGNAME = #{tagname}")
	   int getTagNum(String tagname);

	   @Select("SELECT TAGNAME FROM HASHTAG WHERE TAGCODE = #{bcode}")
	   ArrayList<HashTagDto> getBoardTagList(String bcode);

	   @Delete("DELETE FROM HASHTAG WHERE TAGCODE = #{tagcode} AND TAGNAME = #{tagname}")
	   int tagDelete(@Param("tagcode")String tagcode,@Param("tagname") String tagname);

	   @Delete("DELETE FROM HASHTAG WHERE TAGCODE = #{tagcode}")
	   int deleteBoardTag(@Param("tagcode") String bcode);
	   
	   @Select("SELECT TAGNAME FROM HASHTAG WHERE TAGCODE = #{bcode}")
	   ArrayList<String> boardTagList(String bcode);

	   @Select("SELECT TAGCODE FROM HASHTAG WHERE TAGNAME IN #{tagname}")
	   String[] getSearchTagNameCode(String tagname);
	   
	   @Select("SELECT BD.*, MEM.MNICK AS BMNICK, MEM.MPROFILE FROM (SELECT BMID, BDATE, BCONTENT, BCODE, BVIDEO,  BGCODE, LIKENUM FROM "
	         + "(SELECT BO.*, NVL(LIKECOUNT,0) AS LIKENUM FROM BOARD BO LEFT OUTER JOIN "
	         + "(SELECT LICODE, COUNT(*) AS LIKECOUNT FROM BOARDLIKE WHERE LICODE IN "
	         + "(SELECT TAGCODE FROM HASHTAG WHERE TAGNAME = #{tagname}) "
	         + "GROUP BY LICODE) LI ON BO.BCODE = LI.LICODE "
	         + "WHERE BCODE IN (SELECT TAGCODE FROM HASHTAG WHERE TAGNAME = #{tagname})) "
	         + "ORDER BY LIKENUM DESC) BD, MEMBER MEM WHERE (BD.BMID = MEM.MID)")
	   ArrayList<TimeLineDto> getTagLikeBoardList(HashTagDto tag);

	   @Select("SELECT BD.*, MEM.MNICK AS BMNICK, MEM.MPROFILE FROM (SELECT BMID, BDATE, BCONTENT, BCODE, BVIDEO,  BGCODE, LIKENUM FROM "
	         + "(SELECT BO.*, NVL(LIKECOUNT,0) AS LIKENUM FROM BOARD BO LEFT OUTER JOIN "
	         + "(SELECT LICODE, COUNT(*) AS LIKECOUNT FROM BOARDLIKE WHERE LICODE IN "
	         + "(SELECT TAGCODE FROM HASHTAG WHERE TAGNAME = #{tagname}) "
	         + "GROUP BY LICODE) LI ON BO.BCODE = LI.LICODE "
	         + "WHERE BCODE IN (SELECT TAGCODE FROM HASHTAG WHERE TAGNAME = #{tagname})) "
	         + "ORDER BY BDATE DESC) BD, MEMBER MEM WHERE (BD.BMID = MEM.MID)")
	   ArrayList<TimeLineDto> getTagNewBoardList(HashTagDto tag);
	   
	   
	   @Select("SELECT TAGNAME, COUNT(TAGCODE) AS TAGNUM FROM HASHTAG WHERE TAGNAME IN #{tagname} GROUP BY TAGNAME")
	   HashTagDto getHashTagInfo(String tagname);
}
