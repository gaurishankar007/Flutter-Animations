import 'package:flutter/material.dart';

import 'screens/explicit/bouncing_item.dart';
import 'screens/explicit/cube_3d.dart';
import 'screens/explicit/multiple_animations.dart';
import 'screens/explicit/ticker_animation.dart';
import 'screens/explicit/transform_clip_path.dart';
import 'screens/explicit/transform_rotation.dart';
import 'screens/explicit/transitions.dart';
import 'screens/home.dart';
import 'screens/implicit/animated_list_view.dart';
import 'screens/implicit/animated_widgets.dart';
import 'screens/implicit/hero_animations.dart';
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

      /// Implicit Animations
      "/animatedWidget": (context) => const AnimatedWidgets(),
      "/tweenBuilder": (context) => const TweenBuilders(),
      "/heroAnimation": (context) => const HeroAnimation(),
      "/animatedListView": (context) => const AnimatedListView(),

      /// Explicit Animations
      "/ticker": (context) => const TickerAnimation(),
      "/transitionAnimation": (context) => const TransitionAnimation(),
      "/transformRotation": (context) => const TransformRotation(),
      "/transformClipPath": (context) => const TransformClipPath(),
      "/cube3D": (context) => const Cube3D(),
      "/bouncingItem": (context) => const BouncingItem(),
      "/multipleAnimations": (context) => const MultipleAnimations(),
    };
  }
}
