package com.hotdog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.hotdog.dao.UserDao;
import com.hotdog.vo.UserVO;


@Service
public class UserService {

	@Autowired
	UserDao UserDao;
	
	public ModelAndView regist(UserVO vo) {
		ModelAndView model = new ModelAndView();
		UserDao.addUser(vo);
		return model;
	}

	public List<UserVO> getList() {
		List<UserVO> list = UserDao.getList();
		return list;
	}

	public UserVO getDetailInfo(String nickname) {
		return UserDao.getDetailInfo(nickname);
	}

	public void modifyPassword(UserVO vo) {
		UserDao.modPw(vo);
	}

	public UserVO getUser(UserVO vo) {
		return UserDao.getUser(vo);
	}

	public int idCheck(String id) {
		return UserDao.idCheck(id);
	}

	public int nickCheck(String nickname) {
		return UserDao.nickCheck(nickname);
	}

}
