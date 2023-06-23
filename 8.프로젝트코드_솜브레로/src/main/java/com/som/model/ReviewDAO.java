package com.som.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.som.db.SqlSessionManager;

public class ReviewDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 상품에 따른 렌탈 정보 저장
	public List<ReviewVO> getReviews(int product_seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<ReviewVO> vo = sqlSession.selectList("com.som.db.ReviewMapper.getReviews", product_seq);
		sqlSession.close();
		return vo;
	}

	public int updateReview(ReviewVO r_vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("com.som.db.ReviewMapper.insertReview", r_vo);
		sqlSession.close();
		return res;
	}
}
