# Week4_MultiThreadGame

 ️⭐️ 주제: 슈의 라면 게임👩🏻‍🍳🍜
 
[![iOS 쓰레드를 활용한 게임 만들기](https://img.youtube.com/vi/Yi7HfWCyEdE/0.jpg)](https://youtu.be/Yi7HfWCyEdE?t=0s)

⬆️⬆️⬆️실행 영상(유튜브 링크)⬆️⬆️⬆️


📌 간단한 게임 설명

- 주어진 시간 1분 내에 라면을 최대한 많이 만드는 게임

- 조리 순서는 물 붓기 ➡️ 스프 넣기 ➡️ 면 넣기 ➡️ 파 넣기 ➡️ 계란 넣기

- 한번에 조리 가능한 냄비 수는 4개, 남은 냄비 개수는 3개(목숨 개념)

- 냄비에 물을 넣으면 조리 시작, 10초 안에 손님에게 제출하지 못하면 냄비가 탐

- 모든 재료를 순서대로 넣고 손님에게 제출한다면 +1000포인트, 조리 순서가 틀리면 경고 토스트 메시지, 탄 냄비의 경우 0포인트 ➡️ 남은 냄비 개수(목숨) 1개 깍임
시간 안에 10000원을 채우면 성공/채우지 못하면 실패


✔️ 메인 쓰레드

: 타이머 1분 

- 종료 시점
I) 목숨 개수가 0개가 되면 게임 종료 후 점수표, 결과 출력
ii) 1분 초과 시 게임 종료 및 점수표, 결과 출력 


✔️ 쓰레드 1, 2, 3, 4 

: 라면 조리하는 로직(독립된 타이머 10초)

- 라면에 물을 부을 때 부터 조리 타이머 10초 시작!(쓰레드 start!)

- 사용자 버튼 클릭 이벤트로 재료 추가 가능 ➡️ 추가 할때 마다 상황에 맞는 라면 이미지로 변경

- 종료 시점
i) 라면을 손님에게 제출하면 쓰레드 종료
ii) 10초가 지나면 탄 냄비 출력 후 쓰레드 종료


📌 사용 개념

: DispatchQueue, Timer, ToastMessage


📌 블로그 포스팅

https://chobikim.tistory.com/33