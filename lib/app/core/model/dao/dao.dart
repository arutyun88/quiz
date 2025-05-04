import 'dart:convert';

abstract interface class Dao<T> {
  String toJsonString();

  Map<String, dynamic> toJson();

  static T fromJsonString<T extends Dao<T>>(
    String jsonString,
    T Function(Map<String, dynamic>) fromJsonFactory,
  ) =>
      fromJsonFactory(jsonDecode(jsonString) as Map<String, dynamic>);
}
