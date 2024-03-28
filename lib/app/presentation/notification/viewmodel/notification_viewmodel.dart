import 'package:architecture/core/base/viewmodel/base_viewmodel.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NotificationViewModel extends BaseViewModel {
  final FlutterTts flutterTts = FlutterTts();
  NotificationViewModel() {
    getAllNotifications();
  }

// speeching text
  Future<void> speech(String notificationText) async {
    await flutterTts.setLanguage('tr-TR');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(notificationText);
  }

  void getAllNotifications() {}
}
