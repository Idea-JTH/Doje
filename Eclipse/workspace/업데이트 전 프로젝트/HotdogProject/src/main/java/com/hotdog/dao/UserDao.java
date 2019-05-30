package com.hotdog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hotdog.vo.UserVO;

@Mapper
public interface UserDao {

	public int addUser(UserVO vo);	//회원가입

	public List<UserVO> getList();

	public UserVO getDetailInfo(String nickname);

	public void modPw(UserVO vo);

	public UserVO getUser(UserVO vo);

	public int idCheck(String id);

	public int nickCheck(String nickname);
	
}
