import 'package:flutter_riverpod/flutter_riverpod.dart';

final editPasswordProvider = StateProvider<bool?>((ref) => null);
final otpVerifyIdProvider = StateProvider<String?>((ref) => null);
//! Mock OTP
// Test OTP เก็บ mock OTP หลายเบอร์
final mockOtpMapProvider = Provider<Map<String, String>>((ref) => {
      '+66914041144': '124444',
      '+66999999999': '999999',
    });

// เก็บเบอร์โทรปัจจุบันที่กำลัง verify
final currentPhoneProvider = StateProvider<String?>((ref) => null);
//! Mock OTP

final otpLoadingProvider = StateProvider<bool>((ref) => false);
final authMethodProvider = StateProvider<String?>((ref) => null);
