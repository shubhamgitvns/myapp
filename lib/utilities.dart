import 'package:myapp/staefull.dart';

class Utilities
{
  static Book currentbook=Book("Let us C", 100);
}

Future asyncFunction() async {
  await Future.delayed(Duration(seconds: 3));
  return 'Return from Async Function';
}