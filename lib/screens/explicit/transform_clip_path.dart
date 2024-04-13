import 'dart:math';

import 'package:flutter/material.dart';

/// Differentiating left and right sided circle
enum CircleSide {
  left,
  right,
}

/// Extension for getting the path of UI which will be shown based on the circle side
extension on CircleSide {
  Path toPath(Size size) {
    final path = Path();
    late Offset endOffset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        endOffset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        endOffset = Offset(0, size.height);
        clockwise = true;
        break;
    }

    path.arcToPoint(
      endOffset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockwise,
    );
    path.close();

    return path;
  }
}

/// Defining clipper for clip path
class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

  const HalfCircleClipper({
    required this.side,
  });

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

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
        /// Setting continuous flow
        flipAnimation = Tween<double>(
          begin: flipAnimation.value,
          end: flipAnimation.value + pi,
        ).animate(
          CurvedAnimation(
            parent: flipController,
            curve: Curves.bounceOut,
          ),
        );

        /// Reset Flip Animation
        flipController
          ..reset()
          ..forward();
      }
    });

    /// Flip Animation Status Listener
    flipController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        /// Setting continuous flow
        counterClockwiseAnimation = Tween<double>(
          begin: counterClockwiseAnimation.value,
          end: counterClockwiseAnimation.value + -pi / 2,
        ).animate(
          CurvedAnimation(
            parent: counterClockwiseRotationController,
            curve: Curves.bounceOut,
          ),
        );

        /// Reset Counter ClockWise Animation
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
