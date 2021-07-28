package com.BodProject.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.BodProject.dto.QnADto;

public interface QnADao {
	
	@Select("SELECT MAX(QACODE) FROM QNA")
	String getMaxCode();
	
	@Insert("INSERT INTO QNA(QAMID, QAQ, QADATE, QACODE, QATITLE) VALUES(#{qamid}, #{qaq}, SYSDATE, #{qacode}, #{qatitle})") 
	int question(QnADto qdto);

	@Select("SELECT QAMID, QAQ, QADATE, QACODE, QATITLE, QAA, MNICK AS QAMNICK FROM QNA, MEMBER WHERE QAMID = MID")
	ArrayList<QnADto> getQnAList();

	@Select("SELECT QAMID, QAQ, QADATE, QACODE, QATITLE, QAA, MNICK AS QAMNICK FROM QNA, MEMBER WHERE QAMID = MID AND QACODE = #{qacode}")
	QnADto getQnAInfo(String qacode);
	
	@Update("UPDATE QNA SET QAA = #{qaa} WHERE QACODE = #{qacode}")
	int answer(QnADto qdto);

	@Select("SELECT QAA FROM QNA WHERE QACODE = #{qacode}")
	String showAnswer(String qacode);

	@Delete("DELETE FROM QNA WHERE QACODE = #{qacode}")
	int qnaDelete(String qacode);

	@Update("UPDATE QNA SET QATITLE = #{qatitle} , QAQ = #{qaq} WHERE QACODE = #{qacode}")
	int qnaModify(QnADto qdto);
	
	

	


}
