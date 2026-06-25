import 'package:flutter/material.dart';
import '../../config/constants.dart';

class AnimatedCounter extends StatefulWidget {
  final int targetValue;
  final String label;
  final IconData icon;
  final String suffix;

  const AnimatedCounter({
    super.key,
    required this.targetValue,
    required this.label,
    required this.icon,
    this.suffix = '+',
  });

  @override
  State<AnimatedCounter> createState() => AnimatedCounterState();
}

@visibleForTesting
class AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.targetValue.toDouble(),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, size: 40, color: AppConstants.accentColor),
            const SizedBox(height: 12),
            Text(
              '${_animation.value.toInt()}${widget.suffix}',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
