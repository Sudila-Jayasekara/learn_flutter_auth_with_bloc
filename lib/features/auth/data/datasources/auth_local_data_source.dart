import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learn_flutter_auth_with_bloc/core/error/exceptions.dart';

abstract class AuthLocalDataSource {
  Future<void> storeToken(String token);
  Future<String?> getToken();
  Future<void> removeToken();
  Future<bool> hasToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage secureStorage;
  static const String _tokenKey = 'auth_token';

  AuthLocalDataSourceImpl(this.secureStorage);

  @override
  Future<void> storeToken(String token) async {
    try {
      await secureStorage.write(key: _tokenKey, value: token);
    } catch (e) {
      throw CacheException('Failed to store token: $e');
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      return await secureStorage.read(key: _tokenKey);
    } catch (e) {
      throw CacheException('Failed to get token: $e');
    }
  }

  @override
  Future<void> removeToken() async {
    try {
      await secureStorage.delete(key: _tokenKey);
    } catch (e) {
      throw CacheException('Failed to remove token: $e');
    }
  }

  @override
  Future<bool> hasToken() async {
    try {
      final token = await secureStorage.read(key: _tokenKey);
      return token != null && token.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}