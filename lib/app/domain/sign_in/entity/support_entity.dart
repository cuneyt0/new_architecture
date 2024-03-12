import 'package:equatable/equatable.dart';

class SupportEntity extends Equatable {
  final String? url;
  final String? text;

  const SupportEntity({this.text, this.url});

  @override
  List<Object?> get props => [text, url];
}
