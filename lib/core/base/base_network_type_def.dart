import 'package:architecture/core/result/result.dart';

typedef ResultDecode<K, E extends Exception> = Future<Result<K, E>>;
