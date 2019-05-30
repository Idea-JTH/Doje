## EmpInsertServlet

####  jsp에서 받아온 사원 이름과 전화번호, 부서명을 DTO에 담은 뒤 모델 단으로 보내 DB에 저장시키기 위한 MVC2 모델의 컨트롤러입니다.



* EmpInsertServlet 전체 코드

~~~java
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		
		EmpEntity entity = new EmpEntity();
		entity.setEname(request.getParameter("ename"));
		entity.setPhone(request.getParameter("phone"));
		entity.setDept(request.getParameter("dept"));

		EmpBiz biz = new EmpBiz();
		int n = 0;
		try {
			n = biz.insertEmp(entity);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(n>0) {
			response.sendRedirect("/log/list");
		}else {
			response.sendRedirect("/log/emptest/empInsert.jsp");
		}
~~~

1. jsp 에서 사원 정보를 입력받음
2. servlet에서 입력 받은 사원정보를 DTO에 저장
3. DTO에 set된 정보를 DB에 저장

###### 코드 안의 Entity는 DTO의 역할을 함.



* 주요단어
  * Parameter
    * 페이지와 페이지 간의 정보중 다음 페이지를 읽어 들일때 필요한 정보를 주고 받는 것을 의미한다.
    * DataBase의 정보를 요청 하거나, 중요한 Logic을 사용하기 위한 인자 값으로서 사용되기도 한다.
  * getParameter
    * 파라미터에 대한 값을 가져오게 해주는 메소드
  * DTO
    * 데이터 전송 객체(Data Transfer Object)
    * 각 계층간 데이터 교환을 위한 객체
  * set
    * 객체에 값을 주입시키는 것
  * MVC2모델
    * 모델, 뷰, 컨트롤러의 크게 3가지 영역으로 구분하고 영역간의 상호 결합도를 최소화하여 재사용, 확장 가능한 프레임워크의 기반이 되는 구조적 패턴
    * ![error](https://t1.daumcdn.net/cfile/tistory/211CD3395407EF5826) 



* 잘 모르겠는 것들
  * 아직 MVC2 모델(패턴)의 정의를 잘 이해하지 못한 것 같다.
  * MVC2 모델을 설명하라 하면 그저 모델, 뷰, 컨트롤러로 나눈 것이라고 밖에 설명할 수 없을 것아 잘 모르겟다.