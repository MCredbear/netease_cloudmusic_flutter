import 'package:encrypt/encrypt.dart';

String neLinuxAPI(String postData) {
  final neAPIKey = Key.fromUtf8('rFgB&h#%2?^eDg:Q');
  final neIV = IV.fromUtf8('');
  final neEncrypter = Encrypter(AES(neAPIKey, mode: AESMode.ecb));
  final neData = neEncrypter.encrypt(postData, iv: neIV);
  return "eparams=" + neData.base16.toUpperCase();
}
