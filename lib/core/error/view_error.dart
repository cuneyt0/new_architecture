import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/network/interfaces/base_network_model.dart';

class ViewError implements BaseNetworkModel<ViewError>, Exception {
  String? error;
  ViewError({required this.error});

  ViewError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    return data;
  }

  @override
  ViewError fromJson(Map<String, dynamic> json) => ViewError.fromJson(json);
}

extension ViewErrorExtension on BaseNetworkErrorType {
  ViewError get handleError => when(
      request: (error) {
        final decode = ViewError.fromJson(error.response?.data);
        return decode;
      },
      type: (error) => ViewError(error: error),
      connectivity: (error) => ViewError(error: error));
}
