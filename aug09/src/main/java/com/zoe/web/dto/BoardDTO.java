package com.zoe.web.dto;

import lombok.Data;

@Data
public class BoardDTO {
	private int bno, blike, commentcount, rowNum;
	private String btitle, bcontent, m_name, m_id, bdate, bip, uuid;
}
