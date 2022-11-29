import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider);
    return user.when(data: (data) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(data.name),
        ),
      );
    }, error: ((error, stackTrace) {
      return Center(
        child: Text(error.toString()),
      );
    }), loading: (() {
      return Container();
    }));
  }
}
