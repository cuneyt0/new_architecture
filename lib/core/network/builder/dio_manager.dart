import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class DioManager {
  final Dio dio = Dio();
}
