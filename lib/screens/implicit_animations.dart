import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({super.key});

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  double width = 200;
  Color color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 1),
                builder: (context, value, child) {
                  return Padding(
                    padding: EdgeInsets.all(value * 20),
                    child: Opacity(
                      opacity: value,
                      child: child,
                    ),
                  );
                },
                child: const Text("Hello world!"),
              ),
              TweenAnimationBuilder<Duration>(
                duration: const Duration(minutes: 3),
                tween: Tween(
                  begin: const Duration(minutes: 3),
                  end: Duration.zero,
                ),
                onEnd: () {
                  debugPrint('Timer ended');
                },
                builder: (BuildContext context, Duration value, Widget? child) {
                  final minutes = value.inMinutes;
                  final seconds = value.inSeconds % 60;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      '$minutes:$seconds',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  );
                },
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: width,
                height: 200,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(10)),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
