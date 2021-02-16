// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInService {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
  
//   static final GoogleSignInService _googleSignInService = GoogleSignInService._();

//   factory GoogleSignInService() {
//     return _googleSignInService;
//   }

//   GoogleSignInService._();

//   Future<User> signInWithGoogle() async {
//     final GoogleSignInAccount googleSignInAccount =
//         await _googleSignIn.signIn();
//     final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );

//     final UserCredential authResult =
//         await _firebaseAuth.signInWithCredential(credential);
//     User user = authResult.user;

//     if (user != null) {
//       assert(!user.isAnonymous);
//       assert(await user.getIdToken() != null);

//       final User currentUser = _firebaseAuth.currentUser;
//       assert(user.uid == currentUser.uid);

//       return user;
//     }
//     return null;
//   }

//   Future<bool> isSignedIn() async {
//     return await _googleSignIn.isSignedIn();
//   }

//   Future signOutGoogle() async {
//     await _googleSignIn.signOut();
//   }
// }
