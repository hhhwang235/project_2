package mybatis.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.dto.BoardDTO;
import mybatis.dto.tblCommentDTO;

public class tblCommentDAO {
	//①SqlSessionFactory 설정
		private static SqlSessionFactory sqlMapper;
		static {
			String resource = "mybatis-config.xml";
			try {
				InputStream inputStream = Resources.getResourceAsStream(resource);
				sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("SqlSessionFactory Exception");
			}
		} //static
		
		//작성한 글 등록
		public int tblCommentInsert(tblCommentDTO dto) {
			SqlSession session = sqlMapper.openSession();
			//alert 창을 사용할 경우에는 succ를 return 해야한다.
			//PrintWriter 이용한 script 코드로 구현한 후 페이지 전환 처리
			int succ = 0;
			succ = session.insert("commentInsert", dto);
			session.commit();
			session.close();
			return succ;
		} //tblCommentInsert()
		
		//전체 목록 검색
		public List<tblCommentDTO> commentSearchAll(int num) {
			SqlSession session = sqlMapper.openSession();
			List<tblCommentDTO> list = null;
			list = session.selectList("commentSelect",num);
			session.close();
			return list;
		} //commentSearchAll()
}
