import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/color.dart';
import 'label.dart';

class TopSnackbar {
  static void show(BuildContext context, String message, {int? duration}) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => TopSnackbarWidget(message: message),
    );

    overlay.insert(overlayEntry);

    Future.delayed(Duration(seconds: duration ?? 3), () {
      overlayEntry.remove();
    });
  }
}

class TopSnackbarWidget extends StatefulWidget {
  final String message;

  const TopSnackbarWidget({super.key, required this.message});

  @override
  State<TopSnackbarWidget> createState() => TopSnackbarWidgetState();
}

class TopSnackbarWidgetState extends State<TopSnackbarWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0.1),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.h,
      left: 24.w,
      right: 24.w,
      child: SlideTransition(
        position: _animation,
        child: Material(
          borderRadius: BorderRadius.circular(16.r),
          elevation: 6,
          color: ColorConstants.backgroundColor,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
            child: Center(
              child: Label(
                widget.message,
                fontSize: 16.sp,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
