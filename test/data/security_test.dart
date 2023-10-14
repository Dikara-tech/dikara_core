import 'package:dikara_core/dikara_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Security', () {
    late final AESEncrypt aesEncrypt;
    late final String encryptText;
    const plaintText = 'Hello World';

    setUpAll(() {
      aesEncrypt = GoEncryption.aes;
      encryptText = aesEncrypt.encrypt(plaintText);
    });

    test('AES Decrypt and Encrypt', () {
      final decryptResult = aesEncrypt.decrypt(encryptText);
      expect(decryptResult, plaintText);
    });
  });
}
