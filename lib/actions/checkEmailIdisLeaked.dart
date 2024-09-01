import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> isEmailLeaked(String email) async {
  final url =
      Uri.parse('https://haveibeenpwned.com/api/v3/breachedaccount/$email');

  final response = await http.get(
    url,
    headers: {
      'User-Agent': 'NextPass', // Replace with your app name
    },
  );

  if (response.statusCode == 200) {
    final breaches = jsonDecode(response.body);
    if (breaches.isNotEmpty) {
      return true; // Email has been leaked
    }
  } else if (response.statusCode == 404) {
    return false; // Email not found in any breaches
  }

  // Handle other status codes and errors
  throw Exception('Failed to check email breach status');
}
