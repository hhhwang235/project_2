package mybatis.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.dto.BoardDTO;
import mybatis.dto.GoodsDTO;

public class GoodsDAO {
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
		public List<GoodsDTO> goodsSearchAll() {
			SqlSession session = sqlMapper.openSession();
			List<GoodsDTO> list = session.selectList("goodsSearchAll");
			session.close();
			return list;
		} //goodsSearchAll()
		
		//카트 전체 목록 부분 검색
				public List<GoodsDTO> goodsSearch(String name) {
					SqlSession session = sqlMapper.openSession();
					List<GoodsDTO> list = session.selectList("goodsSearch", name);
					session.close();
					return list;
				} //goodsSearch()
				
				//작성한 글 등록
				public int goodsInsert(GoodsDTO dto) {
					SqlSession session = sqlMapper.openSession();
					//alert 창을 사용할 경우에는 succ를 return 해야한다.
					//PrintWriter 이용한 script 코드로 구현한 후 페이지 전환 처리
					int succ = 0;
					succ = session.insert("goodsInsert", dto);
					session.commit();
					session.close();
					return succ;
				} //goodsInsert()
				
				//글 번호로 글 검색
				public GoodsDTO goodsDetail(int g_num) {
					SqlSession session = sqlMapper.openSession();
					GoodsDTO dto = null;
					dto = session.selectOne("goodsDetail", g_num); //출력될 결과가 하나기 때문에 selectOne을 사용, 여러 개일 경우엔 selectList
					session.close();
					return dto;
				} //goodsDetail()
				
				//글 수정
				public int goodsAmountUpdate(GoodsDTO dto) {
					SqlSession session = sqlMapper.openSession();
					int succ = session.update("goodsAmountUpdate", dto);
					session.commit();
					session.close();
					return succ;
				}//goodsAmountUpdate()
				
				//상품삭제
				public int goodsDelete(String num) {
					SqlSession session = sqlMapper.openSession();
					int succ = session.delete("goodsDelete", num);
					session.commit();
					session.close();
					return succ;
				}//goodsDelete()
}