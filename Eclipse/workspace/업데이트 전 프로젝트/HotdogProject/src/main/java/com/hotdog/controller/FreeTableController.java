package com.hotdog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hotdog.service.BoardService;
import com.hotdog.vo.BoardVO;

@Controller
@RequestMapping(value="/free")
public class FreeTableController {
	@Autowired
	BoardService bs;
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String free() {
		
		return "/user/board/free/detail";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write() {
		
		return "/user/board/free/write";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeProc(BoardVO boardvo) {
		bs.write(boardvo);
		return "redirect:/free";
	}
}
