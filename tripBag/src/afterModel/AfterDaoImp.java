package afterModel;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class AfterDaoImp implements AfterDao {
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession sqlSession;
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
}
