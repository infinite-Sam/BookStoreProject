package com.yhs.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yhs.project.dto.AQnaVO;
import com.yhs.project.dto.QnaVO;

@Repository
public class QnaDAO {
		
	@Autowired
	private SqlSessionTemplate mybatis;

	// qna목록조회
	public List<QnaVO> listQna(String id) {

		return mybatis.selectList("QnaDAO.listQna", id);
	}

	// qna상세보기
	public QnaVO getQna(int qseq) {

		return mybatis.selectOne("QnaDAO.getQna", qseq);
	}

	// qna등록하기
	public void insertQna(QnaVO vo) {

		mybatis.insert("QnaDAO.insertQna", vo);

	}
	
	public void updateQna(QnaVO vo) {
		mybatis.update("QnaDAO.updateQna", vo);
	}
	
	public void deleteQna(int qseq) {
		mybatis.delete("QnaDAO.deleteQna", qseq);
	}
	
	// 자주묻는질문 목록조회
	public List<AQnaVO> listAQna(String name) {

		return mybatis.selectList("QnaDAO.listAQna", name);
	}

	// 자주묻는질문상세보기
	public AQnaVO getAQna(int aqseq) {

		return mybatis.selectOne("QnaDAO.getAQna", aqseq);
	}
	
	// qna등록하기
	public void insertAqna(AQnaVO vo) {

		mybatis.insert("QnaDAO.insertAqna", vo);

	}
	
	public void updateAqna(AQnaVO vo) {
		mybatis.update("QnaDAO.updateAqna", vo);
	}
	
	public void deleteAqna(int aqseq) {
		mybatis.delete("QnaDAO.deleteAqna", aqseq);
	}
	
	public List<QnaVO> listMemberQna() {
		return mybatis.selectList("QnaDAO.listMemberQna");
	}
	
	public void qnaAnswer(QnaVO qv) {
		mybatis.update("QnaDAO.qnaAnswer", qv);
	}
}
