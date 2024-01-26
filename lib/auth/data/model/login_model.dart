class LoginModel {
  String? email;
  String? password;
  String? role;
  LoginModel({required this.email, required this.password, required this.role});

 LoginModel.fromjson(Map<String, dynamic> json) {
    email = json["Email"];
    password = json["Password"];
    role = json["Role"];
  }

   

  Map<String, dynamic> toMap() {
    return {
      "Email": email,
      "Password": password,
      "Role": role,
    };
  }
}
