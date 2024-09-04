import 'dart:math';

String checkPasswordStrength(String password) {
  int score = 0;

  // Length: Increase score for longer passwords
  if (password.length >= 8) score++;
  if (password.length >= 12) score++;
  if (password.length >= 16) score++;
  if (password.length >= 20) score++;

  // Contains both lower and uppercase
  bool hasUpperCase = password.contains(RegExp(r'[A-Z]'));
  bool hasLowerCase = password.contains(RegExp(r'[a-z]'));
  if (hasUpperCase && hasLowerCase) score++;

  // Contains numbers
  bool hasNumbers = password.contains(RegExp(r'\d'));
  if (hasNumbers) score++;

  // Contains special characters in random positions
  bool hasSpecialChars = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool specialCharInRandomPosition = false;

  if (hasSpecialChars && password.length > 2) {
    specialCharInRandomPosition = password
        .substring(1, password.length - 1)
        .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')); // Not at the start or end
  }

  if (hasSpecialChars && specialCharInRandomPosition) score++;

  // Avoid common patterns (e.g., "1234", "password", "qwerty")
  if (!password.contains(RegExp(r'(.)\1{2,}')) && // Avoid repeating characters
      !password.contains(RegExp(
          r'1234|abcd|password|qwerty|letmein|welcome|dragon|1111|passw0rd',
          caseSensitive: false))) score++;

  // Avoid keyboard patterns (e.g., "qwerty", "asdfgh")
  if (!password.contains(
      RegExp(r'qwerty|asdfgh|zxcvbn|1q2w3e4r|!@#\$%^&*', caseSensitive: false))) {
    score++;
  }

  // Bonus: Check entropy (measure of unpredictability)
  double entropy = calculateEntropy(password);
  if (entropy > 40) score++;
  if (entropy > 50) score++;

  // Evaluate score
  if (score <= 2) return 'Very Weak';
  if (score == 3) return 'Weak';
  if (score == 4) return 'Moderate';
  if (score == 5) return 'Strong';
  if (score >= 6 &&
      hasSpecialChars &&
      hasNumbers &&
      hasUpperCase &&
      hasLowerCase &&
      specialCharInRandomPosition) {
    return 'Very Strong';
  }

  return 'Strong';
}

// Example of calculating entropy (simplified version)
double calculateEntropy(String password) {
  Set<String> uniqueChars = password.split('').toSet();
  double poolSize = uniqueChars.length.toDouble();
  double length = password.length.toDouble();
  return length * (poolSize != 0 ? (log(poolSize) / log(2)) : 0.0);
}
