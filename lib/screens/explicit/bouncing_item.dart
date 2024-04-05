import 'package:flutter/material.dart';

class BouncingItem extends StatefulWidget {
  const BouncingItem({super.key});

  @override
  State<BouncingItem> createState() => _BouncingItemState();
}

class _BouncingItemState extends State<BouncingItem>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 5),
    ).animate(
      CurvedAnimation(
        curve: Curves.elasticIn,
        parent: controller,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SlideTransition(
            position: offsetAnimation,
            child: const Icon(
              Icons.flutter_dash_rounded,
              color: Colors.deepPurple,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}
