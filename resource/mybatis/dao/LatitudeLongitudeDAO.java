package mybatis.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.dto.BoardDTO;
import mybatis.dto.GradeDTO;
import mybatis.dto.LatitudeLongitudeDTO;
import mybatis.dto.OrdersDTO;
import mybatis.dto.PortDTO;
import mybatis.dto.SearchDTO;
import mybatis.dto.tblCommentDTO;

public class LatitudeLongitudeDAO {
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
	
	//아이디별 위도와 경도 저장 
	public int LatitudeLongitudeInsert(LatitudeLongitudeDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int succ = session.insert("LatitudeLongitudeInsert", dto);
		session.commit();
		session.close();
		return succ;
	} //LatitudeLongitudeInsert()
	
			//아이디 값에 따른 위도 출력
			public LatitudeLongitudeDTO LatitudeLongitudeSelect(String id) {
				SqlSession session = sqlMapper.openSession();
				LatitudeLongitudeDTO dto = null;
				dto = session.selectOne("LatitudeLongitudeSelect", id);
				session.close();
				return dto;
			} //LatitudeLongitudeSelect()
			
			
			//아이디 값에 따른 위도 출력
			public String LatitudeLongitudeSelectTest(String id) {
				SqlSession session = sqlMapper.openSession();
				String dto = null;
				dto = session.selectOne("LatitudeLongitudeSelectTest", id);
				session.close();
				return dto;
			} //LatitudeLongitudeSelectTest()
	
} //class 