package com.som.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.som.db.SqlSessionManager;

public class HopeDAO {

	// DAO에서 호출했을 때 바로 DB와 연결할 수 있도록 SqlSessionManager(전에 만들었던 클래스)사용
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int uploadHope(HopeVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int cnt = sqlSession.insert("uploadHope",vo);
		sqlSession.close();
		return cnt;
	}
	
	public List<HopeVO> showHope() {
		List<HopeVO> list = null;
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		list = sqlSession.selectList("showHope");
		sqlSession.close();
		return list;
	}
	
	// 세부 게시글 조회
	public HopeVO detailHope(int num) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		HopeVO vo = sqlSession.selectOne("detailHope",num);
		sqlSession.close();
		
		return vo;
	}

}

