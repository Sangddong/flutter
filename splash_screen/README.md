# splash_screen

A new Flutter project.

## Functions & Widgets
1. runApp()
- Flutter 앱을 시작시키는 함수
- 위젯 트리의 루트(Root)를 설정
```dart
  runApp(
    MaterialApp(
      home: HomeScreen()
    )
  );
```

2. MaterialApp
- Material Design 스타일을 사용하는 Flutter 앱의 기본 구조
- 테마, 내비게이션, 라우팅 등을 제공
- `home:`에 첫 번째 화면을 설정
```dart
  MaterialApp(
    home: HomeScreen()
  )
```

3. StatelessWidget
- 상태(state)가 변하지 않는 정적 UI 구성에 사용하는 위젯
- 한 번 빌드되면 내부 데이터가 변화되지 않는 경우
```dart
  class HomeScreen extends StatelessWidget
```

4. Scaffold
- Material Design 레이아웃의 기본 뼈대 구조
- AppBar, Drawer, FloatingActionButton 등 추가 가능
- 화면 전체 레이아웃을 잡는 가장 핵심적인 위젯
```dart
  return Scaffold(
    backgroundColor: Color(0xFF335CB0),
    body: ...
  )
```

5. backgroundColor
- 화면 전체 배경색을 지정
- Color() : 16진수 색상 지정 방식
- Colors.~ : 내장된 색상 선택 가능
```dart
  backgroundColor: Color(0xFF335CB0),
```

6. Padding
- 내부(child) 위젯에 여백을 주는 위젯
- `symmetric`-> 좌우 또는 상하 여백 설정
```dart
  Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 32.0,
      vertical: 48.0
    ),
  )
```

7. Column
- 위젯들을 세로 방향으로 배치
- `mainAxisAlignment: MainAxisAlignment.center` -> 세로 방향, 가운데 정렬
```dart
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [...]
  )
```

8. Image.asset
- 프로젝트 내 로컬 assets를 불러오는 위젯
- pubspec.yaml에 등록되어 있어야 표시됨
```dart
  Image.asset('asset/img/logo.png')
```

9. SizedBox
- 고정된 공간(여백)을 만들어주는 위젯
```dart
  SizedBox(height: 10.0)
```

10. CircularProgressIndigator
- 원형 로딩 스피너(Progress Indigator)
- 비동기 작업하거나 로딩 중 시 사용
```dart
  CircularProgressIndigator(color: Colors.white)
```

11. stless
- StatelessWidget 자동 생성 단축어
- 아래 코드가 자동으로 완성됨
```dart
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```