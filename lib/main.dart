import 'package:flutter/material.dart';

import 'screens/explicit/animated_prompt.dart';
import 'screens/explicit/animation_polygon.dart';
import 'screens/explicit/bouncing_position.dart';
import 'screens/explicit/cube_3d.dart';
import 'screens/explicit/drawer_3d.dart';
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
}

Map<String, WidgetBuilder> get routes {
  return {
    "/": (context) => const Home(),
    ...implicitAnimations,
    ...explicitAnimations,
  };
}

Map<String, WidgetBuilder> get implicitAnimations {
  return {
    "/Animated Widget": (context) => const AnimatedWidgets(),
    "/Tween Builder": (context) => const TweenBuilders(),
    "/Hero Animation": (context) => const HeroAnimation(),
    "/Animated List View": (context) => const AnimatedListView(),
  };
}

Map<String, WidgetBuilder> get explicitAnimations {
  return {
    "/Ticker": (context) => const TickerAnimation(),
    "/Transition Animation": (context) => const TransitionAnimation(),
    "/Bouncing Position": (context) => const BouncingPosition(),
    "/Bouncing Size": (context) => const BouncingSize(),
    "/Transform Rotation": (context) => const TransformRotation(),
    "/Transform ClipPath": (context) => const TransformClipPath(),
    "/Cube 3D": (context) => const Cube3D(),
    "/Animation With Polygon": (context) => const AnimationWithPolygon(),
    "/Drawer 3D": (context) => const Drawer3D(),
    "/Animated Prompt": (context) => const AnimatedPrompt(),
  };
}
