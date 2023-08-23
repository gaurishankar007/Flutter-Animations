import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/bouncing_item.dart';
import 'package:flutter_animations/screens/explicit_animations.dart';
import 'package:flutter_animations/screens/home.dart';
import 'package:flutter_animations/screens/implicit_animations.dart';
import 'package:flutter_animations/screens/list_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/implicit": (context) => const ImplicitAnimations(),
        "/explicit": (context) => const ExplicitAnimations(),
        "/animatedList": (context) => const ListViewAnimation(),
        "/bouncingItem": (context) => const BouncingItem(),
      },
    );
  }
}
