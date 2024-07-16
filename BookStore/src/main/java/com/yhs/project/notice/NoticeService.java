package com.yhs.project.notice;

import java.util.List;

import com.yhs.project.dto.NoticeVO;


public interface NoticeService {

	List<NoticeVO> listNotice(String name);

	NoticeVO getNotice(int nseq);

	void insertNotice(NoticeVO nv);
	
	void updateNotice(NoticeVO nv);
	
	void deleteNotice(int nseq);
}
