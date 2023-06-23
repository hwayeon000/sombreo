package com.som.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.som.db.SqlSessionManager;

public class ApproveDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 상품에 따른 렌탈 정보 저장
	public int insertApprove(ApproveVO a_vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("com.som.db.ApproveMapper.insertApprove", a_vo);
		sqlSession.close();
		
		return res;
	}
}
