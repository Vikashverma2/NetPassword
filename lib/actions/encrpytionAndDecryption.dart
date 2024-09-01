import 'package:encrypt/encrypt.dart' as encrypt;

final encrypt.Key key = encrypt.Key.fromLength(32); // 32 bytes = 256 bits
final encrypt.IV iv = encrypt.IV.fromLength(16); // 16 bytes = 128 bits
final encrypt.Encrypter encrypter =
    encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

String encryptPassword(String password) {
  return encrypter.encrypt(password, iv: iv).base64;
}

String decryptPassword(String encryptedPassword) {
  return encrypter.decrypt64(encryptedPassword, iv: iv);
}
