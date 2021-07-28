package com.BodProject.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.BodProject.dto.FriendDto;
import com.BodProject.dto.MemberDto;

public interface MemberDao {

	@Select("SELECT MID FROM MEMBER WHERE MID = #{loginId} AND MPW = #{loginPw} ")
	String checkLogin(@Param("loginId") String loginId, @Param("loginPw") String loginPw);
	
	@Select("SELECT MNICK FROM MEMBER WHERE MID = #{loginId}")
	String getNick(String loginId);
	
	@Select("SELECT MPROFILE FROM MEMBER WHERE MID =#{loginId} ")
	String getProfile(String loginId);

	@Select("SELECT MID FROM MEMBER WHERE MNAME = #{mname} AND MPHONE = #{mphone}")
	String searchId(@Param("mname") String mname,@Param("mphone") int mphone);

	@Select("SELECT MPW FROM MEMBER WHERE MID = #{mid} AND MPHONE = #{mphone}")
	String searchPw(@Param("mid") String memail, @Param("mphone") int mphone);

	@Select("SELECT MID FROM MEMBER WHERE MID = #{mid} AND MNAME = #{mname}")
	String checkKakaoUser(@Param ("mid") String kId, @Param("mname") String kname);
	
	//회원가입
	@Select("SELECT MID FROM MEMBER WHERE MID = #{inputMid}")
	String midCheck(String inputMid);

	@Select("SELECT MNICK FROM MEMBER WHERE MNICK =#{inputMNICK}")
	String MNICKcheck(String inputMNICK);

	@Insert("INSERT INTO MEMBER(MID, MPW, MNAME, MADDR, MNICK, MBIRTH, MGENDER, MPHONE, MPROFILE) VALUES(#{mid}, #{mpw}, #{mname}, #{maddr}, #{mnick}, TO_DATE(#{mbirth},'YYYY-MM-DD'),#{mgender, jdbcType=VARCHAR} ,#{mphone}, #{mprofile})")
	int memberjoin(MemberDto memberInfo);

	@Update("UPDATE MEMBER SET MPW = #{mpw}, MNAME = #{mname}, MNICK = #{mnick}, MADDR = #{maddr}, MBIRTH = #{mbirth}, MGENDER = #{mgender},"
			+" MPHONE = #{mphone}, MPROFILE = #{mprofile} WHERE MID = #{mid} ")
	int modifyMember(MemberDto modifyMem);

	@Insert("INSERT INTO FRIEND VALUES(#{friendId}, #{loginId})")
	int friendRequest(@Param("loginId") String loginId, @Param("friendId") String friendId);

	@Delete("DELETE FROM FRIEND WHERE MYMID = #{loginId} AND FRMID = #{friendId}")  //삭제 첫번째
	int friendDelete(@Param("loginId") String loginId, @Param("friendId")  String friendId);
	
	@Delete("DELETE FROM FRIEND WHERE FRMID = #{loginId} AND MYMID = #{friendId}")  //삭제 두번째
	int friendDelete2(@Param("loginId") String loginId, @Param("friendId")  String friendId);

	@Select("SELECT * FROM MEMBER WHERE MID IN (SELECT FRMID FROM FRIEND WHERE MYMID = #{userId} "
			+ " AND FRMID IN (SELECT MYMID FROM FRIEND WHERE FRMID = #{userId}))")
	ArrayList<MemberDto> getFriendList(String userId);

	@Select("SELECT FRMID FROM FRIEND WHERE MYMID = ( SELECT FRMID FROM FRIEND WHERE FRMID = #{friendId} AND MYMID = #{loginId})"
			+" AND FRMID = #{loginId}")
	String friendCheck(@Param ("loginId")String loginId, @Param("friendId") String friendId);

	//7월23일
		@Select("SELECT * FROM MEMBER WHERE MID IN (SELECT MYMID FROM FRIEND WHERE FRMID = #{userId}) AND MID NOT IN (SELECT FRMID FROM FRIEND WHERE MYMID = #{userId})")
		ArrayList<MemberDto> getFriendRequestList(String userId);

		@Insert("INSERT INTO FRIEND VALUES (#{friendId}, #{userId})")
		int acceptFriend(@Param("userId") String userId, @Param("friendId") String friendId);

		@Delete("DELETE FROM FRIEND WHERE FRMID = #{userId} AND MYMID = #{friendId}")
		int refuseFriend(@Param("userId") String userId, @Param("friendId") String friendId);

		@Delete("DELETE FRIEND WHERE FRMID = #{userId} AND MYMID = #{friendId}")
		int deleteFriend(@Param("userId") String userId, @Param("friendId") String friendId);

		@Delete("DELETE FRIEND WHERE FRMID = #{friendId} AND MYMID = #{userId}")
		int deleteFriend2(@Param("userId") String userId, @Param("friendId") String friendId);

		@Select("SELECT * FROM MEMBER WHERE MID = #{mid}")
		MemberDto getMemberInfo(@Param("mid") String loginId);

		@Select("SELECT * FROM FRIEND WHERE FRMID = #{friendId} AND MYMID = #{loginId}")
		FriendDto friendRequestCheck(@Param("loginId") String loginId, @Param("friendId") String friendId);
		
		@Select("SELECT MID FROM MEMBER WHERE MID IN (SELECT MYMID FROM FRIEND WHERE FRMID = #{userId}) AND MID NOT IN (SELECT FRMID FROM FRIEND WHERE MYMID = #{userId})")
		String getFriendRequest(String userId);

}
