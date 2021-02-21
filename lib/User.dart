

import 'package:second_test/main.dart';

class User{
  int _id;
  String _nom, _password;
  Map<String, List<String>> list = {};

  User();

  get password => _password;

  set password(value) {
    _password = value;
  }

  // ignore: unnecessary_getters_setters
  String get nom => _nom;

  // ignore: unnecessary_getters_setters
  set nom(String value) {
    _nom = value;
  }

  // ignore: unnecessary_getters_setters
  int get id => _id;

  // ignore: unnecessary_getters_setters
  set id(int value) {
    _id = value;
  }
}