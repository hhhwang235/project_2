package mybatis.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.dto.BoardDTO;
import mybatis.dto.CartDTO;
import mybatis.dto.OrderDetailDTO;
import mybatis.dto.OrdersDTO;
import mybatis.dto.PortDTO;
import mybatis.dto.SearchDTO;

public class OrdersDAO {
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
	
	//주문목록 DB에 저장
			public int ordersInsert(OrdersDTO dto) {
				SqlSession session = sqlMapper.openSession();
				int succ = session.insert("ordersInsert", dto);
				session.commit();
				session.close();
				return succ;
			} //ordersInsert()
	
			
			
} //class 