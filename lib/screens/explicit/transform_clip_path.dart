import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/clipper/half_circle_clipper.dart';

/// Extension for running the animation after a second
extension on VoidCallback {
  Future<void> delaySecond() => Future.delayed(const Duration(seconds: 1), this);
}

class TransformClipPath extends StatefulWidget {
  const TransformClipPath({super.key});
  @override
  State<TransformClipPath> createState() => _TransformClipPathState();
}

class _TransformClipPathState extends State<TransformClipPath> with TickerProviderStateMixin {
  late AnimationController counterClockwiseRotationController;
  late Animation<double> counterClockwiseAnimation;

  late AnimationController flipController;
  late Animation<double> flipAnimation;

  @override
  void initState() {
    super.initState();

    /// Rotation Animation
    counterClockwiseRotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    counterClockwiseAnimation = Tween<double>(
      begin: 0,
      end: -pi / 2,
    ).animate(
      CurvedAnimation(
        parent: counterClockwiseRotationController,
        curve: Curves.bounceOut,
      ),
    );

    /// Flip Animation
    flipController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    flipAnimation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(
      CurvedAnimation(
        parent: flipController,
        curve: Curves.bounceOut,
      ),
    );

    /// Rotation Animation Status Listener
    counterClockwiseRotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        /// Setting continuous flow of animation
        flipAnimation = Tween<double>(
          begin: flipAnimation.value,
          end: flipAnimation.value + pi,
        ).animate(
          CurvedAnimation(
            parent: flipController,
            curve: Curves.bounceOut,
          ),
        );

        /// Reset flip animation
        flipController
          ..reset()
          ..forward();
      }
    });

    /// Flip Animation Status Listener
    flipController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        /// Setting continuous flow of animation
        counterClockwiseAnimation = Tween<double>(
          begin: counterClockwiseAnimation.value,
          end: counterClockwiseAnimation.value + -pi / 2,
        ).animate(
          CurvedAnimation(
            parent: counterClockwiseRotationController,
            curve: Curves.bounceOut,
          ),
        );

        /// Reset Counter clockWise animation
        counterClockwiseRotationController
          ..reset()
          ..forward();
      }
    });
  }

  @override
  void dispose() {
    flipController.dispose();
    counterClockwiseRotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Delay one second before running the animation
    /// Reset the animation to its initial value and then run
    /// Because hot reload will not start the animation again
    counterClockwiseRotationController
      ..reset()
      ..forward.delaySecond();

    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: counterClockwiseRotationController,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateZ(counterClockwiseAnimation.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  leftSideHalfCircle(),
                  rightSideHalfCircle(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  AnimatedBuilder rightSideHalfCircle() {
    return AnimatedBuilder(
      animation: flipController,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.centerLeft,
          transform: Matrix4.identity()..rotateY(flipAnimation.value),
          child: ClipPath(
            clipper: const HalfCircleClipper(side: CircleSide.right),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.deepOrange,
            ),
          ),
        );
      },
    );
  }

  AnimatedBuilder leftSideHalfCircle() {
    return AnimatedBuilder(
      animation: flipController,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.centerRight,
          transform: Matrix4.identity()..rotateY(flipAnimation.value),
          child: ClipPath(
            clipper: const HalfCircleClipper(side: CircleSide.left),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.deepPurple,
            ),
          ),
        );
      },
    );
  }
}
