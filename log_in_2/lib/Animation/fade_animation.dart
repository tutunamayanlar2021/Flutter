import 'package:flutter/material.dart';

class FadeTransitionStartUp extends StatefulWidget {
  final Widget child;
  final Duration? duration;
  const FadeTransitionStartUp({Key? key, required this.child, this.duration})
      : super(key: key);

  @override
  _FadeTransitionStartUpState createState() => _FadeTransitionStartUpState();
}

class _FadeTransitionStartUpState extends State<FadeTransitionStartUp>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    late final AnimationController controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    /*animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack,
    );*/
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: animation, child: widget.child);
  }
}
