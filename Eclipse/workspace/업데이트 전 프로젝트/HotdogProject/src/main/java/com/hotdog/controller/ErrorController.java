package com.hotdog.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/error")
public class ErrorController {
	@RequestMapping(value="/404")
	public String error404() {
		
		return "/error404";
	}
	
	@RequestMapping(value="/500")
	public String error500(HttpServletRequest req) {
		return "/error500";
	}
}
