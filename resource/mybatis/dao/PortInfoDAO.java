package mybatis.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.dto.BoardDTO;
import mybatis.dto.PortDTO;
import mybatis.dto.PortInfoDTO;
import mybatis.dto.PortSelectDTO;
import mybatis.dto.SearchDTO;

public class PortInfoDAO {
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
	public List<PortInfoDTO> portInfoSelect() {
		SqlSession session = sqlMapper.openSession();
		List<PortInfoDTO> list = null;
		list = session.selectList("portInfoSelect");
		session.close();
		return list;
	} //portInfoSelect()
	
	
	//부분 목록 검색
		public List<PortSelectDTO> portInfoSelectCase(String subject) {
			SqlSession session = sqlMapper.openSession();
			List<PortSelectDTO> list = null;
			list = session.selectList("portInfoSelectCase", subject);
			session.close();
			return list;
		} //portInfoSelectCase()
	
} //class 