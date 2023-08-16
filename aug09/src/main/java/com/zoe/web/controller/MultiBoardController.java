package com.zoe.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MultiBoardController {

	@GetMapping("/multiboard")
	public String multiboard() {
		return "multiboard";
	}
}
