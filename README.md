# Week5_MovieInfoApp

### ⭐️ 주제: 영화 예매 앱🎬

: 카카오 로그인 API와 THE MOVIE DB API를 활용하여 영화 예매 앱을 만들기

- THE MOVIE DB API: https://developers.themoviedb.org/3/getting-started/introduction

 [![iOS openAPI를 활용한 영화 예매 앱 만들기](https://img.youtube.com/vi/22Nghvu3FfA/0.jpg)](https://youtu.be/22Nghvu3FfA?t=0s)

⬆️⬆️⬆️실행 영상(유튜브 링크)⬆️⬆️⬆️

### 📌 앱 설명

* 첫번째 화면: 앱 로고 이미지 + 카카오 로그인 

* 두번째 화면: 영화 목록 조회(영화 이미지, 제목)

* 세번째 화면: 영화 상세 조회(영화 이미지, 제목, 상세 설명) + 예매하기 버튼

* 네번째 화면: 영화 예매 하기(영화 선택, 자리 선택, 청소년/성인 선택, 시간 선택 등) + 예매 완료 알림창

* 다섯번째 화면: 영화 검색 하기

* 여섯번째 화면: 마이페이지(카카오 프로필 이미지, 이름 출력)+예매 내역 조회, 삭제 가능

✔️ 네번째, 다섯번째, 여섯번째 화면은 상단 탭 바로 구성

✔️ 두번째 화면과 세번째 화면은 내비게이션 바로 연결

 

### 📌 시나리오

1. 첫번째 화면에서 카카오 로그인하기 ➡️ 로그인 완료 시, 영화 목록 화면으로 이동

2. 두번째 화면에서 상영중인 영화 목록 조회하기  ➡️ 원하는 영화 클릭 시, 영화 상세보기 화면으로 이동
 
3. 클릭한 영화 상세보기 ➡️ 예매하기 버튼 클릭 시, 예매하기 화면으로 이동

4. 예매하기 탭에서도 원하는 영화 선택 후 예매 가능

5. 영화 검색 탭에서 영화 제목으로 검색 가능

6. 마이 페이지 탭에서 자신의 프로필과 예매 내역 조회, 삭제 가능


### 📌 사용 개념

: 카카오 소셜 로그인, THE MOVIE DB API, Postman, Alamofire, 상단 탭바(XLPagerTabStrip 라이브러리), 테이블뷰 안에 콜렉션 뷰, Delegate/Protocol, UIDatePicker, UIStepper


### 📌 블로그 포스팅

https://chobikim.tistory.com/37
