import 'dart:convert';

import 'package:architecture/app/data/datasource/local/application/application_local_datasource.dart';
import 'package:architecture/core/getIt/injection.dart';
import 'package:architecture/core/network/builder/third_party_managers.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ApplicationLocalDataSource)
class UserLocalDataSourceImpl extends ApplicationLocalDataSource {
  final secureStorage = getIt<ThirdPartyManagers>().storage;
  final String _authorizationKey = "AUTHORIZATION_KEY";
  final String _secureKey = "SECURE_KEY";

  @override
  Future<String> getAuthorizationKey() async {
    final authorizationKey = await secureStorage.read(key: _authorizationKey);
    if (authorizationKey == null || authorizationKey.isEmpty == true) {
      return "";
    } else {
      return authorizationKey;
    }
  }

  @override
  Future<void> saveAuthorizationKey(String key) async {
    await secureStorage.write(key: _authorizationKey, value: "Bearer $key");
  }

  @override
  Future<String?> getSecureKey() async {
    return await secureStorage.read(key: _secureKey);
  }

  @override
  Future<void> saveSecureKey(List<int> key) async {
    await secureStorage.write(key: _secureKey, value: base64UrlEncode(key));
  }
}
