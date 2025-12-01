# rows_and_columns

A new Flutter project.

## Rows & Columns
1. Row
- 가로로 위젯을 배치할 때 사용
- MainAxisAlignment
  - Row의 **가로**
  - Row의 **주축**
  - 최대 크기 차지
- CrossAxisAlignment
  - Row의 **세로**
  - Row의 **반대축**
  - 최소 크기 차지

2. Column
- 세로로 위젯을 배치할 때 사용
- MainAxisAlignment
  - Column의 **세로**
  - Column의 *주축**
  - 최대 크기 차지
- CrossAxisAlignment
  - Column의 **가로**
  - Column의 **반대축**
  - 최소 크기 차지

3. MainAxisAlignment
- 주축
  - Row : 가로, 행의 최대 크기 차지
  - Column : 세로, 열의 최대 크기 차지
- 옵션 (`MainAxisAlignment.~`)
  - .start : 주축의 시작에 정렬
  - .end : 주축의 끝에 정렬
  - .center : 주축의 중앙에 정렬
  - .spaceBetween : 주축에서 위젯들 사이에 동일한 간격을 두고 정렬
  - .spaceAround : 주축에서 위젯들 주변에 동일한 간격을 두고 정렬
  - .spaceEvenly : 주축에서 위젯들 앞뒤 및 사이에 동일한 간격을 두고 정렬

4. CrossAxisAlignment
- 반대축
  - Row : 세로, 행의 최소 크기 차지
  - Column : 가로, 열의 최대 크기 차지
- 옵션 (`MainAxisAlignment.~`)
    - .start : 반대축의 시작에 정렬
    - .end : 반대축의 끝에 정렬
    - .center : 반대축의 중앙에 정렬
    - .stretch : 반대축으로 위젯들을 최대로 확장
    -   .baseline : 텍스트 기준선을 기준으로 위젯 정렬