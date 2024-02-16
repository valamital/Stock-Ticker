import 'package:http/http.dart' as http;

/// Extends the http.Response class to provide a method for handling various HTTP status codes.
extension HttpResponseExtension on http.Response {
  /// Utilizes Dart 3's new switch expression feature to handle different HTTP status codes
  String getErrorMessage() {
    return switch (statusCode) {
      > 400 && < 500 => "Client Error :$reasonPhrase",
      >= 500 && < 600 => 'Server Error :$reasonPhrase',
      404 => 'Not found',
      _ => 'Unknown Error: $reasonPhrase',
    };
  }
}
