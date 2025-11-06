  // // ignore_for_file: use_build_context_synchronously

  // import 'dart:async';
  // import 'package:firebase_auth/firebase_auth.dart';
  // import 'package:flutter/material.dart';
  // import 'package:flutter_riverpod/flutter_riverpod.dart';
  // import 'package:help_helper/feature/home/view/home.dart';
  // import 'package:help_helper/shared/componets/top_snackbar.dart';
  // import 'package:help_helper/shared/utils/provider/provider.dart';

  // /// ViewModel หลัก (ใช้ Riverpod StateNotifier)
  // class OtpViewModel extends StateNotifier<OtpState> {
  //   final Ref ref;
  //   final FirebaseAuth _auth = FirebaseAuth.instance;

  //   OtpViewModel(this.ref)
  //       : super(OtpState(
  //           controllers: List.generate(6, (_) => TextEditingController()),
  //           nodes: List.generate(6, (_) => FocusNode()),
  //         ));

  //   // ✅ เรียกตอน initState
  //   void init(BuildContext context) {
  //     Future.delayed(const Duration(milliseconds: 400), () {
  //       print(_auth.currentUser?.uid);
  //       TopSnackbar.show(context, 'OTP ของคุณคือ 123456', duration: 6);
  //       autoFillOtp(context, '123456');
  //     });
  //   }

  //   // ✅ auto fill OTP จำลอง
  //   Future<void> autoFillOtp(BuildContext context, String otp) async {
  //     for (int i = 0; i < otp.length; i++) {
  //       await Future.delayed(const Duration(milliseconds: 100));
  //       state.controllers[i].text = otp[i];
  //     }
  //     await onOtpFilled(context, otp);
  //   }

  //   // ✅ ตรวจ OTP จริง
  //   Future<void> onOtpFilled(BuildContext context, String code) async {
  //     state = state.copyWith(handling: true);
  //     final verificationId = ref.read(otpVerifyIdProvider);

  //     if (verificationId == null) {
  //       TopSnackbar.show(context, 'ไม่พบรหัสยืนยัน');
  //       state = state.copyWith(handling: false);
  //       return;
  //     }

  //     try {
  //       final credential = PhoneAuthProvider.credential(
  //         verificationId: verificationId,
  //         smsCode: code,
  //       );
  //       await _auth.signInWithCredential(credential);

  //       if (context.mounted) {
  //         Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(builder: (_) => const HomePage()),
  //           (route) => false,
  //         );
  //       }
  //     } catch (e) {
  //       TopSnackbar.show(context, 'OTP ไม่ถูกต้อง');
  //       for (final c in state.controllers) {
  //         c.clear();
  //       }
  //       state.nodes.first.requestFocus();
  //       state = state.copyWith(handling: false);
  //     }
  //   }

  //   // ✅ ทำความสะอาด resource
  //   void disposeAll() {
  //     for (final c in state.controllers) {
  //       c.dispose();
  //     }
  //     for (final n in state.nodes) {
  //       n.dispose();
  //     }
  //   }
  // }

  // /// State ของ OTP Page
  // class OtpState {
  //   final bool handling;
  //   final List<TextEditingController> controllers;
  //   final List<FocusNode> nodes;

  //   const OtpState({
  //     this.handling = false,
  //     required this.controllers,
  //     required this.nodes,
  //   });

  //   OtpState copyWith({bool? handling}) {
  //     return OtpState(
  //       handling: handling ?? this.handling,
  //       controllers: controllers,
  //       nodes: nodes,
  //     );
  //   }
  // }
