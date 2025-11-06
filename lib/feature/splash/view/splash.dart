// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:help_helper/feature/login/view/login.dart';

import '../../../shared/componets/push_page.dart';
import '../../home/view/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));

    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // ถ้า login อยู่
      go(context, const HomePage());
    } else {
      // ถ้ายังไม่ login
      go(context, const LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash/splash_image.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.white.withOpacity(0)),
        ],
      ),
    );
  }
}
