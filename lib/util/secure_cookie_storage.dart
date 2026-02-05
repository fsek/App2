import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageCookieStorage extends Storage {
  final FlutterSecureStorage _ss;
  final String _prefix;

  SecureStorageCookieStorage({
    FlutterSecureStorage? secureStorage,
    String prefix = 'cj_',
  })  : _ss = secureStorage ?? const FlutterSecureStorage(),
        _prefix = prefix;

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) async {}

  @override
  Future<String?> read(String key) => _ss.read(key: '$_prefix$key');

  @override
  Future<void> write(String key, String value) =>
      _ss.write(key: '$_prefix$key', value: value);

  @override
  Future<void> delete(String key) => _ss.delete(key: '$_prefix$key');

  @override
  Future<void> deleteAll(List<String> keys) async {
    _ss.deleteAll();
  }
}
