package com.yhs.project.qna;

import java.util.List;

import com.yhs.project.dto.AQnaVO;
import com.yhs.project.dto.QnaVO;

public interface QnaService {
	
	List<QnaVO> listQna(String id);

	QnaVO getQna(int qseq);

	void insertQna(QnaVO vo);
	
	void updateQna(QnaVO vo);
	
	void deleteQna(int qseq);
	
	List<AQnaVO> listAQna(String name);

	AQnaVO getAQna(int aqseq);
	
	void insertAqna(AQnaVO vo);
	
	void updateAqna(AQnaVO vo);
	
	void deleteAqna(int aqseq);
	
	List<QnaVO> listMemberQna();
	
	void qnaAnswer(QnaVO qv);
}
