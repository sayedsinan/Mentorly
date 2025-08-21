class Login {
  final String email;
  final String password;
  const Login({required this.email, required this.password});
  Map<String, dynamic> toJson() {
    return {
      'email':email,
      'password':password
    };
  }
}
