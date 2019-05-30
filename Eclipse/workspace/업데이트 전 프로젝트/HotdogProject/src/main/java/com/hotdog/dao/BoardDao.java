package com.hotdog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hotdog.vo.BoardVO;

@Mapper
public interface BoardDao {
	public void write(BoardVO vo);
	public List<BoardVO> getList(BoardVO vo);
}
