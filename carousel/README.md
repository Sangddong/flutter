# carousel

### Timer 이론
- 지정한 시간이 지난 뒤 한 번 또는 주기적으로 무언가를 실행할 수 있게 해준다
- 플러터에 기본 제공되는 dart:async 패키지를 통해 사용할 수 있다

### Timer 단일 실행
```dart
import 'dart:async';

void main(){
  Timer(
    Duration(seconds: 1), 
    () {
      print('1초 뒤에 실행한다!');
    }
  );
}
```

### Timer 반복 실행
```dart
import 'dart:async';

void main(){
  Timer.periodic(
    Duration(seconds: 1), 
    (Timer timer) {
      print('1초에 한 번씩 실행한다!');
    }
  );
}
```