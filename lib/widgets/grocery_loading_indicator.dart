import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class GroceryLoadingIndicator extends StatelessWidget {
  const GroceryLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Grocery Shop',
        style: Theme.of(context).textTheme.displaySmall,
      )
          .animate(
            onComplete: (controller) {
              controller.repeat(reverse: true);
            },
          )
          .scale(
            duration: const Duration(milliseconds: 800),
            begin: const Offset(1, 1),
            end: const Offset(1.2, 1.2),
            curve: Curves.easeIn,
          )
          .animate(),
    );
  }
}
