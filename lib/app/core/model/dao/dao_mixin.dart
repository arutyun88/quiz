import 'dart:convert';

mixin DaoMixin<T> {
  Map<String, dynamic> toJson();

  String toJsonString() => jsonEncode(toJson());
}
