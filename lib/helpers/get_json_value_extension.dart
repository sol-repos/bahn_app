extension GetJsonValueExtension on Map<String, dynamic> {
  expectedType? getJsonValueFromPath<expectedType>(List<String> path) {
    dynamic value = this;
    for (var key in path) {
      if (value is Map<String, dynamic>) {
        value = value[key];
      } else {
        return null;
      }
    }
    if (value.runtimeType == expectedType) {
      return value;
    }
    return null;
  }
}