// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// class FacebookSignInService {

//   static final FacebookSignInService _facebookSignInService =
//       FacebookSignInService._();

//   factory FacebookSignInService() {
//     return _facebookSignInService;
//   }

//   FacebookSignInService._();

//   Future<dynamic> signInWithFacebook() async {
//     try {
//       await FacebookAuth.instance.login();
//       final userData = await FacebookAuth.instance.getUserData();
//       return userData;
//     } on FacebookAuthException catch (e) {
//       switch (e.errorCode) {
//         case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
//           print("You have a previous login operation in progress");
//           return null;
//           break;
//         case FacebookAuthErrorCode.CANCELLED:
//           print("login cancelled");
//           return null;
//           break;
//         case FacebookAuthErrorCode.FAILED:
//           print("login failed");
//           return null;
//           break;
//       }
//     }
//   }

//   Future<bool> isSignedIn() async {
//     final AccessToken accessToken = await FacebookAuth.instance.isLogged;
//     if (accessToken != null) return true;
//     return false;
//   }

//   Future<void> logOut() async {
//     await FacebookAuth.instance.logOut();
//   }
// }
