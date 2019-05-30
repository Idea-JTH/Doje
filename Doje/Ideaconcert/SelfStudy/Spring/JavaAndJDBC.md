#### 개요 : Java의 Object와 prepareStatement, ResultSet에 대한 복습

---

* Object Class란?
  * 모든 자바 클래스의 최상위 클래스 

  * 모든 자바 클래스들은 Object클래스를 상속 받는다.

    ![error](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7niP6OL9sI4Bc3x_uce_q4Y6jD4jDgCx_o8yurx0sywCNcJO5) 
* prepareStatement란?
  * Statement의 보안쪽 문제를 해결한 메소드

    * SQL 인젝션은 클라이언트의 입력값을 조작하여 서버의 데이터베이스를 공격할 수 있는 공격방식을 말한다.

      ![error!](https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory&fname=http%3A%2F%2Fcfile4.uf.tistory.com%2Fimage%2F1332AC354F6F3A40076C62) 

    * [관련 자료 나무위키](https://namu.wiki/w/SQL%20injection) 
  * Statement를 사용했을 때보다 빠른 퍼포먼스 제공

    * 캐시(cache) 사용여부가 가장 큰 차이점
* ResultSet이란?
  * DB에 Select쿼리문을 날렸을 때 반환받는 값을 저장하는 객체

  * 테이블 형태의 데이터로 받아옴

    Ex) ![error](http://tutorials.jenkov.com/images/java-jdbc/result-set-1.png) 

  * Next()메소드 주로 이용

