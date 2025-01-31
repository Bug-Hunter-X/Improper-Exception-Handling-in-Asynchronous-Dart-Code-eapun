```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      //More specific error handling based on HTTP Status Code
      throw HttpException('HTTP error! Status: ${response.statusCode}', response.statusCode);
    }
  } on SocketException catch (e) {
    //Handle Network Errors specifically
    print('Network error: $e');
    return null; // Or throw a custom exception
  } on FormatException catch (e) {
    //Handle JSON decoding errors
    print('JSON decoding error: $e');
    return null; // Or throw a custom exception
  } on HttpException catch (e) {
    //Handle HTTP Exceptions specifically
    print('HTTP Exception: ${e.message} - ${e.statusCode}');
    return null; // Or throw a custom exception
  } catch (e) {
    //Handle other unexpected exceptions
    print('Unexpected error: $e');
    return null; // Or throw a custom exception
  }
}

class HttpException implements Exception{
  final String message;
  final int statusCode;
  HttpException(this.message, this.statusCode);
}
```