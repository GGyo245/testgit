package kr.co.fifa.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CURDDAO {
	
	@Autowired
	SqlSession session;
}
