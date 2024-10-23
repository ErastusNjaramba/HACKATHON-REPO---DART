bool isPalindrome(String input) {
  // Remove non-alphanumeric characters and convert to lowercase
  String cleanedInput = input.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toLowerCase();

  // Compare the cleaned string with its reverse
  return cleanedInput == cleanedInput.split('').reversed.join('');
}

bool isNumericPalindrome(num input) {
  // Convert the number to a string and check if it's a palindrome
  return isPalindrome(input.toString());
}

void main() {
  // Test cases for strings
  print(isPalindrome("A man, a plan, a canal, Panama")); // true
  print(isPalindrome("racecar")); // true
  print(isPalindrome("hello")); // false

  // Test cases for numbers
  print(isNumericPalindrome(12321)); // true
  print(isNumericPalindrome(12345)); // false
}