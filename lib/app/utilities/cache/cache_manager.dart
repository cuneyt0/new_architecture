import 'package:architecture/app/data/model/response/sign_in/sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static HiveHelper shared = HiveHelper();
  static const userKey = 'userKey';
  static const userBoxKey = 'userBoxKey';

  Future<void> setupHive() async {
    await Hive.initFlutter();
    // Register TypeAdapters
    _initTypeAdapters();
    // Opening Boxes
    await _openBox();
  }

  Future<void> _openBox() async {
    await Hive.openBox<SignIn>(userBoxKey);
  }

  void _initTypeAdapters() {
    Hive.registerAdapter(SignInAdapter());
  }

  // CRUD Operations
  T? getData<T>({required String boxName, required dynamic key}) {
    final box = Hive.box<T>(boxName);
    return box.get(key);
  }

  Future<int> add<T>({required String boxName, required T data}) async {
    final box = Hive.box<T>(boxName);
    return await box.add(data);
  }

  Future<Iterable<int>> addAll<T>({
    required String boxName,
    required List<T> list,
  }) async {
    final box = Hive.box<T>(boxName);
    return await box.addAll(list);
  }

  Future<void> put<T>(
      {required String boxName,
      required dynamic data,
      required dynamic key}) async {
    var box = Hive.box<T>(boxName);
    await box.put(key, data);
  }

  Future<void> putAt<T>({
    required String boxName,
    required int index,
    required dynamic value,
  }) async {
    final box = Hive.box<T>(boxName);
    await box.putAt(index, value);
  }

  Future<void> delete<T>({
    required String boxName,
    required dynamic key,
  }) async {
    final box = Hive.box<T>(boxName);
    await box.delete(key);
  }

  Future<void> deleteAt<T>({
    required String boxName,
    required int index,
  }) async {
    final box = Hive.box<T>(boxName);
    await box.deleteAt(index);
  }

  List<T> getValues<T>({required String boxName}) {
    final box = Hive.box<T>(boxName);
    return box.values.toList();
  }

  List<dynamic> getKeys<T>({required String boxName}) {
    final box = Hive.box(boxName);
    return box.keys.toList();
  }

  ValueListenable<Box<T>> listenable<T>({required String boxName}) {
    final box = Hive.box<T>(boxName);
    return box.listenable();
  }

  Future<int> clear<T>({required String boxName}) {
    final box = Hive.box<T>(boxName);
    return box.clear();
  }

  Future<void> close<T>({required String boxName}) async {
    final box = Hive.box<T>(boxName);
    box.close();
  }

  bool containsKey<T>({required String boxName, dynamic key}) {
    final box = Hive.box<T>(boxName);
    return box.containsKey(key);
  }
}
