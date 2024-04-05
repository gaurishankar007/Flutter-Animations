import 'package:flutter/material.dart';

class AnimatedWidgets extends StatefulWidget {
  const AnimatedWidgets({super.key});

  @override
  State<AnimatedWidgets> createState() => _AnimatedWidgetsState();
}

class _AnimatedWidgetsState extends State<AnimatedWidgets> {
  double width = 200;
  Color color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: width,
            height: 200,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() {
                    if (width == 200) {
                      width = 300;
                    } else {
                      width = 200;
                    }
                  }),
                  child: const Text("Animate Size"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => setState(() {
                    if (color == Colors.deepOrange) {
                      color = Colors.deepPurple;
                    } else {
                      color = Colors.deepOrange;
                    }
                  }),
                  child: const Text("Animate Color"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
