# 제목 : ajax와 submit 정리

* 내가 생각한 ajax란?
  * 서버에 데이터를 요청하는 것

* **ajax 정의** 
  * **비동기**적인 웹 어플리케이션의 제작을 위해 아래와 같은 조합을 이용하는 웹 개발 기법이다.
    * 표현 정보를 위한 HTML과 CSS
    * 동적인 화면 출력 및 표시 정보와의 상호작용을 위한 DOM, 자바 스크립트
    * 웹 서버와 **비동기적으로 데이터를 교환하고 조작**하기 위한  XML, XSLT, XMLHttpRequest
* 기존 기술(폼 태그)과의 차이점
  * 기존의 웹 애플리케이션은 브라우저에서 폼을 채우고 이를 웹 서버로 제출(submit)을 하면 하나의 요청으로 웹 서버는 요청된 내용에 따라서 데이터를 가공하여 새로운 웹페이지를 작성하고 응답으로 되돌려준다. 그런데 받은 결과페이지는 일반적으로 유사한 내용을 가지고 있는 경우가 많다. 즉 **중복되는 HTML 코드**를 다시 전송받으면서 많은 대역폭을 낭비하게 된다. 
  * 반면에 Ajax 애플리케이션은 **필요한 데이터**만을 웹서버에 요청해서 받은 후 클라이언트에서 데이터에 대한 처리를 할 수 있다. 웹 서버에서 전적으로 처리되던 데이터 처리의 일부분이 클라이언트 쪽에서 처리 되므로 웹 브라우저와 웹 서버 사이에 교환되는 데이터량과 웹 서버의 데이터 처리량도 줄어들기 때문에 응답성도 좋아진다. 또한 웹서버의 데이터 처리에 대한 부하를 줄여주기 때문에 전체적인 웹 서버 처리량도 줄어들게 된다.



* **장점**
  * 페이지 이동없이 고속으로 화면을 전환 가능
  * 서버 처리를 기다리지 않고, 비동기 요청이 가능
  * 수신하는 데이터 양을 줄일 수 있고, 클라이언트에게 처리 위임 가능
* **단점**
  * ajax를 쓸 수 없는 브라우저에 대한 문제가 있다.
  * HTTP 클라이언트의 기능이 한정되어 있다.
  * 페이지 이동없는 통신으로 인한 보안상의 문제
  * 지원하는 Charset이 한정되어 있다.
  * 스크립트로 작성되므로 디버깅이 용이하지 않다.
  * 요청을 남발하면 역으로 서버 부하가 늘 수 있음.
  * **동일-출처 정책**으로 인해 다른 도메인과는 통신이 불가능하다.



참고한 사이트 출처 : ['링크'](https://ko.wikipedia.org/wiki/Ajax)



* ajax에 쓰이는 것들
  1. url : ajax요청을 보내는 곳
  2. type : GET or POST
  3. succes : 요청 성공 시 수행
  4. error : 요청 실패 시 수행
  5. data : 요청을 보낼 때 같이 담는 값



* submit

  * 난 submit을 데이터를 전송하는 것이라 알고있음.

  * '제출하다' 라는 의미를 가짐
  * 폼 태그 안에 담겨있는 데이터들을 전달하는 것

  1. form
  2. action = url
  3. method = type
  4. 데이터

  ajax랑 형태가 비슷하단 것을 알 수 있음




* Ajax vs Submit
  * submit은 보고있는 페이지(데이터)를 전송하고 응답(페이지)를 기달린다.
  * ajax는 데이터를 보내고, 응답(데이터)를 받을 수 있다.
  * 응답할 데이터가 굳이 페이지 전부일 필요가 없을 땐 ajax로 데이터만 받는것이 좋다.

---

#### 키워드

* **json**

  * 내가 생각한 Json은 **데이터 표현 형식**중 하나라고 생각함.

  * JSON (JavaScript Object Notation)은 경량의 DATA-교환 형식이다.

  * 사람이 읽고 쓰기에 용이하며, 기계가 분석하고 생성함에도 용이하다.

  * 완벽하게 언어로 부터 독릭접이지만 프로그래머들에게 친숙한 관습을 사용하는 텍스트 형식이다. 이러한 속성들이 JSON을 이상적인 DATA-교환 언어로 만들고 있다.

  * name/value 형태의 쌍으로 collection 타입

    ![error](https://t1.daumcdn.net/cfile/tistory/21196E4256B3F1FA05) 

* **dom** 

  * 문서 객체 모델

  * 문서 객체란 <html>이나 <body> 같은 html문서의 태그들을 JavaScript가 이용할 수 있는 객체(object)로 만들면 그것을 문서 객체라고 한다.

  * 넓은 의미로 웹브라우저가 HTML 페이지를 인식하는 방식을 의미

    ![error](https://poiemaweb.com/img/traversing.png) 

  * 참고한 사이트 : ['링크'](https://m.blog.naver.com/PostView.nhn?blogId=magnking&logNo=220972680805&proxyReferer=https%3A%2F%2Fwww.google.co.kr%2F)

* **collback**

  * 자바스크립트 비동기 처리 방식에 의해 야기될 수 있는 문제들을 해결할 수 있는 함수

  * 콜백 함수를 사용하면 특정 로직이 끝났을 때 원하는 동작을 실행시킬 수 있다.

    ![error](https://t1.daumcdn.net/cfile/tistory/1435CD454EAFAEC828) 

  * 참고한 사이트 : ['링크'](https://joshua1988.github.io/web-development/javascript/javascript-asynchronous-operation/)

* **비동기** 

  * 해야 할 일을 위임하고 기다리는 방식

    ~~~java
    var fs = require('fs');
    console.log(2); // 실행순서 1
    fs.readFile('data.txt', {encoding: 'utf8'}, function(err, data){
      console.log(3); // 실행순서 3
      console.log(data); // 실행순서 4
    })
    console.log(4); // 실행순서 2
    ~~~






