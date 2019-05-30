~~~java
package ideaconcert;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class OverLab {

	public static void main(String[] args) {
		// 정렬할 문자열
		String text = "jjjkkkwwaabbbbccqqqxxx";
		
		// 사용된 문자와 개수를 저장
		Map<Character, Integer> sMap = getCharCountMap(text);
		
		String sortString = sortString(sMap);
		System.out.println(sortString);
	}
	
	public static Map<Character, Integer> getCharCountMap(String text)
	{
		Map<Character, Integer> sMap = new HashMap<Character, Integer>();
		
		// 반복문을 통해, 사용된 문자와 개수 구하기
		for(int i = 0; i < text.length(); i++) {
			char key = text.charAt(i);
			
			// 이미 존재하는 key 라면 
			if(sMap.containsKey(key)) {
				// 예전에 등록된 개수 가져오기
				int cnt = sMap.get(key);
				
				// 현재 개수 + 1
				sMap.put(key, cnt + 1); 
			} else { // 아니라면, 개수를 1로 저장
				sMap.put(key, 1);
			}
		}
		return sMap;
	}
	
    public static String sortString(final Map<Character, Integer> sMap){

        String text = "";
        Iterator<Character> it = sMap.keySet().iterator();
        
		while(it.hasNext()) {
			text += it.next();	// key값 삽입
		}
	  //System.out.println(text);
		int length = text.length();
		for(int i = 0; i < length; i++) {
			for(int j = 0; j < length - 1; j++) {
			//	System.out.println(j + "\t" + (j + 1));
				char a1 = text.charAt(j);
				char a2 = text.charAt(j + 1);
			//	System.out.println("j :" + a1 + "\t" + "j + 1 : " + a2);
				
				if(sMap.get(a1) < sMap.get(a2)) {	//부호 반대로 하면 오름차순 정렬
					text = swap(text, j, j + 1);
				} else if(sMap.get(a1) == sMap.get(a2)) {	//카운트 수 같을 경우
					if(a1 > a2) {	//아스키값을 비교해서 오름차순 정렬함 (부호 반대시 내림차순 정렬)
						text = swap(text, j, j + 1);
					}	
				}	
			}
		}
		return text;
    }
    
    //배열의 두개의 값을 서로 바꾸기 위해 값을 담을 한 공간을 만들고 스왑하는 메서드 
    public static String swap(String str, int i, int j) 
    { 
        char ch[] = str.toCharArray(); 
        char temp = ch[i]; 
        ch[i] = ch[j]; 
        ch[j] = temp; 
        return new String(ch); 
    } 
}
~~~

* 메소드 설명

  * getCharCountMap(String text) 메소드
    * 임의의 텍스트를 넘겨받습니다. (중복이 포함된 텍스트)
    * String 형 key, Integer형 value를 가지는 Map 생성
    *  text길이만큼 반복문 실행
      * 한글자씩 key라는 변수에 담음
      * if문 실행
        * Map에 key라는 key값이 있을때 그 key값의 value값에 1을 더함
        * 동일한 key값이 없을때 맵에 key와 value = 1을 추가
      * if문 끝
    * 반복문 끝
    * 생성된 Map반환<br> 
  * sortString(Map) 메소드
    * getCharCountMap메소드에서 반환된 map을 넘겨받습니다.
    * String 변수 생성
    * Iterator를 통해 map의 키값들을 String 변수에 추가시킵니다.
    * 이중 for문 실행
      * 키값이 추가된 String 변수의 j번째 글자와 j+1번째 글자를 변수에 담습니다.
      * if문 실행
        * 변수의 키값을 통해 map에서 value(중복된 횟수)를 비교합니다. (j와 j+1 키의 값 비교)
        * 만약에 j+1의 값이 j의 값보다 크다면(j < j+1) 내림차순을 위해 두 글자를 서로 바꿔줍니다.(swap 메소드)
        * 만약에 두 값이 같다면(j == j+1) 아스키값을 비교하여 오름차순으로 바꿉니다.<br> 
  * swap(String str, int i, int j) 메소드
    * 파라미터값 i는 j , 파라미터값 j는 j+1
    * 파라미터값 str은 text
    * ch라는 캐릭터형 배열 생성(str 삽입)
    * 빈공간 temp를 생성하고 여기에 ch[i]를 저장
    * 그 다음 ch[i]에 ch[j]값을 덮어 씌움 (현재 j번째 값이 i번째로 들어간 상황)
    * 마지막으로 temp에 있던 ch[i]값을 ch[j]값에 덮어 씌움(j번째와 i번째 값이 서로 바뀜)
    *  변환을 완료하고 ch 배열을 String형으로 바꿔서 반환
