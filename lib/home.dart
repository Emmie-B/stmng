import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stmng/api.dart';
import 'package:stmng/main.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePagState();
}

class _MyHomePagState extends ConsumerState<MyHomePage> {
  FetchProduct pro = FetchProduct();
  String? userNo;

  onChanged(WidgetRef ref, value) {
    userNo = ref.read(stateProvider.notifier).update((state) => value);
    print("Read former: " + userNo.toString());
  }

  @override
  Widget build(BuildContext context) {
    final userNo = ref.watch(stateProvider);
    final user = ref.watch(futureProvider(userNo));
    return user.when(data: (data) {
      return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                onSubmitted: (value) {
                  print("Current value-$userNo");
                  onChanged(ref, value);
                },
              ),
              Column(
                children: [
                  Center(
                    child: Text(data.title),
                  ),
                  Text("Le" + data.price.toString())
                ],
              ),
              Center(
                child: Image.network(data.image.toString()),
                // child: Text(userNo.toString()),
              ),
            ],
          ),
        )),
      );
    }, error: (error, StackTrace) {
      return Text(error.toString());
    }, loading: () {
      return CircularProgressIndicator();
    });
  }
}
