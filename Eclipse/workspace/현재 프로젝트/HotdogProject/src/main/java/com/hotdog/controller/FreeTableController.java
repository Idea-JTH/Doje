package com.hotdog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hotdog.service.BoardService;
import com.hotdog.vo.BoardVO;
import com.hotdog.vo.UserVO;

@Controller
@RequestMapping(value="/free")
public class FreeTableController {
	
	public static String table = "freeboard";
	
	@Autowired
	BoardService bs;
	
	@RequestMapping(value="/detail/{id}", method=RequestMethod.GET)
	public String free(@PathVariable("id") Integer id, Model model, RedirectAttributes rttr, HttpServletRequest request, HttpSession session) {
		BoardVO vo = new BoardVO();
		vo.setId(id);
		vo.setTable(table);
		vo = bs.getDetail(vo);
		if(vo != null) {
			model.addAttribute("data", vo);
			session.removeAttribute("referer");
			session.setAttribute("referer", request.getHeader("referer"));
			return "/user/board/free/detail";
		} else {
			rttr.addFlashAttribute("msg", "해당 글이 존재하지 않습니다.");
			return "redirect:/free";
		}
		
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write(HttpSession session, RedirectAttributes rttr) {
		if(session.getAttribute("user") != null) {
			return "/user/board/free/write";
		} else {
			rttr.addFlashAttribute("msg", "글 작성은 로그인 후 이용 가능합니다.");
			return "redirect:/login";
		}
		
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writeProc(@Valid BoardVO vo, BindingResult bindingResult, RedirectAttributes rttr) {
		if(bindingResult.hasErrors()) {
			rttr.addFlashAttribute("msg", "제목과 글 내용은 필수 입니다.");
			return "redirect:/free/write";
		} else {
			bs.write(vo);
			return "redirect:/free";
		}
		
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deletePost(Integer id, String writer, RedirectAttributes rttr, HttpSession session, HttpServletRequest request) {
		UserVO user = (UserVO) session.getAttribute("user");
		String referer = (String) session.getAttribute("referer");
		BoardVO data = new BoardVO();
		data.setTable(table);
		data.setId(id);
		data = bs.getDetail(data);
		if (data != null) {
			if (user.getNickname().equals(writer)) {
				BoardVO vo = new BoardVO();
				vo.setId(id);
				vo.setTable(table);
				bs.delete(vo);
				rttr.addFlashAttribute("msg", "해당 글 삭제가 완료되었습니다.");
				return "redirect:/free";
			} else {
				rttr.addFlashAttribute("msg","해당 글을 삭제할 권한이 없습니다.");
				return "redirect:" + referer;
			}
		} else {
			rttr.addFlashAttribute("msg", "해당 글이 이미 존재하지 않습니다.");
			return "redirect:/free";
		}
		
		
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String modPostView(Integer id, String writer, Model model, RedirectAttributes rttr, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		BoardVO data = new BoardVO();
		data.setTable(table);
		data.setId(id);
		data = bs.getDetail(data);
		if(data != null) {
			BoardVO vo = new BoardVO();
			vo.setId(id);
			vo.setTable(table);
			vo = bs.getDetail(vo);
			if(user.getNickname().equals(writer)) {
				model.addAttribute("data", vo);
				return "/user/board/free/write";
			} else {
				rttr.addFlashAttribute("msg", "해당 글을 수정할 권한이 없습니다.");
				return "redirect:/free";
			}
		} else {
			rttr.addFlashAttribute("msg", "해당 글이 존재하지 않습니다.");
			return "redirect:/login";
		}
		
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String modPostProc(BoardVO vo, RedirectAttributes rttr) {
		bs.update(vo);
		rttr.addFlashAttribute("msg", "해당 글 수정을 완료하였습니다.");
		return "redirect:/free/detail/" + vo.getId();
	}
	
	
}
