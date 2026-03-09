class AuthTokens {
  final String accessToken;

  const AuthTokens({
    required this.accessToken,
  });

  factory AuthTokens.fromJson(Map<String, dynamic> json) => AuthTokens(
        accessToken: json['access_token'],
      );

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
      };
}
