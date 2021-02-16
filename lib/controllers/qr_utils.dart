import 'dart:convert';


import 'package:flutter_apra/constants.dart';
import 'package:flutter_apra/controllers/utils.dart';
import 'package:tuple/tuple.dart';

class QrUtils {
  static String encodeQR(Map<String, dynamic> payload) {
    Tuple2<String, String> encrypted =
        Utils.encryptMap(payload: payload, keyStr: GlobalValues.qrCodeKey);
    String jsonStr =
        jsonEncode({"data": encrypted.item1, "token": encrypted.item2});
    return base64.encode(utf8.encode(jsonStr));
  }

  static Map<String, dynamic> decodeQR(String payload) {
    try {
      String jsonEncryptStr = utf8.decode(base64.decode(payload));
      Map<String, dynamic> jsonEncrypt = jsonDecode(jsonEncryptStr);
      if (!jsonEncrypt.containsKey("data") ||
          !jsonEncrypt.containsKey("token")) {
        return null;
      }
      Map<String, dynamic> decrypted = Utils.decodeMap(
          payload: jsonEncrypt["data"],
          nonce: jsonEncrypt["token"],
          keyStr: GlobalValues.qrCodeKey);
      return decrypted;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
