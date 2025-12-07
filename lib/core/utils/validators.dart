typedef Validator = String? Function(String? value);

class Validators {
  // Precompiled email regex
  static final RegExp _emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

  // Check if field is not empty
  static Validator required({String? fieldName, String? errorText}) {
    return (value) {
      if (value == null || value.isEmpty) {
        return errorText ?? "$fieldName is required";
      }
      return null;
    };
  }

  // Minimum length
  static Validator minLength({
    String? fieldName,
    required int min,
    String? errorText,
  }) {
    return (value) {
      if (value != null && value.length < min) {
        return errorText ?? "$fieldName must be at least $min characters";
      }
      return null;
    };
  }

  // Maximum length
  static Validator maxLength({
    String? fieldName,
    required int max,
    String? errorText,
  }) {
    return (value) {
      if (value != null && value.length > max) {
        return errorText ?? "$fieldName must be at most $max characters";
      }
      return null;
    };
  }

  // Email format
  static Validator email({String? errorText}) {
    return (value) {
      if (value == null || value.isEmpty) return null;
      if (!_emailRegex.hasMatch(value)) {
        return errorText ?? "Enter a valid email";
      }
      return null;
    };
  }
}

String? validate(List<Validator> validators, String? value) {
  for (var validator in validators) {
    final result = validator(value);
    if (result != null) return result; // Stop at first error
  }
  return null;
}
