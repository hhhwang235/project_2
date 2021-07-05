package mybatis.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.dto.BoardDTO;
import mybatis.dto.PortDTO;
import mybatis.dto.SearchDTO;

public class PortDAO {
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
	public List<PortDTO> portAll() {
		SqlSession session = sqlMapper.openSession();
		List<PortDTO> list = null;
		list = session.selectList("portAll");
		session.close();
		return list;
	} //portAll()
	
} //class 