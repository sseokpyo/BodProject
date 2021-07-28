package com.BodProject.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.BodProject.dao.MemberDao;
import com.BodProject.dto.FriendDto;
import com.BodProject.dto.MemberDto;

@Service
public class MemberService {
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	private HttpSession session;

	public String checkLogin(String loginId, String loginPw) {
		System.out.println("로그인 체크 실행");
		String checkResult = mdao.checkLogin(loginId,loginPw);
		if(checkResult == null ) {
			checkResult = "X";
		}
		System.out.println(checkResult);
		return checkResult;
	}

	public ModelAndView getNick(String loginId) {
		ModelAndView mav = new ModelAndView();
		
		
		System.out.println("svc:"+loginId);
		
		String nickName = mdao.getNick(loginId);
		String userProfile = mdao.getProfile(loginId);
		
		System.out.println(nickName);
		session.setAttribute("loginNick", nickName);
		session.setAttribute("loginId", loginId);
		
		if(userProfile.contains("http")){
			session.setAttribute("loginPf", userProfile);
		}else {
			userProfile = "/controller/resources/uploadImg/userimg/"+userProfile;
		}
		
		session.setAttribute("loginPf", userProfile);
		
		
		
		mav.setViewName("redirect:/boardList");  
		
		return mav;
	}

	//아이디 찾기
	public String searchId(String mname, int mphone) {
		String searchId = mdao.searchId(mname,mphone);
		return searchId;
	}

	//비밀번호 찾기
	public String searchPw(String mid, int mphone) {
		String searchPw = mdao.searchPw(mid,mphone);
		return searchPw;
	}

public String moveMidCheck(String inputMid) {
		String idCheckMsg = "NO";
		String midCheck = mdao.midCheck(inputMid);
		System.out.println(midCheck);
		if (midCheck == null) {
			idCheckMsg = "OK";
		}
		System.out.println(idCheckMsg);

		return idCheckMsg;
		
	}

	public String MNICKcheck(String inputMNICK) {

		String NickCheckMsg ="NO";
		String MNICKcheck = mdao.MNICKcheck(inputMNICK);
		System.out.println("MNICKcheck : " + MNICKcheck);
		if(MNICKcheck == null) {
			NickCheckMsg = "OK";
		}
		
		System.out.println("NickCheckMsg : " + NickCheckMsg);
		return NickCheckMsg;
	}

	public ModelAndView memberjoin(MemberDto memberInfo) throws IllegalStateException, IOException{
		 
		ModelAndView mav = new ModelAndView();
		
		MultipartFile mfile = memberInfo.getMfile();
			
		if(mfile.getSize() < 1 ){
				System.out.println("프로필 설정 안했을때 or 카카오 : "+memberInfo);
				int gCreateResult1 = mdao.memberjoin(memberInfo);
		}else {
			UUID uuid = UUID.randomUUID();
			
			String mfilename = uuid.toString() + "_" + mfile.getOriginalFilename();
			String savePath = "C:\\Users\\b4840\\Documents\\workspace-spring-tool-suite-4-4.10.0.RELEASE\\BodProject\\src\\main\\webapp\\resources\\uploadImg\\userimg";
			
			if(!mfile.isEmpty()) {
				mfile.transferTo(new File(savePath, mfilename));
			}
			memberInfo.setMprofile(mfilename);
			System.out.println("프로필 설정 했을때:"+memberInfo);
			int insertResult = mdao.memberjoin(memberInfo);
			
			System.out.println("insertResult : " + insertResult );
			
			if(insertResult < 1) {
				File file = new File(savePath, mfilename);
				file.delete();
		}
	}
		mav.setViewName("member/Login");
		return mav;
	}

	public String checkKakaoUser(String kId, String kname) {
		
		String kUserInfo = mdao.checkKakaoUser(kId,kname);
		System.out.println("카카오계정 확인:"+kUserInfo);
	
		return kUserInfo;
	}

	
	//0712 합친 후 추가 코드 -----------------------------------------------------
	
	//개인정보 수정
	public ModelAndView modifyMember(MemberDto modifyMem) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		
		
		String savePath = "C:\\Users\\b4840\\Documents\\workspace-spring-tool-suite-4-4.10.0.RELEASE\\BodProject\\src\\main\\webapp\\resources\\uploadImg\\userimg";
		
		//받아온 프로필 확인
		MultipartFile modiProfile = modifyMem.getMfile();
		
		// 1. 새로 지정한 프로필 사진이 있을때
		if(modiProfile.getSize() > 0  ){  
			//기존 저장된 파일 삭제 
			File file = new File(savePath, modifyMem.getMprofile());
			file.delete();
			
			//새로 파일 이름 생성
			UUID uuid = UUID.randomUUID();
			
			String mfilename = uuid.toString() + "_" + modiProfile.getOriginalFilename();

			if(!modiProfile.isEmpty()) {
				modiProfile.transferTo(new File(savePath, mfilename));
			}
			modifyMem.setMprofile(mfilename);
			
			//업데이트 실행
			int modifyMember = mdao.modifyMember(modifyMem);
			
			if(modifyMember < 0) {
				File file2 = new File(savePath, modifyMem.getMprofile());
				file2.delete();
			}
		}else {
		// 2. 새로 지정한 파일이 없을때 _ 바로 업데이트 실행
			String mprofile = modifyMem.getMprofile();  
			String saveProfile = mprofile.substring(40);
			modifyMem.setMprofile(saveProfile);
			int modifyMember2 = mdao.modifyMember(modifyMem);
		}
		
		//세션 다시 저장
		session.invalidate();
		
		String userProfile = modifyMem.getMprofile();
		session.setAttribute("loginId", modifyMem.getMid());
		session.setAttribute("loginNick", modifyMem.getMnick());
		
		if(userProfile.contains("http")){
			session.setAttribute("loginPf",userProfile);
		}else {
			userProfile = "/controller/resources/uploadImg/userimg/"+userProfile;
		}
		session.setAttribute("loginPf", userProfile);
		
		mav.setViewName("redirect:/boardList");
		
		return mav;
	}

	//친구요청

	public int friendRequest(String loginId, String friendId) {
		System.out.println("loginId, friendId : " + loginId + " / " + friendId);
		FriendDto friend = mdao.friendRequestCheck(loginId, friendId);
		System.out.println("friend : " + friend);
		int requestResult = 0;
		if (friend == null) {
			requestResult = mdao.friendRequest(loginId, friendId);
		}
		System.out.println("requestResult : " + requestResult);
		return requestResult;
	}

	//친구수락
	
	//친구거절
	
	
	//친구 삭제
	public int friendDelete(String loginId, String friendId) {
		
		//삭제 처리 두번 필요
		int deleteResult = mdao.friendDelete(loginId,friendId); 
		int deleteResult2 = mdao.friendDelete2(loginId,friendId);
		
		return deleteResult;
	}

	//친구목록 
	public ArrayList<MemberDto> getFriendList(String userId, String loginId) {
			
		ArrayList<MemberDto> friendList = mdao.getFriendList(userId);
			
			//이미지 경로 지정
			for(int i = 0; i < friendList.size(); i++) {
				if(friendList.get(i).getMprofile().contains("http")) {
				}else {
					String mprofile = "/controller/resources/uploadImg/userimg/"+friendList.get(i).getMprofile();
					friendList.get(i).setMprofile(mprofile);
				}
				
				//로그인 회원과 친구인지 확인 
				String friendId = friendList.get(i).getMid();
				String fcheckResult = mdao.friendCheck(loginId,friendId);
				if(fcheckResult != null) {
					friendList.get(i).setFriendcheck(1);
				}else {
					friendList.get(i).setFriendcheck(0);
				}
			}
			
			return friendList;
	}
	
	//7월23일
		public ModelAndView moveFriendRequest(String userId) {
			// TODO Auto-generated method stub
			ModelAndView mav = new ModelAndView();
			ArrayList<MemberDto> friendList = mdao.getFriendList(userId);
			ArrayList<MemberDto> friendRequestList = mdao.getFriendRequestList(userId);		
			mav.addObject("friendRequestList", friendRequestList);
			mav.addObject("friendList", friendList);
			mav.setViewName("member/myFriendList");
			return mav;
		}

		public ModelAndView acceptFriend(String friendId, String userId) {
			// TODO Auto-generated method stub
			ModelAndView mav = new ModelAndView();
			System.out.println("friendId : " + friendId);
			System.out.println("userId : " + userId);
			int aceeptFriendReuslt = mdao.acceptFriend(userId, friendId);
			System.out.println("aceeptFriendReuslt : " + aceeptFriendReuslt);
			mav.setViewName("redirect:/moveFriendRequest?userId=" + userId);
			return mav;
		}

		public ModelAndView refuseFriend(String friendId, String userId) {
			// TODO Auto-generated method stub
			ModelAndView mav = new ModelAndView();
			int refuseFriendResult = mdao.refuseFriend(userId, friendId);
			System.out.println("refuseFriendResult : + refuseFriendResult");
			mav.setViewName("redirect:/moveFriendRequest?userId=" + userId);
			return mav;
		}

		public ModelAndView deleteFriend(String friendId, String userId) {
			// TODO Auto-generated method stub
			ModelAndView mav = new ModelAndView();
			int deleteFriendResult = mdao.deleteFriend(userId, friendId);
			int deleteFriendResult2 = mdao.deleteFriend2(userId, friendId);
			System.out.println("deleteFriendResult / deleteFriendResult2 : " + deleteFriendResult + " / " + deleteFriendResult2);
			mav.setViewName("redirect:/moveFriendRequest?userId=" + userId);
			return mav;
		}


		public String acceptFriendByAjax(String friendId, String userId) {		
			System.out.println("friendId : " + friendId);
			System.out.println("userId : " + userId);
			int aceeptFriendReuslt = mdao.acceptFriend(userId, friendId);
			System.out.println("aceeptFriendReuslt : " + aceeptFriendReuslt);		
			return aceeptFriendReuslt+"";
		}

		public String refuseFriendByAjax(String friendId, String userId) {	
			int refuseFriendResult = mdao.refuseFriend(userId, friendId);
			System.out.println("refuseFriendResult : + refuseFriendResult");
			return refuseFriendResult + "";
		}

		//개인정보 확인
	      public ModelAndView getMemberInfo(String loginId) {
	         ModelAndView mav = new ModelAndView();
	         
	         MemberDto memberInfo = mdao.getMemberInfo(loginId);
	         if(memberInfo.getMprofile().contains("http")) {
	            
	         }else {
	            String mprofile = "/controller/resources/uploadImg/userimg/"+memberInfo.getMprofile();
	            memberInfo.setMprofile(mprofile);
	         }
	         System.out.println("minfo: "+memberInfo);
	         mav.addObject("memberInfo", memberInfo);
	         mav.setViewName("member/UserInfoProfileModifyForm");
	         
	         return mav;
	      }
	      
	      public int friendRequestList(String loginId) {
	          // TODO Auto-generated method stub
	          String friendRequestResult = mdao.getFriendRequest(loginId);
	          int friendRequest = 0;
	          System.out.println("friendRequestResult : " + friendRequestResult);
	          if(friendRequestResult == null) {
	             friendRequest = 0;
	          } else {
	             friendRequest = 1;
	          }
	          return friendRequest;
	       }
	       
	       public ArrayList<MemberDto> getFriendRequestList(String loginId) {
	          // TODO Auto-generated method stub
	          ArrayList<MemberDto> friendRequestList = mdao.getFriendRequestList(loginId);
	          System.out.println(friendRequestList);
	          return friendRequestList;
	       }



	
}
