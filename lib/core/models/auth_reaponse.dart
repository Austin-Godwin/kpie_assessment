
class ApiResponse<T> {
  final T? data;

  ApiResponse({this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json, {T Function(Map<String, dynamic>)? parser}) {
    return ApiResponse<T>(
      data: parser != null ? parser(json) : null
    );
  }
}