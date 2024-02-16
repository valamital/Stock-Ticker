import 'package:flutter/foundation.dart';

class ErrorHandling {
  static void handleError(dynamic error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('Error occurred: $error');
    }
  }
}
