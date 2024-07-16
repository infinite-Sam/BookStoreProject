package com.yhs.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yhs.project.dto.NoticeVO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	// 공지사항 목록조회
	public List<NoticeVO> listNotice(String name) {

		return sst.selectList("NoticeDAO.listNotice", name);
	}

	// 공지사항 상세보기
	public NoticeVO getNotice(int nseq) {

		return sst.selectOne("NoticeDAO.getNotice", nseq);
	}

	// 공지사항 등록하기
	public void insertNotice(NoticeVO nv) {

		sst.insert("NoticeDAO.insertNotice", nv);
	}
	
	// 공지사항 수정
	public void updateNptice(NoticeVO nv) {
		sst.update("NoticeDAO.updateNotice", nv);
	}
	
	// 공지사항 삭제
	public void deleteNotice(int nseq) {
		sst.delete("NoticeDAO.deleteNotice", nseq);
	}
	
}
