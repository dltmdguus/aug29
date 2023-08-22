package com.zoe.web.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoe.web.dao.NoticeDAO;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;

	public List<Map<String, Object>> list() {
		return noticeDAO.list();
	}

	public Map<String, Object> detail(int nno) {
		return noticeDAO.detail(nno);
	}

	public String nWriter(int nno) {
		return noticeDAO.nWriter(nno);
	}

	public String getOriFileName(String filename) {
		return noticeDAO.getOriFileName(filename);
	}
}
