import 'package:flutter/material.dart';

class ExplicitAnimations extends StatefulWidget {
  const ExplicitAnimations({super.key});

  @override
  State<ExplicitAnimations> createState() => _ExplicitAnimationsState();
}

class _ExplicitAnimationsState extends State<ExplicitAnimations>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  late CurvedAnimation curveAnimation;

  late AnimationController controller2;
  late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    curveAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.slowMiddle,
    );

    colorAnimation = ColorTween(
      begin: Colors.grey,
      end: Colors.red,
    ).animate(controller);

    sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 30, end: 50),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 50, end: 30),
        weight: 50,
      ),
    ]).animate(curveAnimation);

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    controller2.forward();

    offsetAnimation = Tween<Offset>(
      begin: const Offset(7, 0),
      end: const Offset(0, 0),
    ).animate(controller2);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return SlideTransition(
                position: offsetAnimation,
                child: IconButton(
                  onPressed: () {
                    if (controller.status == AnimationStatus.completed) {
                      controller.reverse();
                    }

                    if (controller.status == AnimationStatus.dismissed) {
                      controller.forward();
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: colorAnimation.value,
                    size: sizeAnimation.value,
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
