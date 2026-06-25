class Exam {
  final int? id;
  final String name;
  final String eligibility;
  final String examPattern;
  final String syllabus;
  final String preparationStrategy;
  final bool courseAvailable;
  final String? description;

  Exam({
    this.id,
    required this.name,
    required this.eligibility,
    required this.examPattern,
    this.syllabus = '',
    this.preparationStrategy = '',
    this.courseAvailable = true,
    this.description,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      eligibility: json['eligibility'] as String? ?? '',
      examPattern: json['exam_pattern'] as String? ?? '',
      syllabus: json['syllabus'] as String? ?? '',
      preparationStrategy: json['preparation_strategy'] as String? ?? '',
      courseAvailable: json['course_available'] as bool? ?? true,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'eligibility': eligibility,
      'exam_pattern': examPattern,
      'syllabus': syllabus,
      'preparation_strategy': preparationStrategy,
      'course_available': courseAvailable,
      'description': description,
    };
  }
}
