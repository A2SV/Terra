import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({super.key, this.height});

  final double? height;

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(); // Repeats the animation indefinitely
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        "assets/images/loader.png",
        height: widget.height ?? 7.h,
      ),
    );
  }
}
