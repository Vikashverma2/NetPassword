import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

Future<bool> isPasswordLeaked(String password) async {
  // Convert password to SHA-1 hash
  final bytes = utf8.encode(password);
  final digest = sha1.convert(bytes);
  final sha1Hash = digest.toString().toUpperCase();

  // Take the first 5 characters
  final prefix = sha1Hash.substring(0, 5);
  final suffix = sha1Hash.substring(5);

  // Call the Have I Been Pwned API
  final url = Uri.parse('https://api.pwnedpasswords.com/range/$prefix');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // Check if the suffix is in the list
    final lines = response.body.split('\n');
    for (var line in lines) {
      if (line.startsWith(suffix)) {
        return true; // Password has been leaked
      }
    }
  }

  return false; // Password is safe
}
