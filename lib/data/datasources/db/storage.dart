import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static const userIdKey = 'userIdKey';
  static const fullnameKey = 'fullnameKey';
  static const tenantId = 'Tenant_id';
  static const secureKey = 'secureKey';
  static const roleDefaultIdKey = 'roleDefaultIdKey';
  static const tenantNameKey = 'tenantNameKey';
  static const tenantKey = 'tenantKey';
  static const tokenKey = 'tokenKey';
  final FlutterSecureStorage flutterSecureStorage;

  Storage({required this.flutterSecureStorage});
  // static Storage? _storage;
  // Storage._instance() {
  //   _storage = this;
  // }
  // // Future<flutterSecureStorage init() async {
  // //   flutterSecurestorage= const FlutterSecureflutterSecureStorage);
  // //   return this;
  // // }
  // factory Storage() => _storage ?? Storage._instance();

  // static FlutterSecureStorage? flutterSecurestorage
  // Future<FlutterSecureStorage?> get flutterSecureStorage async {
  //   _flutterSecurestorage ??= const FlutterSecureStorage();
  //   return _flutterSecurestorage;
  // }

  Future<bool> getBool(String key) async {
    return await flutterSecureStorage.read(key: key) == 'true';
  }

  Future<void> setBool(String key, bool val) async {
    return await flutterSecureStorage.write(
        key: key, value: val ? 'true' : 'false');
  }

  Future<String> getString(String key) async {
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  Future<void> setString(String key, String? val) async {
    return await flutterSecureStorage.write(key: key, value: val);
  }

  Future<void> deleteAll() async {
    return await flutterSecureStorage.deleteAll();
  }
}
