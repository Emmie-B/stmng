import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stmng/api.dart';
import 'package:stmng/loger.dart';
import 'package:stmng/user.dart';

import 'home.dart';
import 'package:http/http.dart' as http;

import 'model/product.dart';

void main() {
  runApp(ProviderScope(
    observers: [LoggerRiverPod()],
    child: const MyApp(),
  ));
}

// final nameProvider = StateNotifierProvider<UserNotifier, User>((ref) {
//   return UserNotifier(User(name: '', age: 0, gender: ''));
// });

final futureProvider = FutureProvider.family((ref, input) {
  final classProvider = ref.watch(fetchProductProvider);
  return classProvider.getProdcut(input);
});

final stateProvider = StateProvider((ref) {
  return '4';
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
