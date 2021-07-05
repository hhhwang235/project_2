package mybatis.dao;

import java.io.InputStream;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.mapping.ResultMap;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.dto.BoardDTO;
import mybatis.dto.CartDTO;
import mybatis.dto.testDTO;

public class CartDAO {
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
			
	
	//카트 전체 목록 검색
		public int cartInsert(CartDTO dto) {
			SqlSession session = sqlMapper.openSession();
			int succ = session.insert("cartInsert", dto);
			session.commit();
			session.close();
			return succ;
		} //cartInsert()
		
		//전체 목록 검색
		public List<testDTO> cartSelect(String name) {
			SqlSession session = sqlMapper.openSession();
			List<testDTO> list = null;
			list = session.selectList("cartSelect", name);
			session.close();
			return list;
		} //cartSelect()
		
		//장바구니 삭제
		public void cartClear(String name) {
			SqlSession session = sqlMapper.openSession();
			//alert 창을 사용하지 않을 경우에는 succ가 필요없다.
			//ActionForward를 이용한 페이지 전환
			session.delete("cartClear", name);
			session.commit();
			session.close();
		} //boardDelte()
}
