import 'package:flutter/material.dart';
import 'package:todomock/common/di/service_locator.dart';
import 'package:todomock/presentation/features/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen()
    );
  }
}
