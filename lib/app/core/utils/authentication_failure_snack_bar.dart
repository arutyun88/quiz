import 'package:flutter/material.dart';
import 'package:quiz/app/core/model/failure.dart';
import 'package:quiz/gen/strings.g.dart';

void showAuthenticationFailureSnackBar(
  BuildContext context, {
  required AuthenticationFailureType type,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.horizontal,
      content: Text(
        _mapToText(type),
      ),
    ),
  );
}

String _mapToText(AuthenticationFailureType type) {
  return switch (type) {
    AuthenticationFailureType.credentials => t.authentication.failure.invalid_credentials,
    AuthenticationFailureType.tooManyRequests => t.authentication.failure.too_many_requests,
    AuthenticationFailureType.alreadyExist => t.authentication.failure.already_exist,
    AuthenticationFailureType.data || AuthenticationFailureType.unauthenticated => t.authentication.failure.unknown,
  };
}
