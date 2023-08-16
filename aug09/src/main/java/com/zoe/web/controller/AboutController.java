package com.zoe.web.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AboutController {

	@GetMapping("/about")
	public String about(Model model) {
		String names = new String("구관모, 기상민, 김민성, 김수진, 김요한, 박지윤, 배기주, 송다원, 송재윤, 송화진, "
				 + "안희진, 유영조, 유종휘, 이대원, 이상화, 이승현, 이지선, 정대규, 정준식, 최범식, "
				 + "최지은, 표해현, 차승리, 황선우, 박채아");
		List<String> members = new ArrayList<String>(Arrays.asList(names.split(",")));
		Collections.shuffle(members);
		Collections.shuffle(members);
		Collections.shuffle(members);
		
		model.addAttribute("list", members);
		
		return "about";
	}
	

}
