import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(text: "Implicit Animations"),
                Tab(text: "Explicit Animations"),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  implicitAnimations(context),
                  explicitAnimations(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column implicitAnimations(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/animatedWidget"),
          child: const Text("Animated Widget"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/tweenBuilder"),
          child: const Text("Tween Builders"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/heroAnimation"),
          child: const Text("Hero Animation"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/animatedListView"),
          child: const Text("List View Animations"),
        ),
      ],
    );
  }

  Column explicitAnimations(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/ticker"),
          child: const Text("Ticker Animation"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/transitionAnimation"),
          child: const Text("Transition Animation"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/transformRotation"),
          child: const Text("Transform Rotation"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/transformClipPath"),
          child: const Text("Transform Clip Path"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/cube3D"),
          child: const Text("3D Cube"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/bouncingItem"),
          child: const Text("Bouncing Item"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, "/multipleAnimations"),
          child: const Text("Multiple Animations"),
        ),
      ],
    );
  }
}
