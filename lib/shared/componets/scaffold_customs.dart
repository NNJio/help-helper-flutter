// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:help_helper/shared/theme/color.dart';

class ScaffoldCustoms extends ConsumerWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? overlayColor;
  final bool isLoading; // ✅ เพิ่ม
  final Widget? loadingOverlay; // ✅ เพิ่ม

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
    this.isLoading = false, // ✅ ค่าเริ่มต้น
    this.loadingOverlay,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorConstants.helperTheme,
        Color(0xFFFFD392),
        ColorConstants.backgroundColor,
      ],
    );

    return Container(
      decoration: const BoxDecoration(gradient: gradient),
      child: ColoredBox(
        color: overlayColor ?? Colors.transparent,
        child: Stack(
          // ✅ ใช้ Stack ครอบ Scaffold ทั้งจอ
          children: [
            Scaffold(
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

            // ✅ Overlay โหลดเต็มจอ (จากหน้าไหนก็ได้)
            if (isLoading)
              Positioned.fill(
                child: loadingOverlay ??
                    Container(
                      color: Colors.black.withOpacity(0.3),
                      child: const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
