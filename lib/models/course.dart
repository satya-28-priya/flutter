class Course {
  final int? id;
  final String name;
  final String description;
  final String duration;
  final double fee;
  final String level;
  final String? imageUrl;
  final bool isActive;

  Course({
    this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.fee,
    required this.level,
    this.imageUrl,
    this.isActive = true,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      duration: json['duration'] as String? ?? '',
      fee: (json['fee'] as num?)?.toDouble() ?? 0.0,
      level: json['level'] as String? ?? 'Beginner',
      imageUrl: json['image_url'] as String?,
      isActive: json['is_active'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'duration': duration,
      'fee': fee,
      'level': level,
      'image_url': imageUrl,
      'is_active': isActive,
    };
  }
}
