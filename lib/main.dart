import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feature/splash/view/splash.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: HelpHub()));
}

class HelpHub extends StatelessWidget {
  const HelpHub({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        theme: ThemeData(
          fontFamily: 'RSU',
          textTheme: ThemeData.light().textTheme.apply(
                fontFamily: 'RSU',
              ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Help Hub',
        home: const SplashPage(),
      ),
    );
  }
}
