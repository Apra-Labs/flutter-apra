// import 'package:firebase_auth/firebase_auth.dart';

// class PhoneAuthService {
//   String _verificationId;
//   String _phoneNumber;
//   int _forceResendingToken;

//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   static final PhoneAuthService _phoneAuthService =
//       PhoneAuthService._internal();

//   factory PhoneAuthService() {
//     return _phoneAuthService;
//   }

//   PhoneAuthService._internal();

//   Future<void> verifyPhone(phone, {Function(String) onError}) async {
//     if (_phoneNumber != null && phone != _phoneNumber) {
//       _forceResendingToken = null;
//     }

//     final PhoneCodeSent _codeSent =
//         (String verificationId, int forceResendingToken) {
//       _verificationId = verificationId;
//       _forceResendingToken = forceResendingToken;
//     };

//     final PhoneCodeAutoRetrievalTimeout _autoRetrievalTimeout =
//         (String verificationId) {
//       _verificationId = verificationId;
//     };

//     final PhoneVerificationFailed _phoneVerificationFailed =
//         (FirebaseAuthException exception) {
//       if (onError != null) onError(exception.message);
//       print('Verification Failed ${exception.message}');
//     };

//     final PhoneVerificationCompleted _phoneVerificationCompleted =
//         (AuthCredential credential) async {
//       final UserCredential result =
//           await _firebaseAuth.signInWithCredential(credential);

//       final User user = result.user;
//       if (user != null) {
//         print('User Auto verified : $user');
//         return user;
//       }
//     };
//     await _firebaseAuth.verifyPhoneNumber(
//         phoneNumber: phone,
//         timeout: Duration(seconds: 120),
//         verificationCompleted: _phoneVerificationCompleted,
//         codeAutoRetrievalTimeout: _autoRetrievalTimeout,
//         codeSent: _codeSent,
//         verificationFailed: _phoneVerificationFailed,
//         forceResendingToken: _forceResendingToken);
//     _phoneNumber = phone;
//   }

//   Future<User> verifyOTP(String code) async {
//     AuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId, smsCode: code);

//     final UserCredential result =
//         await _firebaseAuth.signInWithCredential(credential);

//     final User user = result.user;

//     if (user != null) {
//       print('Authentication Successful: $user');
//       return user;
//     }
//     return null;
//   }
// }
