

import 'package:kpie_assessment/core/models/failure.dart';

class ApiException implements Failure {
  final String _title;
  final String _message;
  ApiException(this._title, this._message);

  // @override
  // String toString() => message;

  @override
  String get title => _title;

  @override
  String get message => _message;

  @override
  String? getError(error) {
    // TODO: implement getError
    throw UnimplementedError();
  }
}