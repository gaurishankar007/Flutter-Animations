import 'package:flutter/material.dart';

class TransitionAnimation extends StatefulWidget {
  const TransitionAnimation({super.key});

  @override
  State<TransitionAnimation> createState() => _TransitionAnimationState();
}

class _TransitionAnimationState extends State<TransitionAnimation> with TickerProviderStateMixin {
  late final AnimationController animationController;

  late final Animation<Offset> slideAnimation;
  late final Animation<double> sizeAnimation;
  late final Animation<double> fadeAnimation;
  late final Animation<double> scaleAnimation;
  late final Animation<double> rotationAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.slowMiddle,
      ),
    );
    sizeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationController);
    scaleAnimation = Tween<double>(
      begin: .1,
      end: 1,
    ).animate(animationController);
    rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceIn,
    ));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Icon getIcon() => const Icon(Icons.favorite, size: 40, color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Slide Transition"),
            const SizedBox(height: 5, width: double.maxFinite),
            SlideTransition(
              position: slideAnimation,
              child: Row(
                children: [getIcon()],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Size Animation"),
            const SizedBox(height: 5),
            Container(
              color: Colors.amber,
              child: SizeTransition(
                sizeFactor: sizeAnimation,
                axis: Axis.horizontal,
                child: getIcon(),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Fade Animation"),
            const SizedBox(height: 5),
            FadeTransition(
              opacity: fadeAnimation,
              child: getIcon(),
            ),
            const SizedBox(height: 20),
            const Text("Scale Animation"),
            const SizedBox(height: 5),
            ScaleTransition(
              scale: scaleAnimation,
              child: getIcon(),
            ),
            const SizedBox(height: 20),
            const Text("Rotation Animation"),
            const SizedBox(height: 5),
            RotationTransition(
              turns: rotationAnimation,
              child: getIcon(),
            ),
          ],
        ),
      ),
    );
  }
}
