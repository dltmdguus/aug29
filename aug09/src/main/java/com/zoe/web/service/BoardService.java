package com.zoe.web.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zoe.web.dao.BoardDAO;
import com.zoe.web.dto.BoardDTO;
import com.zoe.web.util.Util;

@Service
public class BoardService {
	@Autowired
	private Util util;
	
	@Autowired
	private BoardDAO boardDAO;

	public List<BoardDTO> boardList() {
		return boardDAO.boardList();
	}

	public BoardDTO detail(int bno) {
		//읽음수 +1하기
		boardDAO.readUP(bno);
		return boardDAO.detail(bno);
	}

	public int write(BoardDTO dto) {
		//ip
		dto.setBip(util.getIp());
		//uuid
		dto.setUuid(UUID.randomUUID().toString());
		return boardDAO.write(dto);
	}

	public BoardDTO detail2(int bno) {
		return boardDAO.detail2(bno);
	}

	
}
