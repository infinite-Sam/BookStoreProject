package com.yhs.project.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhs.project.dao.NoticeDAO;
import com.yhs.project.dto.NoticeVO;
import com.yhs.project.notice.NoticeService;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO nd;
	
	@Override
	public List<NoticeVO> listNotice(String name) {
		return nd.listNotice(name);
	}

	@Override
	public NoticeVO getNotice(int nseq) {
		return nd.getNotice(nseq);
	}

	@Override
	public void insertNotice(NoticeVO nv) {
		nd.insertNotice(nv);
	}

	@Override
	public void updateNotice(NoticeVO nv) {
		nd.updateNptice(nv);
	}

	@Override
	public void deleteNotice(int nseq) {
		nd.deleteNotice(nseq);
	}

	
}
