class ValidationHelpers {
  static String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName cannot be empty';
    }
    return null;
  }

  static String? validateNumber(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) return '$fieldName required';
    final number = double.tryParse(value);
    if (number == null) return '$fieldName must be a number';
    return null;
  }
}
