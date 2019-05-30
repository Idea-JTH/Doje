package com.hotdog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hotdog.vo.BoardVO;
import com.hotdog.vo.Criteria;

@Mapper
public interface BoardDao {
	public void write(BoardVO vo);
	public List<BoardVO> getList(BoardVO vo);
	public BoardVO getDetail(BoardVO vo);
	public List<BoardVO> getCriteriaList(Criteria criteria);
	public Integer getCriteriaCnt(Criteria criteria);
	public void delete(BoardVO vo);
	public void update(BoardVO vo);
}
