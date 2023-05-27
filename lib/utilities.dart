import 'package:myapp/staefull.dart';

//Waiting function
Stream<dynamic> counter() async* {
  for (int seconds = 1; seconds <= 60; seconds++) {
    await Future.delayed(const Duration(seconds: 1));
    yield seconds;
  }
  yield "Done";
}
//person class
class Person{
  String name,address;
  int age;
  Person({required this.name,required this.address,required this.age});
  @override
  String toString()
  {
    return "Person($name)";
  }
}
//employee class extends with person class
class Employee extends Person {
  String post;
  int salary;

  Employee(
      {required name, required address, required age, required this.post, required this.salary})
      :super(name: name, age: age, address: address);

  @override
  String toString() {
    return " Employee(${super.toString()}, $post)";
  }
}