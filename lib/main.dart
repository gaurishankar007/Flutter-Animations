import 'package:flutter/material.dart';

import 'screens/explicit/transform_clip_path.dart';
import 'screens/explicit/bouncing_item.dart';
import 'screens/explicit/multiple_animations.dart';
import 'screens/explicit/transform_rotation.dart';
import 'screens/explicit/transitions.dart';
import 'screens/home.dart';
import 'screens/implicit/animated_list_view.dart';
import 'screens/implicit/animated_widgets.dart';
import 'screens/implicit/hero_animations.dart';
import 'screens/implicit/ticker_animation.dart';
import 'screens/implicit/tween_builders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: routes,
    );
  }

  Map<String, WidgetBuilder> get routes {
    return {
      "/": (context) => const Home(),
      "/ticker": (context) => const TickerAnimation(),
      "/animatedWidget": (context) => const AnimatedWidgets(),
      "/tweenBuilder": (context) => const TweenBuilders(),
      "/heroAnimation": (context) => const HeroAnimation(),
      "/animatedListView": (context) => const AnimatedListView(),
      "/transitionAnimation": (context) => const TransitionAnimation(),
      "/transformRotation": (context) => const TransformRotation(),
      "/transformClipPath": (context) => const TransformClipPath(),
      "/bouncingItem": (context) => const BouncingItem(),
      "/multipleAnimations": (context) => const MultipleAnimations(),
    };
  }
}
