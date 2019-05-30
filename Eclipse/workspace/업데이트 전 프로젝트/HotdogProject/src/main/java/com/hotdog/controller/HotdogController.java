package com.hotdog.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hotdog.service.BoardService;
import com.hotdog.service.UserService;
import com.hotdog.vo.BoardVO;
import com.hotdog.vo.UserVO;

@Controller
public class HotdogController {

	@Autowired
	UserService us;
	
	@Autowired
	BoardService bs;

	// 메인 페이지
	@RequestMapping("/main")
	public String main() {

		return "/main";
	}

	// 로그인 페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session) {
		if(session.getAttribute("user") != null) {
			return "/alreadyLogin";
		}else {
			return "/user/info/login";	
		}
	}

	// Ajax 로그인 처리
	@RequestMapping(value="/loginProcAjax", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public int loginProcAjax(UserVO vo, HttpSession session) {
		try {
			int check;
			UserVO vo2 = us.getUser(vo);
			
			if(vo2 != null) {
				check = 1;
				System.out.println(check);
				session.setAttribute("user", vo2);
				return check;
			} else {
				check = 0;
				System.out.println(check);
				return check;
			}
		} catch(Exception e) {
			throw new HotdogErr("error!!!" , "error msg");
		}
	}
	
	//일반 로그인 처리
	@RequestMapping(value="/loginProc", method = RequestMethod.POST)
	public String loginProc(UserVO vo, HttpSession session) {
			UserVO vo2 = us.getUser(vo);
			if(vo2 != null) {
				session.setAttribute("user", vo2);
				return "redirect:/main";
			} else {
				return "/user/info/login";
			}
	}
	
	//로그아웃 처리
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

	// 회원가입 페이지
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {

		return "/user/info/join";
	}

	// 회원 가입 요청 시
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerProc(@Valid UserVO vo, BindingResult bindingResult, RedirectAttributes rttr) {
		System.out.println(vo.getId());
		System.out.println(vo.getPassword());
		System.out.println(vo.getNickname());
		System.out.println(vo.getEmail());
		System.out.println(vo.getPhonenumber());
	    if(bindingResult.hasErrors()) {
            System.out.println("에러발생");
            System.out.println(bindingResult.getFieldError());
            rttr.addFlashAttribute("msg","회원가입에 실패하였습니다. 다시 시도해주세요.");
            return "redirect:/register";
        } else {
        	us.regist(vo);
            System.out.println("회원가입성공!!");
            rttr.addFlashAttribute("msg","회원가입이 성공적으로 처리되었습니다!");
            return "redirect:/login";
        }
	}
	
	// ajax로 id중복 체크 시
	@RequestMapping(value = "/idCheckAjax")
	@ResponseBody
	public int idCheckProc(String id) {
		int check = us.idCheck(id);
		return check;
	}
	
	// ajax로 닉네임 중복 체크 시
	@RequestMapping(value = "/nickCheckAjax")
	@ResponseBody
	public int nickCheckProc(String nickname) {
		int check = us.nickCheck(nickname);
		return check;
	}

	// ajax로 회원가입 요청 시
	// produces를 사용하면 응답 페이지에 대한 인코딩 처리를 할 수 있다!!
	@RequestMapping(value = "/registerAjax", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String registAjax(UserVO vo) {
		System.out.println(vo.getNickname());
		us.regist(vo);
		return "성공";
	}

	// 자유게시판 메인 페이지
	@RequestMapping("/free")
	public ModelAndView freeBoard() {
		BoardVO vo = new BoardVO();
		vo.setTable("freeboard");
		List<BoardVO> list = bs.getList(vo);
		ModelAndView model = new ModelAndView();
		model.setViewName("/user/board/free/main");
		model.addObject("list", list);
		return model;
	}

	// 공지사항 메인 페이지
	@RequestMapping("/notice")
	public String noticeBoard(Model model) {
		BoardVO vo = new BoardVO();
		vo.setTable("noticeboard");
		List<BoardVO> list = bs.getList(vo);
		return "/user/board/notice/main";
	}

	// 유저 목록 페이지
	@RequestMapping(value = "/userlist")
	public ModelAndView userlist() {
		List<UserVO> list = us.getList();
		ModelAndView model = new ModelAndView();
		model.setViewName("/user/info/userlist");
		model.addObject("list", list);
		return model;
	}

	// 비번 수정 페이지
	@RequestMapping(value = "/modifypassword")
	public ModelAndView modifypw(String nickname) {
		ModelAndView model = new ModelAndView();
		model.setViewName("/user/info/modifyPw");
		model.addObject("data", us.getDetailInfo(nickname));
		return model;
	}

	// 비번 수정 ajax요청 받을 시
	@RequestMapping(value = "/modifypasswordAjax", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String modifypwAjax(UserVO vo) {
		us.modifyPassword(vo);
		return "비밀번호 수정이 성공적으로 완료되었습니다!";
	}

	
	
	
	
	
	
	//error test
	@RequestMapping(value="/error1")
	public void error1() {
		try {
			int i = 4;
			int b = i / 0;
			System.out.println(b);
		} catch (Exception e) {
			e.printStackTrace();
			HotdogErr err = new HotdogErr("숫자를 0으로 나눌 수 없습니다!!", "/error500");
			throw err;
		}
		
	}
	
	@RequestMapping(value="/error2")
	public String error2() {
		try {
			int[] arr = {1,2,3};
			System.out.println(arr[3]);
		} catch (Exception e) {
			e.printStackTrace();
			HotdogErr err = new HotdogErr("인덱스를 벗어났습니다!!", "/error500");
			throw err;
		}
		return "/main";
	}
	
	@RequestMapping(value="/error3")
	public String error3() {
		try {
			BufferedReader br = new BufferedReader(new FileReader("없는파일"));
			br.readLine();
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
			HotdogErr err = new HotdogErr("찾으시는 파일은 존재하지 않습니다!!", "/error500");
			throw err;
		}
		return "/main";
	}
}
