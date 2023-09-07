class EnumHelper {
  static T stringToEnum<T>(Iterable<T> values, String value) => values.firstWhere(
        (type) => type.toString().split('.').last == value,
      );

  static String enumToString(dynamic value) => value.toString().split('.').last;
}
