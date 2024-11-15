import 'package:flutter/material.dart';
import 'package:knovator_assignment/service/init_provider.dart';
import 'package:knovator_assignment/theme/theams.dart';
import 'package:knovator_assignment/view/home/home_view.dart';

void main() {
  runApp(AppProviders.initializeProvider(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomeView(),
    );
  }
}
