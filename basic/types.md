### 2. 타입
**1. int**
```dart
void main() {
  int a = 10;
  int b = 5;
  
  print(a + b);  // 15
  print(a - b);  // 5
  print(a * b);  // 50
  print(a / b);  // 2
}
```
**2. double**
```dart
void main() {
  double a = 10.5;
  double b = 5.0;
  
  print(a + b);  // 15.5
  print(a - b);  // 5.5
  print(a * b);  // 52.5
  print(a / b);  // 2.1
}
```
**3. String**
```dart
void main() {
  String str1 = "";
  String str2 = "hello";
  String str3 = "world!";
  String str4;
  String? str5;

  print(str1);  \\
  print(str2);  \\ hello
  print(str2 + " " + str3); \\ hello world!
  print("$str2 ${str3}");  \\ hello world!
  print(str4) -> Error: Non-nullable variable 'str4' must be assigned before it can be used.
  print(str5)  \\ null
}
```
```dart
void main() {
  String str1 = "apple";
  final String str2 = "banana";
  const String str3 = "grape";

  print(str1); // apple
  print(str2); // banana
  print(str3); // grape

  dynamic String str4 = "error";
}
```
**4. bool**
```dart
void main() {
  bool isTrue = true;
  bool isFalse = false;
  
  print(isTrue);  \\ true
  print(isFalse);  \\ true
}
```
**5. DateTime**
- 빌드 타임 기준으로 값 할당됨 -> const로 선언 불가
```dart
void main () async {
  DateTime now1 = DateTime.now();
  await Future.delayed(Duration(seconds: 3));
  DateTime now2 = DateTime.now();
  
  print(now1);  // 2025-10-08 17:46:25.948
  print(now2);  // 2025-10-08 17:46:29.310
}
```
**6. Null**
```dart
void main() {
  String name = 'Lisa';
  name = null;  // Error: A value of type 'Null' can't be assigned to a variable of type 'String'.

  String? name2 = 'Bart';
  name2 = null;
  print(name2!);  // Unhandled exception: Null check operator used on a null value
}
```
**7. List**
```dart
void main () async {
  List<String> family = ['Homer', 'Marge', 'Bart', 'Lisa'];
  print('family: ${family}')  //  // family: [Homer, Marge, Bart, Lisa, Maggie]

  print('family length: ${family.length}'); // family length: 4
  print('6th family: ${family[4]}'); // Unhandled exception: RangeError (length): Invalid value: Not in inclusive range 0..4: 5

  family.add('Ralph');
  print('family: ${family}'); // family: [Homer, Marge, Bart, Lisa, Maggie, Ralph]

  family.remove('Ralph');
  print('family: ${family}'); // family: [Homer, Marge, Bart, Lisa, Maggie]

  print(family.indexOf('Bart'))
}
```
**8. Map**
```dart
void main () async {
  Map<String, int> age = {
    'Homer': 40,
    'Marge': 35,
    'Bart': 11,
    'Lisa': 9,
    'Maggie': 1
  };

  print(age); // {Homer: 40, Marge: 35, Bart: 10, Lisa: 8, Maggie: 1}

  age.addAll({'Ralph': 9});
  print(age); // {Homer: 40, Marge: 35, Bart: 11, Lisa: 9, Maggie: 1, Ralph: 9}

  age.remove('Ralph');
  print(age); // {Homer: 40, Marge: 35, Bart: 11, Lisa: 9, Maggie: 1}

  print(age['Marge']); // 35

  print(age.keys);  // (Homer, Marge, Bart, Lisa, Maggie)
  print(age.values);  // (40, 35, 11, 9, 1)
}
```
**9. Set**
```dart
void main () async {
  final Set<String> language = {
    'Java', 'Python', 'Dart', 'Java'
  };

  print(language);  // {Java, Python, Dart}

  language.remove('Java');

  print(language);  // {Python, Dart}

  print(language.contains('Rubi')); // false
}
```