import 'package:encrypt/encrypt.dart';

String linuxAPI(String postdata) {
  final linuxapikey = Key.fromUtf8('rFgB&h#%2?^eDg:Q');
  final iv = IV.fromUtf8('');
  final encrypter = Encrypter(AES(linuxapikey, mode: AESMode.ecb));
  final data = encrypter.encrypt(postdata, iv: iv);
  return "eparams=" + data.base16.toUpperCase();
}
