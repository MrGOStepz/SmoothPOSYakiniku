import 'package:flutter/cupertino.dart';

class Person {
  late String name;
  late int age;

  // Person({required String inputName, int inpitAge = 30}) {
  //   name = inputName;
  //   age = inpitAge;
  // }

  Person({required this.name, this.age = 30});
}

double addNumbers(double d1, double d2) {
  return d1 + d2;
}
