# 10월 24일 알고리즘

#### 1. 문자열 거꾸로 출력하기

* 해결해야 하는 점

  * 임의의 문자열을 거꾸로 출력하여야 한다. Ex) 가나다라 -> 라다나가

* 수도코드

  ~~~java 
  임의의 문자열 생성
  임의의 배열 생성
  배열에 문자열을 한글자씩 쪼개서 삽입
  <반복문 시작>
  	문자열의 길이 -1 부터, 0이될때까지 실행
  	배열 출력
  <반복문 끝>
  ~~~

* 실제 코드화

  ~~~java
  public class Reverse {
  	public static void main(String args[]) {
  		String str = "로꾸꺼"; //임의의 문자열
  		String[] arr;	//임의의 String형 배열
  		arr = str.split("");	//str을 한글자씩 쪼개서 arr에 삽입
  		
  		for(int i = str.length()-1; i>=0; i--) {	//i가 배열의 길이 -1부터 시작
  			System.out.print(arr[i]);	//배열 출력
  		}
  	}
  }
  ~~~

<br>

---

<br>

#### 2. 중복된 무자열 제거 후 출력

* 해결해야 하는 점

  * 임의의 문자열에서 중복된 값을 제거하고 출력해야 한다. Ex) abbccd -> abcd

* 수도코드

  ~~~java
  임의의 문자열 생성
  임의의 배열 생성 후 문자열의 한글자씩 삽입
  임의의 ArrayList 생성
  
  <반복분 시작>
  	0부터 arr배열 길이만큼 실행
  	arr에 있는 값을 ArrayList에 담음
  <반복문 끝>
      
  ArrayList에 TreeSet시킴
  
  <반복문 시작>
  	ArrayList길이만큼 실행
  	ArrayList값 출력
  <반복분 끝>
  ~~~

* 실제 코드화

  ~~~java
  import java.util.ArrayList;
  import java.util.List;
  import java.util.TreeSet;
  
  public class AlreadyWord {
  
  	public static void main(String[] args) {
  		String str = "aabbcccddd";		//임의의 문자열
  		String[] arr = str.split("");	//임의의 String형 배열
  		List<String> list = new ArrayList<String>();	//임의의 String형 ArrayList
  		
  		for(int i = 0; i<arr.length; i++) {
  			list.add(arr[i]);	//List에 값 삽입
  		}
  		
          //TreeSet은 내부적으로 오름차순정렬을 하며 Set은 기본적으로 중복된 값이 들어가지 않는다.
  		TreeSet<String> distinctData = new TreeSet<String>(list);	//TreeSet에 ArrayList값 삽입
          list = new ArrayList<String>(distinctData);	//중복이 제거된 TreeSet을 다시 ArrayList에 삽입
  	
          for(String word : list) {
          	System.out.print(word);	//list값 출력
          }
  	}
  }
  ~~~
