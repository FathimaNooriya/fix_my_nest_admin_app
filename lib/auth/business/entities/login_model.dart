class LoginModel {
  final String email;
  final String password;
  LoginModel({required this.email, required this.password});
  Map<String, dynamic> toMap() {
    return {
      "Email": email,
      "Password": password,
    };
  }
}
