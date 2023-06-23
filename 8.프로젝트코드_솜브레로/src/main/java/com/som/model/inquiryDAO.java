package com.som.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.som.db.SqlSessionManager;

	public class inquiryDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int uploadInquiry(InquiryVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.insert("uploadInquiry", vo);
		sqlSession.close();
		return cnt;
	}

	public List<InquiryVO> showInquiry() {
		List<InquiryVO> list = null;
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		list = sqlSession.selectList("showInquiry");
		sqlSession.close();
		return list;
	}

	// 세부 게시글 조회
	public InquiryVO detailInquiry(int num) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		InquiryVO vo = sqlSession.selectOne("detailInquiry", num);
		sqlSession.close();

		return vo;
	}

}
