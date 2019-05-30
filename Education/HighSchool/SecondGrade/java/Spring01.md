# Spring01

#### 이론 설명

* 프레임 워크란(Framework)?
  * 어떠한 목적을 달성하기 위해 복잡하게 얽혀있는 문제를 해결하기 위한 구조
    * 어떠한 목적이란?
      * 코드 품질 보장
      * 유지보수성
      * 언어의 표준화 등등
  * 소프트웨어 개발에 있어 하나의 뼈대 역할을 함
* 라이브러리란(library)?
  * 재사용이 필요한 기능으로 반복적인 코드 작성을 없애기 위해 언제든지 필요한 곳에서 호출되여 사용할 수 있도록 클래스나 메소드로 만들어진 것.
  * 소프트웨어 개발에 쓰이는 하부 프로그램들의 모임
* Spring의 특징
  * **경량 컨테이너**로 자바 객체를 직접 관리

    * 컨테이너는 보통 인스턴스의생명주기를 관리하며, 생성된 인스턴스들에게 추가적인 기능을 제공하도록 하는 것

  * **POJO**(Plain Old Java Object)방식의 프레임워크

    * POJO를 이용한 애플리케이션 개발이 가진 특징과 장점을 그대로 살리면서 EJB에서 제공하는 엔터프라이즈 서비스와 기술을 그대로 사용할 수 있도록 도와주는 프레임 워크
    * **특징** 
      * **POJO** : 번역하면 '평범한 구식 자바 객체'
      * 특정 규약(contract)에 종속되지 않는다.(Java 언어와 꼭 필요한 API 제외)
      * 특정 환경에 종속되지 않는다.
      * 객체지향원리에 충실해야 함.
    * **사용 이유** 
      * 코드의 간결함
      * 자동화 테스트에 유리
      * 객체지향적 설계이 자유로운 사용

  * **제어 반전**(IOC)를 지원

    * 제어의 역전 즉 외부에서 제어를 한다는 것이다.
    * 컨테이너이다
    * 객체의 생성에서부터 생명주기의 관리까지 모든 객체에 대한 제어권이 바뀌었다는 것(IOC 컨테이너)을 의미 한다.

  * **의존성 주입**(DI)을 지원

    * 각 계층 사이, 각 클래스 사이에 필요로 하는 의존 관계를 컨테이너가 자동으로 연결해주는 것
    * 각 클래스 사이의 의존 관계를 빈 설정(Bean Definiton) 정보를 바탕으로 컨테이너가 자동으로 연결해 주는 것

  * IOC와 DI의 관계

    * 다음 그림과 같이 IOC와 DI간의 관계를 분류하는 것이 일반적

      ![error](https://t1.daumcdn.net/cfile/tistory/2602CF485795AD1205) 

  * **관점 지향 프로그래밍**(AOP)를 지원

    * DI가 낮은 결합도를 위한 것이라면 AOP는 높은 응집도를 위한 것

    * 애플리케이션 전체에 걸쳐 사용되는 기능을 재사용하도록 지원

    * 인흐라 혹은 부가기능의 모듈화

    * 쉽게 얘기하면 프로젝트 구조를 바라 보는 **관점**을 바꾸자는 이야기

      ![error](https://img1.daumcdn.net/thumb/R1920x0/?fname=http%3A%2F%2Fcfile3.uf.tistory.com%2Fimage%2F2473C33D58496A2A0F6DF9) 

  * 확장성이 높음<br> 
* gradle이란?
  * Groovy를 이용한 빌드 자동화 시스템
  * 현재 안드로이드 앱을 만드는데 필요한 안드로이드 스튜디오의 공식 빌드 시스템이기도 함.
  * Java, C/C++, Python 등과 같은 여러 가지 언어를 지원한다.
* mybatis란?
  * 자바의 관계형 데이터베이스 프로그래밍을 도와주는 프레임워크

  * JDBC(자바에서 제공하는 데이터베이스 프로그래밍 API)보다 좀 더 편하게 사용하기 위해 개발됨.

  * 어떤 프로그래밍 언어로도 구현이 가능하다.

  * SQL문이 애플리케이션 소스 코드로부터 완전하게 분리된다.<br>  

    ![error](https://t1.daumcdn.net/cfile/tistory/2178E54A574D487335) 

    * 연결한 DB에 대한 정보를 서술하는 xml이다.

    * 우리가 사용할 sql문들을 Mapper에 등록해놓고선 편리하게 나중에 sqlSession을 통해서 불러다가 쓰면 훨씬 편리할 것이다. 이런것들을 해줄 수 있는 것이 **Mapper**의 역할

      * 예제 소스(insert 문)

        ~~~java
        <?xml version="1.0" encoding="UTF-8"?>
         <!DOCTYPE mapper     
         PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"     
         "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
         
        <!--  매퍼파일에 sql문 등록하기! -->
         
         <mapper namespace="dao.deptMapper">
        <!--mapper은 우리가 사용할 sql문들을 등록해두고 나중에 sqlSession을 통해서 불러다 쓸꺼 -->
         
            <insert id="insertDept" parameterType="dept">
            insert into dept values(#{deptno}, #{dname}, #{dloc})
        <!--  mapper에 대한 식별자로 insertDept에 대한 정확한 식별자는 dao.deptMapper임 -->
            </insert>
        ~~~


#### 스프링 예제 코드

~~~java
package com.test1.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test1.service.TestService;
import com.test1.vo.ListVo;
import com.test1.vo.TestVo;

@Controller
public class TestController {

	@Autowired
	TestService testService;
	
	@RequestMapping("/test")
	public String asd(HttpServletRequest request) {
		return "/test";
	}
	
	@RequestMapping(value="/hello" , method= RequestMethod.GET)
	public String hi() {
		System.out.println("hi guys~ How are you?");
		
		return "";
	}
	
	@RequestMapping(value="/formtag", method = RequestMethod.POST)
	public String yaho() {
		System.out.println("폼 태그 입니다.");
		
		return "/formtest";
	}
}
~~~

* 코드 설명
  * @Controller를 사용해 해당 클래스를 웹 요청을 받는 클래스라고 명시함
  * @RequestMapping을 사용해 컨트롤러가 처리할 요청 URL을 명시함
  * Ex) /formtag POST로 요청 시
    * "폼 태그 입니다" 출력

    * "/formtest"를 반환함

      * 반환된 "/formtest"는 이 코드를 거치게 된다.

        ~~~java
        public ViewResolver getViewResolver() {
                System.err.println("viewResolver");
                InternalResourceViewResolver resolver = new InternalResourceViewResolver();
                resolver.setPrefix("/WEB-INF/views");	//앞에 붙음
                resolver.setSuffix(".jsp");	//끝에 붙음
                return resolver;
            }
        ~~~

      * 그 결과 최종적으로 **"/WEB-INF/views/formtest.jsp"** 로 반환되며 이 주소를 찾아 jsp파일을 로드하게 된다.

* 결론

  * 스프링 프레임워크는 컨테이너로 자바 객체를 직접 관리하며 POJO, IoC, DI, AOP 등의 기능들을 지원한다.
  * 스프링 프레임워크를 사용하면 이런 URL매핑도 간단하게 할 수 있다.
  * ~~어노테이션을 이용해 편리하게 개발할 수 있다.~~  (필자가 설명 불가, 단순히 명시하는 용도로 쓰이는 거라 생각하고 있어서 서블릿의 어떤 기능을 대체하는지 설명하질 못함.)