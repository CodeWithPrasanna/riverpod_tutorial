// ignore_for_file: avoid_renaming_method_parameters
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String name;
  final String email;
  User({
    required this.name,
    required this.email,
  });

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      email: email,
    );
  }

  User merge(User model) {
    return User(
      name: model.name,
      email: model.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, email: $email)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User && o.name == name && o.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

final userRepositoryProvider = Provider((ref) => UserRepository());

class UserRepository {
  Future<User> fetchUserData() {
    const url = 'https://jsonplaceholder.typicode.com/users/1';
    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }
}
