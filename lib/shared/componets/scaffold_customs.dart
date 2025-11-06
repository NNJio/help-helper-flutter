import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/color.dart';

class ScaffoldCustoms extends ConsumerWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? overlayColor; // เผื่อเปลี่ยนสีทับไล่สีบางกรณี

  const ScaffoldCustoms({
    super.key,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.drawer,
    this.endDrawer,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorConstants.helperTheme,
        Color(0xFFFFD392),
        ColorConstants.backgroundColor,
      ],
    );

    return Container(
      decoration: const BoxDecoration(
        gradient: gradient,
      ),
      child: ColoredBox(
        color: (overlayColor ?? Colors.transparent),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: body,
          ),
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          drawer: drawer,
          endDrawer: endDrawer,
        ),
      ),
    );
  }
}
