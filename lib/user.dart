import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  String? name;
  int? age;
  String? gender;

  User({this.name, this.age, this.gender});
  
  User copyWith({String? name, int? age, String? gender}) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
    );
  }
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setAge(int age) {
    state = state.copyWith(age: age);
  }

  void setGender(String gender) {
    state = state.copyWith(gender: gender);
  }
}
