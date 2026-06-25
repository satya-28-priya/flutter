class User {
  final int? id;
  final String name;
  final String email;
  final String mobile;
  final String role;
  final String studentType;
  final String? token;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.mobile,
    this.role = 'student',
    this.studentType = 'online',
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      role: json['role'] as String? ?? 'student',
      studentType: json['student_type'] as String? ?? 'online',
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'role': role,
      'student_type': studentType,
      'token': token,
    };
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? mobile,
    String? role,
    String? studentType,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      role: role ?? this.role,
      studentType: studentType ?? this.studentType,
      token: token ?? this.token,
    );
  }
}
