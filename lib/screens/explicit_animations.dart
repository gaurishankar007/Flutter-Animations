import 'package:flutter/material.dart';

class ExplicitAnimations extends StatefulWidget {
  const ExplicitAnimations({super.key});

  @override
  State<ExplicitAnimations> createState() => _ExplicitAnimationsState();
}

class _ExplicitAnimationsState extends State<ExplicitAnimations> with TickerProviderStateMixin {
  late final AnimationController slideController;
  late final AnimationController colorSizeController;
  late final Animation<Offset> offsetAnimation;
  late final Animation<Color?> colorAnimation;
  late final Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();

    slideController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    colorSizeController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));

    offsetAnimation = Tween(
      begin: const Offset(7, 0),
      end: const Offset(0, 0),
    ).animate(slideController);

    final sizeTween = TweenSequence<double>(
      [
        TweenSequenceItem(tween: Tween(begin: 20, end: 50), weight: 50),
        TweenSequenceItem(tween: Tween(begin: 50, end: 20), weight: 50),
      ],
    );
    sizeAnimation = sizeTween.animate(
      CurvedAnimation(
        parent: colorSizeController,
        curve: Curves.slowMiddle,
      ),
    );

    final colorTween = ColorTween(begin: Colors.grey, end: Colors.red);
    colorAnimation = colorTween.animate(colorSizeController);

    slideController.forward();
  }

  @override
  void dispose() {
    slideController.dispose();
    colorSizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: colorSizeController,
            builder: (context, child) {
              return SlideTransition(
                position: offsetAnimation,
                child: IconButton(
                  onPressed: () {
                    if (colorSizeController.isDismissed) colorSizeController.forward();
                    if (colorSizeController.isCompleted) colorSizeController.reverse();
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
