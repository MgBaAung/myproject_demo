import '../../helper/typedefs.dart';

class ResponseModel<T> {
  // ignore: library_private_types_in_public_api
  final _ResponseHeadersModel headers;
  final T body;

  const ResponseModel({
    required this.headers,
    required this.body,
  });
}

class _ResponseHeadersModel {
  final String error;
  final String message;
  final String? code;

  _ResponseHeadersModel({
    required this.error,
    required this.message,
    this.code,
  });

  factory _ResponseHeadersModel.fromJson(JSON json) {
    return _ResponseHeadersModel(
        error: json['error'] as String,
        message: json['message'] as String,
        code: json['code'] as String?);
  }
}
