package com.yhs.project.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhs.project.dao.QnaDAO;
import com.yhs.project.dto.AQnaVO;
import com.yhs.project.dto.QnaVO;
import com.yhs.project.qna.QnaService;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qd;
	
	@Override
	public List<QnaVO> listQna(String id) {
		
		return qd.listQna(id);
	}

	@Override
	public QnaVO getQna(int qseq) {
		
		return qd.getQna(qseq);
	}

	@Override
	public void insertQna(QnaVO vo) {
		
		qd.insertQna(vo);
	}
	
	@Override
	public List<AQnaVO> listAQna(String name) {
		
		return qd.listAQna(name);
	}

	@Override
	public AQnaVO getAQna(int aqseq) {
		
		return qd.getAQna(aqseq);
	}

	@Override
	public void updateQna(QnaVO vo) {
		qd.updateQna(vo);
	}

	@Override
	public void deleteQna(int qseq) {
		qd.deleteQna(qseq);
	}

	@Override
	public void insertAqna(AQnaVO vo) {
		qd.insertAqna(vo);
	}

	@Override
	public void updateAqna(AQnaVO vo) {
		qd.updateAqna(vo);
	}

	@Override
	public void deleteAqna(int aqseq) {
		qd.deleteAqna(aqseq);
	}

	@Override
	public List<QnaVO> listMemberQna() {
		return qd.listMemberQna();
	}

	@Override
	public void qnaAnswer(QnaVO qv) {
		qd.qnaAnswer(qv);
	}
}
