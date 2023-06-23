package com.som.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.som.db.SqlSessionManager;
import com.som.model.MessageVO;

public class MessageDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 메세지 저장
	public int messageUpdate(MessageVO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("com.som.db.MessageMapper.insertMessage", vo);
		sqlSession.close();
		return res;
	}
	
	// 나에게 온 메세지 불러오기
	public List<MessageVO> showMessage(String recipient) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<MessageVO> vo = sqlSession.selectList("com.som.db.MessageMapper.getMessageList", recipient);
		sqlSession.close();
		return vo;
	}
}
