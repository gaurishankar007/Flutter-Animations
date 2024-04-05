import 'package:flutter/material.dart';

class TweenBuilders extends StatefulWidget {
  const TweenBuilders({super.key});

  @override
  State<TweenBuilders> createState() => _TweenBuildersState();
}

class _TweenBuildersState extends State<TweenBuilders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
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
              child: const Text(
                "Hello world!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 20),
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
          ],
        ),
      ),
    );
  }
}
