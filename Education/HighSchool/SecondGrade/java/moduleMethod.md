# 모듈화 적용시켜보자!

* getWebtoonInfo() 함수 : 제일 먼저 실행되는 함수

~~~java
/*
	 * 파라미터 없음 
	 * Object 형 ArrayList 반환
	 * select() 메소드를 실행시킨 뒤 받은 리턴값을 ArrayList에 저장 후 Jsp에 전달
*/
	public List<Object> getWebtoonInfo() {
		List<Object> list = new ArrayList<Object>();
		try {
			list = select();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}
		if (list == null) { // 검색된 값이 없을 때 즉, DB에 아무런 값이 없을 때 실행
			updateWebtoon();
		}
		System.out.println("실행중");
		return list;
	}
~~~



List 객체를 jsp로 보냄 

---



* select() 함수 : 두번째로 실행되는 함수

~~~java
/*
	 * 파라미터 값 없음
	 * Object 형 list 반환
	 * While() 메소드에 ResultSet객체를 담아서 실행 후 반환 된 list를 반환
*/
	public List<Object> select() {
		
		String condition = "";
		String tableName = this.getClassName(new WebtoonVO());
		String wheresql = makeWheresql(tableName,condition);
		
		System.out.println("start");
		String sql = "select * from " + tableName + wheresql + " ORDER BY week" ;

		Connection conn = JdbcUtil.getConnection();

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return whileRs(rs); // list로 반환
	}
~~~



select() 함수에서 sql쿼리문을 DB에 날리고 받은 결과값을 ResultSet객체에 담아 WhileRs()함수에 실어보냄

---



* whileRs(rs) 함수 : 세번째로 실행되는 함수( rs변수를 파라미터로 받음 )

~~~java
/*
	 * ResultSet 객체를 파라미터로 받음
	 * rs.next()메소드를 이용하여 추가한 list 반환
	 * rs.next()가 false가 될 때까지 getResultSet()메소드에 ResultSet객체를 실어서 실행시킴
	 */
	public List<Object> whileRs(ResultSet rs) {
		List<Object> list = new ArrayList<Object>();
		try {
			while (rs.next()) {
				try {
					list.add(getReusltSet(rs));
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
~~~



간단하게 list객체에 값들을 add시키는 기능을 하는 함수

---



* getResultSet(rs) 함수 : 네번째로 실행되는 함수( 마지막 단계이며 rs객체를 파라미터로 받음 )

~~~java
/*
	 * ResultSet 객체를 파라미터로 받음
	 * vo라는 WebtoonVO형 객체를 생성후 필드에 값을 set시켜서 반환함 
	 * WebtoonVO클래스 안에 있는 변수 목록들을 가져와 DB검색 값이 담겨있는 파라미터 rs를 set시키고 반환시킨다.
*/
	public WebtoonVO getReusltSet(ResultSet rs) {
		WebtoonVO vo = new WebtoonVO();
		for (Field f : vo.getClass().getDeclaredFields()) { // WebtoonVO의 필드 변수들을 가져온다.
			f.setAccessible(true); // private 변수들을 액세스 하기 위한 함수인 것 같다.
			String name = f.getName(); // name변수에 가져온 필드 변수 명들을 저장한다.
			try {
				f.set(vo, rs.getString(name));	// vo 변수들에 검색된 데이터들을 set시킴 
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		return vo; // set된 vo 객체 반환
	}
~~~



getResultSet함수는 데이터베이스에서 검색한 값들을 VO에 세팅시켜주는 함수이다.

getClass함수와 getDeclaredFields함수를 이용하여 vo클래스의 필드 변수명들을 쉽게 가져올 수 있다.

세팅된 vo를 반환시켜 whileRs 함수에서 리스트에 추가할 수 있게함.

---

* whereSql문 모듈화

~~~java
private String getClassName(Object ob) {
        return ob.getClass().getSimpleName().split("VO")[0];	//모든 테이블 이름이 VO를 뺀 클래스이름이라고 가정했을 때의 코드
    }
~~~

맨뒤의 VO를 뺀 클래스 이름 가져오는 메소드



~~~java
private String makeWheresql(String tableName, String condition) {	//condition은 특정 조건
		if(tableName.equals("Webtoon")) {
			if(condition.equals("id")) {
				return " where id = ?";
			}
			return "";
		}
		return null;
	}
~~~

가져온 클래스 이름과 특정 조건을 받아와서 where절을 만들어줌.





