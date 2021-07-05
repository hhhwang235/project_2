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

public class MemberDAO {
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
	
	//로그인 하기
	public Integer insertMember(MemberDTO member) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".insertMember";
			int result = sqlSession.insert(statement, member);
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			return result;
		} finally {
			sqlSession.close();
		}
	}
	
	//로그인 체크(아이디 체크)
	 public boolean loginCheck1(String id) {
		 SqlSession sqlSession = getSqlSessionFactory().openSession();
		 try {
			 	String name = sqlSession.selectOne(namespace + ".loginCheck1", id);

				boolean result = (name != null)&&(name.equals(id));
				return result;
			} finally {
				sqlSession.close();
			}
	 }
	 
	//로그인 체크(패스워드 체크)
	 public boolean loginCheck2(String id, String pw) {
		 SqlSession sqlSession = getSqlSessionFactory().openSession();
		 try {
			 	String name = sqlSession.selectOne(namespace + ".loginCheck2", id);
				
				boolean result = (name != null)&&(name.equals(pw));
				return result;
			} finally {
				sqlSession.close();
			}
	 }
	 
	//태그 체크
		 public Boolean tagCheck(String id) {
			 SqlSession sqlSession = getSqlSessionFactory().openSession();
			 try {
				 Object name = sqlSession.selectList(namespace + ".tagCheck", id);
					
				 String result = name.toString();
				 	Boolean result2 = result.contains("산");
					return result2;
				} finally {
					sqlSession.close();
				}
		 }
    
		//회원 정보 출력
			public MemberDTO memberOne(String name) {
				SqlSession sqlSession = getSqlSessionFactory().openSession();
				MemberDTO dto = null;
				dto = sqlSession.selectOne("memberOne", name); //출력될 결과가 하나기 때문에 selectOne을 사용, 여러 개일 경우엔 selectList
				sqlSession.close();
				return dto;
			} //memberOne()
			
			
		//회원 정보 수정
			public void memberUpdate(MemberDTO dto) {
				SqlSession sqlSession = getSqlSessionFactory().openSession();
				sqlSession.update("memberUpdate", dto);
				sqlSession.commit();
				sqlSession.close();
			}//memberUpdate()
			
		//회원 탈퇴
			public Integer memberDelete(String id) {
				SqlSession sqlSession = getSqlSessionFactory().openSession();
				try {
				//alert 창을 사용하지 않을 경우에는 succ가 필요없다.
				//ActionForward를 이용한 페이지 전환
				int result = sqlSession.delete("memberDelete", id);
				if (result > 0) {
					sqlSession.commit();
				}
				return result;
			}finally {
				sqlSession.close();
			}
		}//memberDelete()
			
	
}
