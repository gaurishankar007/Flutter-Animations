import 'dart:math';

import 'package:flutter/material.dart';

class TransformRotation extends StatefulWidget {
  const TransformRotation({super.key});
  @override
  State<TransformRotation> createState() => _TransformRotationState();
}

class _TransformRotationState extends State<TransformRotation> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 0, end: pi * 2).animate(animationController);
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Transform(
                // The origin from where the rotation begins
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  // ..rotateX(
                  // ..rotateZ(
                  ..rotateY(
                    animation.value,
                  ),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(2, 2),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
