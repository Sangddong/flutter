void main () async {
  Operation operate1 = addNumbers;
  print(operate1(1, 2, 3));

  Operation operate2 = subNumbers;
  print(operate2(1, 2, 3));

  Operation operate3 = mulNumbers;
  print(operate3(1, 2, 3));
}

typedef Operation = int Function(int x, int y, int z);

int addNumbers(int x, int y, int z) => x + y + z;
int subNumbers(int x, int y, int z) => x - y - z;
int mulNumbers(int x, int y, int z) => x * y * z;