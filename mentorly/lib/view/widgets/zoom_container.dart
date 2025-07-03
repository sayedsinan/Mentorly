import 'package:flutter/material.dart';

class ZoomPulseContainer extends StatefulWidget {
  @override
  _ZoomPulseContainerState createState() => _ZoomPulseContainerState();
}

class _ZoomPulseContainerState extends State<ZoomPulseContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: .5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
