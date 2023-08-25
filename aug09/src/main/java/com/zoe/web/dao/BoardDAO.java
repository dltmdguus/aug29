package com.zoe.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.zoe.web.dto.BoardDTO;

@Repository
@Mapper
public interface BoardDAO {

	List<BoardDTO> boardList();

	BoardDTO detail(int bno);

	int write(BoardDTO dto);

	void readUP(int bno);

	BoardDTO detail2(int bno);

}
