int asInt(dynamic value, {int defaultValue = 0}) {
  if (value is int) {
    return value;
  }
  if (value is num) {
    return value.toInt();
  }
  if (value is String) {
    final parsed = int.tryParse(value);
    if (parsed != null) {
      return parsed;
    }
  }
  return defaultValue;
}

double asDouble(dynamic value, {double defaultValue = 0}) {
  if (value is double) {
    return value;
  }
  if (value is num) {
    return value.toDouble();
  }
  if (value is String) {
    final parsed = double.tryParse(value);
    if (parsed != null) {
      return parsed;
    }
  }
  return defaultValue;
}

bool asBool(dynamic value, {bool defaultValue = false}) {
  if (value is bool) {
    return value;
  }
  if (value is String) {
    final lower = value.toLowerCase();
    if (lower == 'true') {
      return true;
    }
    if (lower == 'false') {
      return false;
    }
  }
  return defaultValue;
}

String asString(dynamic value, {String defaultValue = ''}) {
  if (value is String) {
    return value;
  }
  if (value != null) {
    return value.toString();
  }
  return defaultValue;
}
