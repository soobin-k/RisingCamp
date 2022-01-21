# Week3_AccountBook

⭐️ 가계부 앱 📕

[![iOS UITableView를 활용한 가계부 앱 만들기](https://img.youtube.com/vi/ae_Zsf0JNNs/0.jpg)](https://youtu.be/ae_Zsf0JNNs?t=0s)

⬆️⬆️⬆️실행 영상(유튜브 링크)⬆️⬆️⬆️

: 직관적으로 수입과 지출을 관리하고 통계를 조회할 수 있는 앱
UITableView를 활용 및 CRUD 기능을 구현

📌 화면 구성

1. 첫번째 화면
: 가계부 목록 테이블뷰, 추가 버튼, 스와이프 시 삭제

2. 두번째 화면
: 가계부 추가 텍스트 필드, 스피너, 버튼 등

3. 세번째 화면
: 가계부 상세 보기 및 수정 버튼

4. 네번째 화면
: 가계부 유형별, 지출/수입 통계

️* 전체 화면 구성
- 첫번째 화면과 네번째 화면은 탭 바로 구성

- 두번째 화면과 세번째 화면은 첫번째 화면과 내비게이션 바로 연결

 

📌️ 시나리오

1. 첫번째 화면에서 추가 버튼 클릭 시 두번째 화면으로 이동
2. 두번째 화면에서 금액, 유형, 메모 입력 및 수입/지출 선택 ➡️ 저장 버튼 클릭
3. 첫번째 화면으로 전환 시 테이블 뷰에 추가됨 ➡️ 테이블 뷰 클릭 시 세번째 화면 이동, 테이블 뷰 스와이프 시 삭제
4. 세번째 화면에서 조회 및 수정 가능
5. 탭바의 두번째 항목(네번째 화면)에서 유형별, 지출/수입 통계 조회 가능

 

📌 사용한 개념들

UITableView, UINavigationBar, Tab Bar Controller, UIPickerView, UISegmentedControll, Charts 라이브러리(PieChartView, BarChartView)

📌 실행 영상
https://chobikim.tistory.com/31