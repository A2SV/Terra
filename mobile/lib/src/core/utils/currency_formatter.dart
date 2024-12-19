/// Formats a [value] as a currency string without any currency symbols.
/// It intelligently handles both integer and decimal values.
String formatMoney(num value) {
  bool isNegative = value < 0;
  value = value.abs();

  // Determine if the number has decimal places
  bool hasDecimal = value is double && (value % 1 != 0);

  String formattedNumber;

  if (hasDecimal) {
    // Ensure two decimal places
    String s = value.toStringAsFixed(2);
    List<String> parts = s.split('.');
    String integerPart = parts[0];
    String decimalPart = parts[1];

    // Insert commas for thousands
    String formattedInteger = '';
    int count = 0;

    for (int i = integerPart.length - 1; i >= 0; i--) {
      formattedInteger = integerPart[i] + formattedInteger;
      count++;
      if (count == 3 && i != 0) {
        formattedInteger = ',' + formattedInteger;
        count = 0;
      }
    }

    formattedNumber = '$formattedInteger.$decimalPart';
  } else {
    // Handle integer values
    int intValue = value.toInt();
    String s = intValue.toString();

    // Insert commas for thousands
    String formattedInteger = '';
    int count = 0;

    for (int i = s.length - 1; i >= 0; i--) {
      formattedInteger = s[i] + formattedInteger;
      count++;
      if (count == 3 && i != 0) {
        formattedInteger = ',$formattedInteger';
        count = 0;
      }
    }

    formattedNumber = formattedInteger;
  }

  return isNegative ? '-$formattedNumber' : formattedNumber;
}