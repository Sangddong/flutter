### 3. 함수
**1. positional parameter**
```dart
void main () async {
  addNumbers(1, 2, 3);
  /*
  x: 1
  y: 2
  z: 3
  x + y + z = 6
  */
}

addNumbers(int x, int y, int z) {
  print('x: ${x}');
  print('y: ${y}');
  print('z: ${z}');

  print('x + y + z = ${x + y + z}');
}
```
**2. optional parameter**
```dart
void main () async {
  addNumbers(1);
  /*
  x: 1
  y: 2
  z: 3
  x + y + z = 6
  */
}

addNumbers(int x, [int y = 2, int z = 3]) {
  print('x: ${x}');
  print('y: ${y}');
  print('z: ${z}');

  print('x + y + z = ${x + y + z}');
}
```
**3. named parameter**
```dart
void main () async {
  addNumbers(x: 1, y: 2, z: 3);
  /*
  x: 1
  y: 2
  z: 3
  x + y + z = 6
  */
}

addNumbers({x, y, z}) {
  print('x: ${x}');
  print('y: ${y}');
  print('z: ${z}');

  print('x + y + z = ${x + y + z}');
}
```
**4. typeDef**
```dart
void main () async {
  Operation operate1 = addNumbers;
  print(operate1(1, 2, 3)); // 6

  Operation operate2 = subNumbers;
  print(operate2(1, 2, 3)); // -4
}

typedef Operation = int Function(int x, int y, int z);

int addNumbers(int x, int y, int z) => x + y + z;
int subNumbers(int x, int y, int z) => x - y - z;
```