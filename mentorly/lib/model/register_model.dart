class RegisterModel {
  final String email;
  final String password;
  final String fullName;
  final String medium;
  final String board;
final List<String > strongSubjects;
  final List<String> weakSubjects;


  const RegisterModel({
    required this.email,
    required this.password,
    required this.fullName,
    required this.medium,
    required this.board,
    required this.strongSubjects,
    required this.weakSubjects,
 
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': fullName,
      'medium': medium,
      'syllabus': board,
      'strongSubjects': strongSubjects,
      'weakSubjects': weakSubjects,
     
    };
  }
}
