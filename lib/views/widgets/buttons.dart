import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';

class CoolButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTapUp;
  final VoidCallback? onTapDown;
  final double width;
  final Color? color;
  const CoolButton({
    super.key,
    this.onTapUp,
    this.onTapDown,
    this.width = 0.7,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      onTapUp: onTapUp,
      onTapDown: onTapDown ?? () => HapticFeedback.lightImpact(),
      forwardDuration: const Duration(milliseconds: 20),
      reverseDuration: const Duration(milliseconds: 20),
      animationDuration: const Duration(milliseconds: 20),
      color: color ?? Theme.of(context).colorScheme.primary,
      depth: 2,
      child: SizedBox(
        width: width.sw,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
