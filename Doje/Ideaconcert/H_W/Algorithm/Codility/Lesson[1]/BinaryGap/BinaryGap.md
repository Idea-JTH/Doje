~~~java
class Solution {
    public int solution(int N) {
        int zero = 0;   //1과 1사이의 0개수
        int totalzero = 0;  //zero들 중 가장 큰 zero
        
        String strZero = Integer.toBinaryString(N); //10진수 N을 String형으로 변환
        char[] charZero = strZero.toCharArray();    //변환된 String형 2진수를 char배열로 변환
        
        for(int i = 0; i<charZero.length; i++) {    //char배열 길이만큼 반복
            if(charZero[i] == '0') {    
                zero++;
            }
            else if(totalzero < zero) { //1이 나왔을때 만약 zero가 현재 totalzero보다 크면 갱신
                totalzero = zero;
                zero = 0;   //갱신 후 zero는 다시 0으로 초기화;
            }
            else {
                zero = 0;
            }
        }
        return totalzero;
    }
}
~~~

