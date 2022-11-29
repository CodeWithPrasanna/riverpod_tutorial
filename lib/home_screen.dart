import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>(
    ((ref) => UserNotifier(User(name: '', age: 0))));
final changeuserProvider =
    ChangeNotifierProvider(((ref) => UserNotifierChange()));

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  ///stateNotifer
  void onSubmit(WidgetRef ref, String value) {
    // ref.read(nameProvider.notifier).update((state) => value);
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value) {
    // ref.read(nameProvider.notifier).update((state) => value);
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }

//changeNotifier
  void onSubmitChangeNotifier(WidgetRef ref, String value) {
    ref.read(changeuserProvider).updateName(value);
  }

  void onSubmitAgeChangeNotifier(WidgetRef ref, String value) {
    ref.read(changeuserProvider).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(changeuserProvider).user;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              onSubmitChangeNotifier(ref, value);
            },
          ),
          TextField(
            onSubmitted: (value) {
              onSubmitAge(ref, value);
            },
          ),
          Center(
            child: Text(user.name),
          )
        ],
      ),
    );
  }
}
