package memberModel;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MemberDaoImp implements MemberDao {
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession sqlSession;
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
}
