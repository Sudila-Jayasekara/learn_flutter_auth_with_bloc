class AuthResponseModel {
  final String token;
  final String? message;

  const AuthResponseModel({
    required this.token,
    this.message,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      token: json['token'] ?? '',
      message: json['message'],
    );
  }
}