## 2018/12/26 프로젝트 업로드

* 현재 작동되는 기능
  * 회원가입, 로그인(Ajax)
  * 에러 발생시 에러 페이지로 이동 후 메세지 출력
* 이후 할 것
  * 현재 이슈들 수정



## 2019/1/2 패치노트

* 현재 작동되는 기능
  * 업로드 시와 동일
* 패치사항
  * 없음, 이슈 해결하는 중
* 이후 패치 계획
  * 최대한 빨리 이슈 해결



## 2019/1/9 패치노트

* 현재 작동되는 기능
  * 이전 패치와 동일
* 패치사항
  * 상단 nav바 로그인/로그아웃 옆에 로그인시 자신의 닉네임 표시됨
  * 이미 로그인되있는데 주소창을 통하여 로그인 페이지에 접근하려 할 때 세션확인 후 값이 있으면 전페이지로 강제이동시킴
  * 저번 패치 때 이슈사항이었던 데이터베이스 한글 저장 오류와 세션 확인 오류가 모두 해결됨
* 이후 패치 계획
  * 이슈 해결
  * 게시판 기능 활성화
  * footer 디자인 제작



## 2019/1/16 패치노트

* 현재 작동되는 기능
  * 이전 패치와 동일
* 패치사항
  * 현재 디비 접속 중 오류 발생으로 인해 작업을 진행하는데 차질이 발생
  * 이번 주 내내 학교 방과후로 인해 시간도 부족하여 이번 패치는 저번과 동일
  * footer 디자인 제작 완료
* 이후 패치 계획
  * 이슈 해결
  * 서버 오류 완벽하게 해결하고 원인에 대하여 정확히 파악하기
  * 저번 패치와 동일하게 게시판 기능 활성화 집중하기
  * 상단 nav바 색상을 메인 컨텐츠와 어우러지는 색상 찾은 후 교체하기<br> 

## 2019/1/23 패치노트

* 현재 작동되는 기능
  * 이전 패치와 동일
  * 곧 글쓰기,수정,삭제,보기 기능 활성화
* 패치 사항
  * footer삽입
  * db오류 해결
  * 글쓰기 페이지 디자인 완료 (tinyMCE 무료 에디터를 사용하여 글쓰는 부분에 적용시킴)
  * 헤더 nav 디자인 변경 (ajax 로그인을 상단 nav 바에 위치시킴)
  * 다른 view페이지들도 약간씩 변경
* 이후 패치 계획
  * 프로필 이미지 구현
  * 게시판에서 이미지 업로드 기능 구현
  * 게시판 기능 활성화
    * 먼저 자유게시판과 공지 게시판 활성화
    * 강아지 종 별 게시판은 추후에 작업



## 2019/1/30 패치노트

* 현재 작동되는 기능
  * 이전 패치에서 변경된 기능
    * 상단 nav 바 로그인 폼은 ajax형식으로, 원래 있던 로그인 페이지의 로그인 폼은 일반 submit형식으로 함
    * 자유게시판 글쓰기
    * 자유게시판 글목록 보기
* 패치 사항
  * 자유게시판 한정 글쓰기 글 목록 보기 가능
  * 상단 nav 바에서 로그인 가능 (로그인 실패시 원래 로그인 페이지로 이동)
  * 새로운 db테이블 생성 
  * 게시판 쿼리를 동적으로 짜서 중복 코드 방지함
* 이후 패치 계획
  * 원래 프로필 이미지와 게시글 내 이미지를 중점으로 하였으나 기본적인 것들 먼저 하기로 함
    * 로그인 권한 체크
      * 로그인 되어있지 않으면 글을 작성할 수 없음
      * 수정,삭제 또한 당연히 권한 없음
    * 회원가입시 중복체크
      * 중복 아이디, 이메일 체크
      * 전화번호 같은 경우는 나중에 더 공부해서 본인 인증을 따로 해보려 함
  * 게시판 기능 활성화



## 2019/2/13

* 현재 작동되는 기능
  * 전패치랑 동일
* 패치 사항
  * 회원가입 벨리데이션 기능 추가(정규표현식)
  * 회원가입을 기존에는 ajax로 제출하였으나 submit으로 바꿈
    * 아이디나 닉네임 중복체크 같은 경우는 ajax처리
  * 정규식 표현 검사 결과에 대한 시각적 요소 bootstrap으로 처리
* 이후 패치 계획
  * 명절과 가족 여행이 겹쳐서 저번주는 시간이 없었지만 다음주부턴 확실하게 결과가 보이도록 할 생각
  * 일단 자바스크립트를 통하여 클라이언트단에서 회원가입 검증을 함 하지만 서버단에서도 검증을 할 계획
  * 저저번주에 적어놨던 것처럼 검증 기능이 완성되면 권한 기능도 만들것임



## 2019/2/20

* 현재 작동되는 기능
  * 이전 패치와 변경된 점
    * 회원가입시 성공, 실패 여부를 view 단에서 메세지로 보여줌
    * 클라이언트와 서버 두 곳에서 회원가입시 정규식 검증을 함
* 패치사항
  * 저번 패치에는 클라이언트 단에서만 검증을 함 하지만 클라이언트 검증은 브라우저에서 조작할 위험이 있음
  * 따라서 서버 단에서도 검증이 필요하다고 하여 서버 단에서 회원가입 폼 데이터들을 검증함
    * @Valid 어노테이션을 사용하여 간단하게 검증한뒤 BindingResult를 통해 오류 발생시의 로직 처리함.
  * 회원가입시 성공과 실패 여부를 view단에서 부트스트랩의 alert 클래스를 이용하여 메세지로 표현함.
    * RedirectAttribute 이용하여 리다이렉트한 페이지로 데이터를 담아보냄.
  * 회원가입시 전화번호의 정규식 표현 검증에서 오류가 발생하여 다음 업데이트까지 비활성화 함.
  * 헤더 부분 nav안에 있는 ajax로그인에 오류가 있어 컨트롤러와 jquery부분 수정하여 해결함.
* 이후 패치 계획
  * 게시판 이미지 업로드 해결
  * 게시판 필터링 적용
    * 게시판 글에 스크립트를 적을 수 없도록 필터링하기
    * 게시판 제목에도 동일
  * 게시판 글 보기 완성



## 2019/2/27

* 현재 작동되는 기능
  * 이전 패치와 변경된 점
    * 자유게시판 완성 및 활성화
    * 자유게시판 글쓰기 검증 기능
    * 자유게시판 페이지네이션
* 패치사항
  * 자유게시판에서 활동할때 필요한 로그인 권한을 모두 체크함
    * 글 쓰기 접속할 시 로그인 체크
    * 글 삭제 및 수정 할 시 작성자 동일 체크
    * 글 작성 후 submit 시에 서버단에서 한번 더 권한 체크 및 검증
  * 자유게시판에서 이제 검색기능 사용 가능
  * 자유게시판에서 글을 쓸때 값이 비어있나 확인
  * 자유게시판 글 목록을 보는 페이지에서 작성일 표시형식 변경
    * 현재 날짜와 글 작성 날짜가 같을 경우 시간과 분만 표시
    * 그 외엔 년도와 월 일 만 표시
  * 자유게시판 글목록 테이블 디자인 변경
    * 가독성 높임
    * 페이지네이션을 통해 한 페이지당 10개의 글을 보여줌
    * 한 페이지당 챕터 수는 5개
  * 이후 패치 계획
    * 공지사항 활성화
    * 게시판 필터링 적용
    * 이미지 이슈 해결 후 메인 기능 완성

