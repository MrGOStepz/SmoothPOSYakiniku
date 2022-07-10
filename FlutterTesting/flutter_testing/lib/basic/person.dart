import 'package:flutter/material.dart';

class Person {
  String? name;
  int? age;

  Person({required String name,required int age});
}

void main(){
  var p1 = Person(name: "name", age: 15);
}