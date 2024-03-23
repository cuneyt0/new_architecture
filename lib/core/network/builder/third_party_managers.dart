import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class ThirdPartyManagers {
  final Dio dio = Dio();
  final storage = const FlutterSecureStorage();
}
