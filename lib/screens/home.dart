import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Implicit Animations",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/ticker"),
                child: const Text("Ticker Animation"),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 30),
              const Text(
                "Explicit Animations",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/transitionAnimation"),
                child: const Text("Transition Animation"),
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
          ),
        ),
      ),
    );
  }
}
