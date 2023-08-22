package com.zoe.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDAO {

	public List<Map<String, Object>> list();

	public Map<String, Object> detail(int nno);

	public String nWriter(int nno);

	public String getOriFileName(String filename);

}
