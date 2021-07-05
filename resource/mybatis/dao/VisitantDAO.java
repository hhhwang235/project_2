package mybatis.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.dto.BoardDTO;
import mybatis.dto.Comment;
import mybatis.dto.GoodsDTO;
import mybatis.dto.MemberDTO;
import mybatis.dto.VisitantDTO;

public class VisitantDAO {
	private final String namespace = "mybatis.mapper.mybatis-mapper";

	private SqlSessionFactory getSqlSessionFactory() {
		String resource = "mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		return new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	public Comment selectCommentByPrimaryKey(Long commentNo) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return (Comment)sqlSession.selectOne(namespace + ".selectCommentByPrimaryKey", commentNo);
		} finally {
			sqlSession.close();
		}
	}
	
		//방문자 수 조회
			public Integer visitantAll() {
				SqlSession sqlSession = getSqlSessionFactory().openSession();
				int num;
				num = sqlSession.selectOne("visitantAll"); //출력될 결과가 하나기 때문에 selectOne을 사용, 여러 개일 경우엔 selectList
				sqlSession.close();
				return num;
			} //visitantAll()
			
			
		//회원 정보 수정
			public void visitantUpdate(int num) {
				SqlSession sqlSession = getSqlSessionFactory().openSession();
				sqlSession.update("visitantUpdate", num);
				sqlSession.commit();
				sqlSession.close();
			}//visitantUpdate()
			
}
