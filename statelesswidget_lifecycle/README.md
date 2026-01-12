# statelesswidget_lifecycle

<img width="401" height="160" alt="image" src="https://github.com/user-attachments/assets/320bed8c-d167-46d8-a26e-dfcb3507404d" />

```
createState()
   ↓
initState()
   ↓
didChangeDependencies()
   ↓
build()
   ↓
(setState() 반복)
   ↓
didUpdateWidget()
   ↓
deactivate()
   ↓
dispose()
```

### 1. createState()
``` dart
@override
State<HomeScreen> createState() => _HomeScreenState();
```
- StatefulWidget이 처음 생성될 때 State 객체 만듦

### 2. initState()
```dart
@override
void initState() {
  super.initState();
}
```
- State 객체가 처음 생성될 때 한 번 호출됨
- 역할
  - 변수 초기화
  - 컨트롤러 생성
  - API 호출
  - Timer, Stream 초기화

### 3. didChangeDependencies()
```dart
@override
void didChangeDependencies() {
  super.didChangeDependencies();
}
```
- initState 직후에 호출
- InheritedWidget 변경 시 호출
- 역할
  - 의존성 변경 확인

### 4. build()
```dart
@override
Widget build(BuildContext context) {
  return Scaffold(...);
}
```
- 화면 최초 렌더링, setState 호출, 부모 위젯 변경 시 호출

### 5. setState()
``` dart
setState(() {
  count++;
});
```
- 상태 변경 → build() 재실행

### 6. didUpdateWidget()
```dart
@override
void didUpdateWidget(covariant HomeScreen oldWidget) {
  super.didUpdateWidget(oldWidget);
}
```
- 부모 위젯이 새 값으로 rebuild 되었을 때 호출
- 역할
  - 이전 widget 과 새 widget 비교
  - props 변경 감지
 
### 7. deactivate()
```dart
@override
void deactivate() {
  super.deactivate();
}
```
- 위젯 트리에서 잠시 제거될 때 호출

### 8. dispose()
```dart
@override
void dispose() {
  controller.dispose();
  super.dispose();
}
```
- 위젯이 완전히 제거될 때 호출
