package com.zoe.web.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonMapFormatVisitor;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.zoe.web.service.AdminService;
import com.zoe.web.service.NoticeService;
import com.zoe.web.util.Util;

@Controller
@RequestMapping("/admin") // 어드민폴더아래 있는 애들은 이쪽으로 옴
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private Util util;

	@GetMapping("/")
	public String adminIndex2() {
		return "redirect:/admin/admin";
	}
	// adminservice /admindao / adminMapper

	// 어드민 중복으로 사용하지 않아도됨.
	@GetMapping("/admin")
	public String adminIndex() {

		return "admin/index";
		// 폴더안에 abmin폴더안에 index.jsp (jsp파일은 영향안받아서 폴더이름작아줘ㅏ야함)
	}

	@PostMapping("/login")
	public String adminLogin(@RequestParam Map<String, Object> map, HttpSession session) {
		//System.out.println(map);

		Map<String, Object> result = adminService.adminLogin(map);

		System.out.println(result);

		if (util.obj2Int(result.get("count")) == 1 && util.obj2Int(result.get("m_grade")) > 5) {
			// 세션올리기
			session.setAttribute("mid", map.get("id"));
			session.setAttribute("mname", result.get("m_name"));
			session.setAttribute("mgrade", result.get("m_grade"));
			// 메인으로 이동하기
			return "redirect:/admin/main";
		} else {
			return "redirect:/admin/admin?error=login";
		}
	}

	@GetMapping("/main")
	public String main() {
		return "admin/main"; // 폴더 적어줘야 admin/밑에 main.jsp
	}
	
	@GetMapping("/notice")
	public String notice(Model model) {
		//1 데이터베이스까지 연결하기
		//2 데이터 불러오기
		List<Map<String, Object>> list = adminService.list();
		//3 데이터 jsp로 보내기
		model.addAttribute("list", list);
		return "admin/notice";
	}
	
	@PostMapping("/noticeWrite")
	public String noticeWrite(@RequestParam("upFile") MultipartFile upfile, @RequestParam Map<String, Object> map) {
	//{title=되나요?, content=되나요, upFile=}
		//System.out.println(map);
	
		//23-08-22 요구사항 확인
		if(!upfile.isEmpty()) {
			//저장할 경로명 뽑기 request뽑기
			HttpServletRequest request = 
					((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			String path = request.getServletContext().getRealPath("/upload");
			System.out.println("실제경로 : " + path);
			
			//upfile 정보보기
//			System.out.println(upfile.getOriginalFilename()); //실제 파일이름 가져오기
//			System.out.println(upfile.getSize());//용량크기
//			System.out.println(upfile.getContentType());//어떤 타입인지
			//진짜로 파일 업로드 하기 경로+저장할 파일명
			//String타입의 경로를 file형태로 바꿔주겠습니다.
			//File filePath = new File(path);
			//중복이 발생할 수 있기 때문에 .... 파일명+날짜+ID+.파일확장자
			//									UUID + 파일명 + .확장자
			//									아이디 + UUID + 파일명.확장자
			UUID uuid = UUID.randomUUID();
			//String realFileName = uuid.toString() + upfile.getOriginalFilename();
			
			//날짜 뽑기 SimpleDateFormat
//			Date date = new Date();
//			SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMddHHmmss");
//			String dateTime = sdf.format(date);
			
			//다른 날짜 뽑기 형식
			LocalDateTime ldt = LocalDateTime.now();
			String format = ldt.format(DateTimeFormatter.ofPattern("YYYYMMddHHmmss"));
			//날짜 + UUID + 실제 파일명으로 사용하겠습니다.
			String realFileName = format + uuid.toString() + upfile.getOriginalFilename();
			
			File newFileName = new File(path, realFileName);
			//이제 파일 올립니다.
			try {
				//upfile.transferTo(newFileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//System.out.println("저장 끝");
			//FileCopyUtils를 사용하기 위해서는 오리지널 파일을 byte[]로 만들어야 합니다.
			try {
				FileCopyUtils.copy(upfile.getBytes(), newFileName);
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		
			//#{upFile}, #{realFile}
			map.put("upFile", upfile.getOriginalFilename());
			map.put("realFile", realFileName);
		}
		
		map.put("mno", 6);
		adminService.noticeWrite(map);
		return"redirect:/admin/notice";
	}
	
	@GetMapping("mail")
	public String mail() {
		return "admin/mail";
	}
	
	 @PostMapping("/mail")
	  public String mail(@RequestParam Map<String, Object> map) throws EmailException {
		 util.htmleMailSender(map);
	  return "admin/mail";
	  }
	  
	  //noticeDetail
	 @ResponseBody
	 @PostMapping("/noticeDetail")
	 public String noticeDetail(@RequestParam("nno") int nno) {
		 System.out.println(nno);
		 
		 //jackson 사용해보기
		 ObjectNode json = JsonNodeFactory.instance.objectNode();
		 
		 //json.put("name", "홍길동");
		 //해야할 일
		 /*1. 데이터 베이스에 물어보기 -> nno로 -> 본문내용 가져오기
		  *2. jackson에 담아주세요.
		  */
//		 Map<String, Object> maaaap = new HashMap<String, Object>();
//		 maaaap.put("bno", 123);
//		 maaaap.put("btitle", 1234);
//		 
//		 ObjectMapper jsonMap = new ObjectMapper();
//		 
//		 try {
//			json.put("map", jsonMap.writeValueAsString(maaaap));
//		} catch (JsonProcessingException e) {
//			e.printStackTrace();
//		}
		 
		 json.put("noticeDetail", adminService.noticeDetail(nno));
		 return json.toString();
	 }
	 
	 //noticeHide
	 @ResponseBody
	 @PostMapping("/noticeHide")
	 public String noticeHide(@RequestParam("nno") int nno) {
		int result = adminService.noticeHide(nno);
		ObjectNode json = JsonNodeFactory.instance.objectNode();
		json.put("result", result);
		 return json.toString();
		 		
	 }
		
	
}