import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class RouteUtils {
  static Future goToPage(BuildContext context, String route) {
    return Navigator.pushNamed(context, route);
  }

  static Future setRootPage(BuildContext context, String route) {
    return Navigator.pushNamedAndRemoveUntil(context, route, (r) => false);
  }

  static void goBack(BuildContext context) {
    return Navigator.pop(context);
  }

// Navigator.pushAndRemoveUntil(
//     context,
//     PageRouteBuilder(
//       pageBuilder: (_, __, ___) => Screen2(),
//       transitionDuration: Duration(seconds: 0),
//     ),
//     (route) => false);

// if (nav.route == AppRoutes.Home) {
//   // Navigator.popUntil(context, (route) {
//   //   return route.settings.name == nav.route;
//   // });
//   Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
// } else {
//   // Navigator.pushNamed(context, nav.route);

//   // Navigator.of(context)
//   //     .pushNamedAndRemoveUntil(nav.route, ModalRoute.withName(nav.route));

//   Navigator.pushNamedAndRemoveUntil(context, nav.route, (r) => false);
// }
}

class Utils {
  static Tuple2<String, String> encryptMap(
      {@required Map<String, dynamic> payload, @required String keyStr}) {
    final plainText = jsonEncode(payload);
    final key = encrypt.Key.fromUtf8(keyStr);
    final iv = encrypt.IV.fromLength(16);

    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return Tuple2(encrypted.base64, iv.base64);
  }

  static Map<String, dynamic> decodeMap(
      {@required String payload,
        @required String nonce,
        @required String keyStr}) {
    final key = encrypt.Key.fromUtf8(keyStr);
    final iv = encrypt.IV.fromBase64(nonce);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypt.Encrypted encrypted = encrypt.Encrypted.fromBase64(payload);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    try {
      return jsonDecode(decrypted);
    } catch (e) {
      return null;
    }
  }
}
