double basicCalculator(double num1, double num2, String operator) {
  switch (operator) {
    case '+':
      return num1 + num2;
    case '-':
      return num1 - num2;
    case '*':
      return num1 * num2;
    case '/':
      if (num2 == 0) {
        throw Exception('Error: Division by zero');
      }
      return num1 / num2;
    case '%':
      if (num2 == 0) {
        throw Exception('Error: Modulo by zero');
      }
      return num1 % num2;
    default:
      throw Exception('Error: Invalid operator');
  }
}


double extendedCalculator(String expression) {
  try {
    List<String> tokens = expression.split(' ');
    double result = double.parse(tokens[0]);

    for (int i = 1; i < tokens.length; i += 2) {
      String operator = tokens[i];
      double nextNum = double.parse(tokens[i + 1]);

      result = basicCalculator(result, nextNum, operator);
    }

    return result;
  } catch (e) {
    throw Exception('Error: Invalid expression');
  }
}

void main() {
  try {
    String expression = '10 * 0 + 5';
    double result = extendedCalculator(expression);
    print('Result: $result');
  } catch (e) {
    print(e);
  }
}
