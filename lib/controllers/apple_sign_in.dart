// import 'package:apple_sign_in/apple_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';

// class AppleAuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<bool> get appleSignInAvailable => AppleSignIn.isAvailable();

//   Future<User> appleSignIn() async {
//     try {
//       final AuthorizationResult appleResult =
//           await AppleSignIn.performRequests([
//         AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
//       ]);

//       switch (appleResult.status) {
//         case AuthorizationStatus.authorized:
//           final appleIdCredential = appleResult.credential;
//           final oAuthProvider = OAuthProvider('apple.com');
//           final credential = oAuthProvider.credential(
//             idToken: String.fromCharCodes(appleIdCredential.identityToken),
//             accessToken:
//                 String.fromCharCodes(appleIdCredential.authorizationCode),
//           );
//           final authResult = await _auth.signInWithCredential(credential);
//           final user = authResult.user;
//           return user;
//           break;
//         case AuthorizationStatus.cancelled:
//           throw PlatformException(
//             code: 'ERROR_AUTHORIZATION_DENIED',
//             message: appleResult.error.toString(),
//           );
//           break;
//         case AuthorizationStatus.error:
//           throw PlatformException(
//             code: 'ERROR_ABORTED_BY_USER',
//             message: 'Sign in aborted by user',
//           );
//           break;
//         default:
//           throw UnimplementedError();
//       }
//     } catch (e) {
//       return null;
//     }
//   }
// }
