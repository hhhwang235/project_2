package mybatis.dao;

import java.io.InputStream;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.dto.BoardDTO;
import mybatis.dto.OrderDetailDTO;

public class OrderDetailDAO {
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
			
		//전체 목록 검색
		public List<OrderDetailDTO> orderDetail(String name) {
			SqlSession session = sqlMapper.openSession();
			List<OrderDetailDTO> list = null;
			list = session.selectList("orderDetail", name);
			session.close();
			return list;
		} //orderDetail()
			
		
		public int orderDetailInsert(OrderDetailDTO dto) {
			SqlSession session = sqlMapper.openSession();
			//alert 창을 사용할 경우에는 succ를 return 해야한다.
			//PrintWriter 이용한 script 코드로 구현한 후 페이지 전환 처리
			int succ = 0;
			succ = session.insert("orderDetailInsert", dto);
			session.commit();
			session.close();
			return succ;
		} //orderDetailInsert()
		
		//전체 목록 검색
				public List<OrderDetailDTO> orderDetailAll(String name) {
					SqlSession session = sqlMapper.openSession();
					List<OrderDetailDTO> list = null;
					list = session.selectList("orderDetailAll", name);
					session.close();
					return list;
				} //orderDetailAll()
				
				//총 주문 금액 추출
				public int orderPriceSum(String name) {
					SqlSession session = sqlMapper.openSession();
					int result;
					result = session.selectOne("orderPriceSum", name);
					session.close();
					return result;
				} //orderPriceSum()		
}
