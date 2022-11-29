import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/home_screen.dart';
import 'package:riverpod_tutorial/user.dart';

//Providers
// Provider
// StateProvider
// StateNotifier and StateNotifierProvider
// ChnageNotifierProvider
// Future Provider

final fetchUserProvider = FutureProvider((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData();
});

Future<void> main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomePage(),
    );
  }
}
