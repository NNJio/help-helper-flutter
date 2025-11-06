import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  Future<UserCredential> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception('cancelled');
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await _auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    // ออกจาก Firebase (ทุก provider)
    await _auth.signOut();

    // ถ้ามี Google Sign-In session อยู่ด้วย
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      print('ไม่พบ Google session หรือออกจากระบบแล้ว');
    }

    print('ออกจากระบบเรียบร้อย');
  }
}
