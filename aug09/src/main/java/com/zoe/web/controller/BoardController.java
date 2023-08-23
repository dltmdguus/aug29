package com.zoe.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.zoe.web.dto.BoardDTO;
import com.zoe.web.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/board")
	public String board(Model model) {
		List<BoardDTO> list = boardService.boardList();
		//System.out.println(list);
		model.addAttribute("list", list);		
		return "board";
	}
	
	@ResponseBody
	@PostMapping("/detail")
	public String detail(@RequestParam("bno") int bno ) {
		//System.out.println(bno);
		BoardDTO dto = boardService.detail(bno);
		
		//JSONObject json = new JSONObject();
		ObjectNode json = JsonNodeFactory.instance.objectNode();
		
		//JSONObject e = new JSONObject();
		
		json.put("content", dto.getBcontent());
		json.put("uuid", dto.getUuid());
		json.put("ip", dto.getBip());
		
		//json.put("result", e);
		System.out.println(json.toString());
//{"uuid":"bcf8bec9-3e02-47fd-84fd-af23a9b06c40","content":"<p>저장되나요?저장되나요?저장되나요?<br><\/p>"}

		
		
		
//{"result":{"uuid":"bcf8bec9-3e02-47fd-84fd-af23a9b06c40","content":"<p>저장되나요?저장되나요?저장되나요?<br><\/p>"}}
		
		
		
//{"dto":"BoardDTO(bno=0, blike=0, commentcount=0, btitle=null, bcontent=<p>저장되나요?저장되나요?저장되나요?<br><\/p>, m_name=null, m_id=null, bdate=null, bip=null, uuid=bcf8bec9-3e02-47fd-84fd-af23a9b06c40)"}

		return json.toString();
	}

	@GetMapping("/write")
	public String write() {
		return "write";
	}
	
	@PostMapping("/write")
	public String write(HttpServletRequest request, HttpSession session) {
		//로그인 한 사용자만 들어올 수 있습니다.
		//System.out.println(request.getParameter("title"));
		//System.out.println(request.getParameter("content"));
		BoardDTO dto = new BoardDTO();
		dto.setBtitle(request.getParameter("title"));
		dto.setBcontent(request.getParameter("content"));
		dto.setM_id(String.valueOf(session.getAttribute("mid")));//임시로 members에 있는 id를 넣어주세요.
		
		int result = boardService.write(dto);
		System.out.println(result);
		
		return "redirect:/board";
	}
	
	@PostMapping("/delete")
	public String delete(BoardDTO dto) {
		System.out.println();
		
		return "redirect:/board";
	}
	
	
}
