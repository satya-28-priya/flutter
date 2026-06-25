class Testimonial {
  final int? id;
  final String studentName;
  final String message;
  final String examName;
  final String rank;
  final int? rating;

  Testimonial({
    this.id,
    required this.studentName,
    required this.message,
    required this.examName,
    this.rank = '',
    this.rating,
  });

  factory Testimonial.fromJson(Map<String, dynamic> json) {
    return Testimonial(
      id: json['id'] as int?,
      studentName: json['student_name'] as String? ?? '',
      message: json['message'] as String? ?? '',
      examName: json['exam_name'] as String? ?? '',
      rank: json['rank'] as String? ?? '',
      rating: json['rating'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_name': studentName,
      'message': message,
      'exam_name': examName,
      'rank': rank,
      'rating': rating,
    };
  }
}
