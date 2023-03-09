abstract class Failure {
  String get message;
  String get title;

  String? getError(error) {
    try {
      if (error is String) {
        return error;
      } else if (error is List) {
        // ? String : list / map
        return error[0] is String ? error[0] : error[0][0];
      }
      final item = (error as Map).values.toList()[0];
      if (item is List) {
        // ? String : list / map
        return item[0] is String ? item[0] : item[0][0];
      }
      return item is String ? item : null;
    } catch (e) {
      return null;
    }
  }
}