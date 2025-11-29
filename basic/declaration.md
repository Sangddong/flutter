### 1. 변수 선언
**1. var**
- 재할당 가능
- 타입 변경 불가능
- 런타임 시점에 값 확정
```dart
void main () {
  var a = 'this is string';

  // ✅ 재할당 가능
  a = 'another string';

  // ❌ 타입 변경 불가능
  a = 10; // Error: A value of type 'int' can't be assigned to a variable of type 'String'.
}
```
**2. final**
- 재할당 불가능하나, 내부값은 변경 가능
- 타입 변경 불가능
- 런타임 시점에 값 확정
```dart
void main() {
  final list = [1, 2, 3];

  // ❌ 재할당 불가능
  list = [4, 5, 6]; // Error: Can't assign to the final variable 'list'.

  // ❌ 타입 변경 불가능
  list = "this is string"; // Error: Can't assign to the final variable 'list'.

  // ✅ 내부값 변경 가능
  list[0] = 0;
}
```
**3. const**
- 재할당, 타입 변경 불가능
- 컴파일 시점에 값 확정
```dart
void main() {
  const name = '기존 이름';

  // ❌ 재할당 불가능
  name = '재할당 이름'; // Error: Can't assign to the const variable 'name'.

  const arr = [1, 2, 3];

  // ❌ 내부값 변경 불가능
  arr[0] = 4; // Unhandled exception: Unsupported operation: Cannot modify an unmodifiable list
}
```
**4. dynamic**
- 재할당, 타입 변경 가능
- 런타임 시점에 값 고정
```dart
void main() {
  dynamic a = 'this is string';
  print(a);

  // ✅ 재할당 가능
  a = 'another string';
  print(a);

  // ✅ 타입 변경 가능
  a = 10;
  print(a);
}
```

**5. final vs const**
- final : **런타임** 시점에 확정
- const : **컴파일** 시점에 확정
-> `DateTime` 타입은 빌드 시점에 값이 설정되어, const로 선언 불가능
```dart
void main () async {
  final DateTime now_final = DateTime.now();
  const DateTime now_const = DateTime.now();  // Error: Cannot invoke a non-'const' constructor where a const expression is expected.
}
```
---

### Summary
|키워드|재할당 가능 여부|타입 고정 여부|값 확정 시점|런타임 값 변경 가능 여부(mutable)|
|:--:|:--:|:--:|:--:|:--:|
|`var`|✅ 가능|추론|런타임|타입이 처음 할당된 값으로 고정됨|
|`final`|❌ 불가능|타입 명시 또는 추론|런타임|내부 값은 변경 가능하나, 참조는 불변|
|`const`|❌ 불가능|타입 명시 또는 추론|컴파일 시점|완전불변|
|`dynamic`|✅ 가능|타입 미고정|런타임|타입 검사 없음, 어느 타입이든 재할당 가능|

---

