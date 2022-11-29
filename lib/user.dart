// ignore_for_file: avoid_renaming_method_parameters

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final int age;
  User({
    required this.name,
    required this.age,
  });

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  User merge(User model) {
    return User(
      name: model.name,
      age: model.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      age: map['age'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, age: $age)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User && o.name == name && o.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);
  void updateName(String n) {
    state = state.copyWith(name: n);
  }

  void updateAge(int a) {
    state = state.copyWith(age: a);
  }
}

class UserNotifierChange extends ChangeNotifier {
  User user = User(age: 0, name: '');

  void updateName(String n) {
    user = user.copyWith(name: n);
    notifyListeners();
  }

  void updateAge(int a) {
    user = user.copyWith(age: a);
    notifyListeners();
  }
}
