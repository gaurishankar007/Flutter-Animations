import 'package:flutter/material.dart';

class ToastProgressBarWidget extends StatelessWidget {
  final Animation<double> animation;
  final Color color;

  /// A progress bar to show the remaining time left to dismiss the toast
  const ToastProgressBarWidget({
    super.key,
    required this.animation,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Defining the height of the size transition
    // Otherwise it will take available height (maxHeight)
    return SizedBox(
      height: 5,
      child: SizeTransition(
        sizeFactor: animation,
        axis: Axis.horizontal,
        axisAlignment: -1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [
                color,
                color.withOpacity(0.8),
                color.withOpacity(0.4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
