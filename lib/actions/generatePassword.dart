import 'dart:math';

String generatePassword({
  int length = 16,
  bool includeUppercase = true,
  bool includeLowercase = true,
  bool includeNumbers = true,
  bool includeSpecialCharacters = true,
}) {
  const String uppercaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String lowercaseLetters = 'abcdefghijklmnopqrstuvwxyz';
  const String numbers = '0123456789';
  const String specialCharacters = '!@#\$%^&*(),.?":{}|<>';

  String allowedChars = '';
  if (includeUppercase) allowedChars += uppercaseLetters;
  if (includeLowercase) allowedChars += lowercaseLetters;
  if (includeNumbers) allowedChars += numbers;
  if (includeSpecialCharacters) allowedChars += specialCharacters;

  if (allowedChars.isEmpty) {
    throw ArgumentError('At least one character set must be included.');
  }

  Random random = Random.secure();
  return List.generate(length, (index) {
    return allowedChars[random.nextInt(allowedChars.length)];
  }).join('');
}
