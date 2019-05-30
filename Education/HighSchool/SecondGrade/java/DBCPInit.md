# Title : 커넥션 풀에 관한 코드



### 커넥션 풀이란?

데이터베이스와 연결된 커넥션을 미리 만들어서 풀(pool) 속에 저장해 두고 있다가 필요할 때 커넥션을 풀에서 쓰고 다시 풀에 반환하는 기법을 말한다.

![error](https://t1.daumcdn.net/cfile/tistory/2629B3375492CD3E10) 



* 예제 소스 (DBCPInit.java)

~~~java
package jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet {
	@Override
	public void init() throws ServletException {
		loadJDBCDriver();
		initConnectionPool();
	}
	
	private void loadJDBCDriver(){
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch (ClassNotFoundException ex){
			throw new RuntimeException("fail to load JDBC Driver", ex);
		}
	}
	
	private void initConnectionPool(){
		try{
			String jdbcURL = "jdbc:mysql://taejjang.iptime.org/project?useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Seoul";
			String dbUser = "root";
			String dbPass = "123456";
			
			//ConnectionFactory 객체를 만들어서 연결을 생성할 준비를 한다.
			ConnectionFactory cFactory 
				= new DriverManagerConnectionFactory(jdbcURL, dbUser, dbPass);
			//연결을 Pool로 만들어서 관리해줄 PoolableConnectionFactory생성
			PoolableConnectionFactory pcFactory 
				= new PoolableConnectionFactory(cFactory, null);
			//연결이 올바른지 테스트할 쿼리로 SELECT 1을 선언해둠
			pcFactory.setValidationQuery("SELECT 1");
			
			GenericObjectPoolConfig poolCfg = new GenericObjectPoolConfig();
			//연결 검사주기 5분으로 설정
			poolCfg.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			//idle상태일때 검사 실행
			poolCfg.setTestWhileIdle(true);
			//연결의 최소개수
			poolCfg.setMinIdle(4);
			//연결의 최대개수
			poolCfg.setMaxTotal(50);
			
			//위의 설정값을 pcFactory를 통해 풀을 생성함.
			GenericObjectPool<PoolableConnection> connPool 
				= new GenericObjectPool<>(pcFactory, poolCfg);
			//만들어진 풀을 pcFactory에 설정해줌.
			pcFactory.setPool(connPool);
			
			//해당 풀을 관리해줄 풀 드라이버를 만들고 거기에 이름과 풀을 연결해줌. 앞으로 jth 이란 이름을 DB풀에 접근 가능
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver pDriver 
				= (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			pDriver.registerPool("jth", connPool);
			
		} catch (Exception ex){
			throw new RuntimeException(ex);
		}
	}

}
~~~

1. JDBC Driver를 로드한다.
2. 자신의 DB랑 연결
3. 연결을 pool로 만들어서 관리해준다.
4. Pool 설정



* 중요한 키워드
  * pool
    * 수영장이란 뜻을 가지며 커넥션 객체들을 모아둔 곳을 pool이라 함.
  * Connection factory
    * Connection을 얻어오는 부분을 따로 클래스로 만들어 사용하는 것
    * ![error](http://cfs8.blog.daum.net/image/32/blog/2008/10/20/01/34/48fb6196b625b&filename=factory_jpg.JPG) 
  * getDriver
    * 드라이버를 로드하는 메소드<br> 
* 새로 알게된 지식
  * 사용자가 서버에 접근할 때마다 커넥션 객체를 생성하고 종료하는것은 매우 비효율적이다.
  * 위 JDBC의 비효율성을 해결하기 위해 만들어진것이 커넥션 풀(DBCP)이다.
    * 커넥션 풀은 풀에 미리 커넥션 객체들을 생성해 둔뒤 사용자가 서버에 접근할때마다 빌려쓴뒤 다시 반납하는 형식으로 사용자가 몰려도 웹 어플리케이션이 쉽게 다운되지 않는다를 장점이있다.



도움을 줄 수 있는 사이트 : ['링크'](http://devbox.tistory.com/entry/JSP-%EC%BB%A4%EB%84%A5%EC%85%98-%ED%92%80-1)