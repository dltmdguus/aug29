package com.zoe.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zoe.web.service.LoginService;


@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
		
	//2023-08-11 프레임워크 프로그래밍 
	@GetMapping("/login.sik")
	public String index() {
		return "login";
	}
	//프레임워크 프로그래밍
	@PostMapping("/login.sik")
	public String login(@RequestParam Map<String, String> map, HttpSession session) {
		//세션이 있다면 다른 곳으로 이동
		//id / pw 값이 없다면 다른 곳으로 이동
		System.out.println(map);
		Map<String, Object> result = loginService.login(map);
		//System.out.println(result);
		//{m_name=뽀로로, count=1}
		if(String.valueOf(result.get("count")).equals("1")) {
			//정상로그인이라면 세션만들고, index로 이동합니다.
			session.setAttribute("mid", map.get("id"));
			session.setAttribute("mname", result.get("m_name"));
			return "redirect:/";
		} else {
			//다시 로그인으로 가기
			return "login";
		}
	}
	
	@GetMapping("/logout.sik")
	public String logout(HttpSession session) {
		if(session.getAttribute("mid") != null) {
			session.removeAttribute("mid");
		}
		if(session.getAttribute("mid") != null) {
			session.removeAttribute("mname");
		}
		//다른
		session.invalidate();
		return "redirect:/";
	}
	
	//﻿@PathVariable 사용법 (경로변수)
	@GetMapping("/myInfo@{id}")
	public ModelAndView myInfo(@PathVariable("id") String id, HttpSession session) {
		System.out.println("jsp가 보내준 값 : " + id);
		System.out.println(id.equals(session.getAttribute("mid")));
		//회원가입할때 개인정보 수정할 때 암호 암호화하기
		Map<String, Object> myInfo = loginService.myInfo(id);
		ModelAndView mv = new ModelAndView(); //객체 선언 = jsp명이 없는 상태
		mv.setViewName("myInfo"); //이동할jsp파일명
		mv.addObject("my", myInfo); //값 붙이기
		return mv;		
	}
	
	
}
