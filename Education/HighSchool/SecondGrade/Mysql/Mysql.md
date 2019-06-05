# Mysql

[mysql homepage](https://www.mysql.com)

---

![error](https://cdn-images-1.medium.com/max/1600/0*AhVo_3sCq-ft64ki.jpg)



현재 DB최적화에 대해서 배우고 있다. 하지만 그 데이터베이스의 성능을 향상시키려면 기본적으로!

내가 사용하고 있는 [DBMS]([https://ko.wikipedia.org/wiki/%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B2%A0%EC%9D%B4%EC%8A%A4_%EA%B4%80%EB%A6%AC_%EC%8B%9C%EC%8A%A4%ED%85%9C](https://ko.wikipedia.org/wiki/데이터베이스_관리_시스템))의 구조를 파악하는게 먼저 할 일이라고 생각했다. 그래서 이번엔 현재 사용하고 있는 Mysql의 구조에 대해 먼저 쓰기로 했다.



일단 들어가기에 앞서 Mysql은 세계 3대 dbms중 하나이며 공짜이다!(물론 혜택이 유료버전에 비해 없는 수준) 현재 오라클 사가 관리하고 있다. 상징 동물은 돌고래!



### Mysql 아키텍처

*  Mysql 전체 구조

  ![error](https://t1.daumcdn.net/cfile/tistory/26219B435902D88522)

  * **Mysql 서버**는 크게 **Mysql 엔진과 스토리지 엔진**으로 구분해서 볼 수 있다.
    * Mysql 엔진은 커넥션 핸들러, SQL파서 및 전처리기, 옵티마이저가 중심을 이룬다.
      * 커넥션 핸들러 : Client로 부터의 접속과 쿼리 요청을 처리
      * SQL파서 : 요청으로 들어온 쿼리 문장을 토큰으로 분리해 트리 형태 구조로 만들어냄
      * 전처리기 : 파서에서 만들어진 파서 트리 기반으로 쿼리 문장에 구조적인 문제점 확인, 각 토큰을 테이블 이름이나 컬럼 이름 또는 내장 함수와 같은 객체를 매핑해 실제 존재여부 확인 및 접근권환 등을 확인
      * 옵티마이저 : 쿼리 문장을 가장 빠르게 처리하기 위한 실행계획을 만듬<br> 
    * Mysql 엔진은 요청된 SQL 문장을 분석하거나 최적화하는 등 DBMS의 두뇌에 해당하는 처리를 수행하고, 실제 데이터를 디스크 스토리지에 저장하거나 디스크 스토리지로부터 데이터를 읽어오는 부분은 스토리지 엔진이 전담한다.
      * Mysql 서버에서 Mysql 엔진은 하나지만 스토리지 엔진은 여러 개를 동시에 사용할 수 있다. **테이블이 사용할 스토리지엔진을 지정하면 이후 해당 테이블의 모든 읽기 작업이나 변경 작업은 정의된 스토리지 엔진이 처리한다.**<br> 
    * **핸들러API**
      * MySQL 엔진의 쿼리 실행기에서 데이터를 쓰거나 일어야 할 때는 각 스토리지 엔진에게 쓰기 또는 읽기를 요청하는데, **이러한 요청을 핸들러(Handler) 요청** 이라고 하고, 여기서 사용되는 API를 핸들러 API라고 한다. InnoDB 스토리지 엔진 또한 이 핸들러 API를 이용해 Mysql엔진과 데이터를 주고받는다.<br> 
    * **캐시 & 버퍼**
      * 성능 향상을 위해 MyISAM의 키 캐시나 InnoDB의 버퍼 풀과 같은 보조 저장소 기능을 포함



### Mysql 실행 순서 

1. SQL 요청
2. 쿼리파서 -> 전처리기 -> 옵티마이저
3. 쿼리실행기
4. 스토리지 엔진
5. 디스크스토리지 or 메모리
6. SQL 결과 반환

----

### 쿼리 성능 진단

* 쿼리 실행 계획 : [링크1](<https://multifrontgarden.tistory.com/149>), [링크2](<https://multifrontgarden.tistory.com/151?category=471242>)

  * 쿼리 앞에 EXPLAIN 키워드를 붙이면 실행 계획을 확인 할 수 있다.

  * ~~~mysql
    EXPLAIN SELECT * FROM test;
    ~~~

    * 결과(예제 테이블을 조회한 예시임 무조건 이렇게 나오지 않음!)

      | <center>id</center> | <center>select_type</center> | <center>table</center> | <center>type</center> | <center>possible_keys</center> | <center>key</center> | <center>key_len</center> | <center>ref</center> | <center>rows</center> | <center>Extra</center> |
      | :-----------------: | :--------------------------: | :--------------------: | :-------------------: | :----------------------------: | :------------------: | :----------------------: | :------------------: | :-------------------: | :--------------------: |
      |        **1**        |   <center>SIMPLE </center>   |          test          |          ALL          |              NULL              |         NULL         |           NULL           |         NULL         |         행 수         |                        |

  * 실행 계획은 일반 조회 쿼리 처럼 테이블 형태로 출력된다.<br> 

* WHERE 조건 이해

  * 묵시적 형변환

    * 정의 : 조건절의 데이터 타입이 다를 때 우선순위가 높은 타입으로 자동 형변환 되는 것

    * 문자열과 정수값을 비교하면, 우선순위가 낮은 문자열은 자동으로 정수 타입으로 형변환된다.

      ~~~mysql
      create table test(
      inti int unsigned not null auto_increment,
      intj int unsigned not null,
      str varchar(64) not null,
      d datetime not null,
      primary key(inti)
      );
      
      alter table test add key(intj), add key(str), add key(d);
      
      insert into test(intj, str, d)
      values(
      	crc32(rand()),
          crc32(rand()*12345),
          date_add(now(), interval -crc32(rand())/5 second)
      );
      
      INSERT INTO test(intj, str,d)
      SELECT
      	crc32(rand()),
          crc32(rand())*12345,
          date_add(now(), interval -crc32(rand())/5 second)
      FROM test;
      ~~~

    * 위 코드를 17번 실행하면 약 1만건 row가 insert됨

    * 위 쿼리문 이해하기

      * test테이블 생성
      * crc32를 이용한 8자리 수를 값으로 삽입  [crc32란?](<https://12bme.tistory.com/395>)
      * insert into select 구문을 이용하여 테이블의 값을 계속 복사해나감. (1 -> 2 -> 4 -> 8 ...)

    * 실행계획에서 intj를 문자열과 정수형으로 검색한 경우

      ![error](https://user-images.githubusercontent.com/39946822/58929998-a682a480-8794-11e9-9ced-e742bedf60c8.png)

      * 모두 동일하게 인덱스를 타며 검색하는 것을 알 수가있다.

    * 실행계획에서 str을 문자열로 검색한 경우

      ![error](https://user-images.githubusercontent.com/39946822/58930105-11cc7680-8795-11e9-842c-052b210db78b.png)

      * 인덱스를 타며 빠르게 검색한다.

    * 실행계획에서 str을 정수형으로 검색한 경우

      ![error](https://user-images.githubusercontent.com/39946822/58930154-44766f00-8795-11e9-876f-8c20135e13f6.png)

      * 인덱스를 타지 못해 테이블 전체를 검색하여 비효율적으로 검색한다는것을 알 수 있다.

    * 위의 결과가 나오는 이유

      * intj
        * 원래 정수형이었던 intj를 문자열로 검색했을 시에 데이터 타입 우선순위가 높은 정수형으로 자동 형변환 되기 때문에 아무 문제 없이 인덱스를 따라 검색한다.
      * str
        * 원래 문자열인 str를 문자열로 검색했을 시엔 문제가 없지만 정수형으로 검색했을 시에 문제가 발생한다. 정수형이 문자열보다 우선순위가 높기 때문에 문자열로 자동 형변환이 되지 않아 str인덱스를 따라 검색하지 못하고 테이블 전체를 검색하는 매우 비효율적인 검색을 하게된다.

---

### 용어 찾아보기

* BNL(Block Nested Loop)	:	[링크](<http://blog.naver.com/PostView.nhn?blogId=parkjy76&logNo=221069454499&categoryNo=14&parentCategoryNo=0&viewDate=¤tPage=1&postListTopCurrentPage=1&from=postView>)

  * MySQL이 BNL을 제공하는 이유는 Nested Loop 조인만 지원하는 한계점을 보완하기 위해서이다.
  * BNL 방식은 프로세스 내에 별도의 버퍼 (이를 조인 버퍼라고 한다)에 Driving 테이블의 레코드를 저장한 후에 Inner 테이블을 스캔하면서 조인 버퍼를 탐색하는 방식이다.
  * Nested Loop 방식보다 빠르긴 하지만 Oracle의 Hash join이나 Sort Merge join 보다는 턱없이 느리다...

* 클러스터 인덱스	:	[링크](<https://mongyang.tistory.com/75>)

  * 간단한 비유로  책 뒤쪽에 위치하는 '찾아보기'를 예로 들 수 있다. (찾고자 하는 값을 쉽게 찾음)
    * 특징
      * 검색속도향상 : 시스템 부하 줄여 시스템 전체 성능 향상
      * 인덱스를 위한 추가 공간 필요
      * 생성에 시간 소요 될 수 있음
      * **INSERT, UPDATE, DELETE**가 자주 발생한다면 성능 크게 저하 우려 
    * 종류
      * 클러스터형 인덱스(Clustered Index)
        * 테이블 당 한개 만 생성 가능 예를 들어 PRIMARY KEY
        * 행 데이터를 인덱스로 지정한 열에 맞게 자동 정렬한다.
        * 영어 사전처럼 책의 내용 자체가 순서대로 정렬 되있어 인덱스 자체가 책의 내용과 같음
      * 비클러스터형 인덱스(Nonclustered Index)
        * 테이블당 여러개를 생성할 수 있다.
        * 비클러스터형 인덱스는 그냥 찾아보기가 있는 일반 책과 같다.
    * 인덱스 생성
      * 인덱스는 열 단위로 생성된다.
      * 하나의 열에 인덱스를 생성할 수 있고, 여러 열에 하나의 인덱스를 생성할 수 있다.
      * 테이블 생성시 하나의 열에 **Primary Key**를 지정하면 자동으로 클러스터형 인덱스가 생성된다.
      * **Primary Key**를 지정하는 열에 강제적으로 비클러스터형 인덱스를 지정할 수 있다. 
      * 제약 조건 없이 테이블 생성시에 인덱스를 만들 수 없으며, 인덱스가 자동 생성되기 위한 열의 제약 조건은 **Primary Key**또는 **Unique** 뿐이다.<br> 

* 데이터품질에서 도메인   :  [링크](<http://blog.naver.com/PostView.nhn?blogId=new_magma&logNo=20038148095>)

  * 동일안 유형을 갖는 속성들의 집합
    * 동일한 유형이란 ID, 코드, ~명, ~값 등을 말함
      * 정의된 속성들을 비슷한 유형끼리 분류하는 것
      * 어떤 경우는 속성명을 쭉 나열하고 접미사 부분을 짤라서 공통된 것끼리 묶는 방법으로 도메인을 구분하기도 함.
        * 예를 들어 회원코드, 입력코드, 부서코드, 사원명, 회원명, 직군명 과 같은 속성이 있다고 하면...
          * 코드
            * 회원코드, 입력코드, 부서코드
          * ~명
            * 사원명, 회원명, 직군명
        * 이런 식으로 도메인을 추출함<br> 

* B트리  :  [링크](<https://m.blog.naver.com/eng_jisikin/220889188747>)

  * B Tree는 Balanced Tree로 균형을 유지하는 트리를 말한다.

    * 기존에 자식을 두개만 가질 수 있던 Binary tree(이전 트리)를 확장 하여 더 많은 자식을 가질 수 있게 고안한 것
    * 이진 트리는 추가, 검색, 삭제 등에 O(NlogN)의 시간 복잡도를 가지지만, 좌우 균형이 맞지 않을 때는 매우 비효율적.. 최악의 경우 O(N*N)의 시간 복잡도를 보여줌
    * B트리는 ORACLE과 같은 상용 DB에서 많이 사용하는 자료구조이며 외부검색에 유용하다고 알려져 있다.

  * B트리의 특징

    * 이진트리와 달리 하나의 노드가 여러 데이터를 가질 수 있다.

      ![error](https://mblogthumb-phinf.pstatic.net/MjAxNjEyMTlfODQg/MDAxNDgyMTAwODk5Mjg1.ksaw5018vgheRNvKrfFERgT9Qw0guceC52MdIrhvQqMg.LFdY6Vw9_9UzF3QsNLRXIGemD3brYalmN84TRi6rgpsg.PNG.eng_jisikin/11.png?type=w2)

      

  * 간단한 규칙들

    * 노드의 데이터 수가 N이면 자식의 수는 항상 N+1이어야 한다.
    * 노드 내의 데이터는 반드시 정렬된 상태여야 한다.
    * 노드의 데이터 X의 왼쪽 서브 트리는 X보다 작은 값들로 이루어져 있어야 하고 오른쪽 서브 트리는 X보다 큰 값들로 이루어져 있어야 한다.

