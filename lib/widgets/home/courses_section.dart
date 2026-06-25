import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../config/constants.dart';
import '../../models/course.dart';
import '../../providers/course_provider.dart';
import '../../utils/responsive.dart';
import '../common/section_title.dart';

class CoursesSection extends StatelessWidget {
  final List<Course>? courses;

  const CoursesSection({super.key, this.courses});

  @override
  Widget build(BuildContext context) {
    final displayCourses = courses ?? CourseProvider.demoCourses;
    final columns = Responsive.gridColumns(context);

    return Container(
      padding: Responsive.sectionPadding(context),
      color: AppConstants.lightBg,
      child: Center(
        child: SizedBox(
          width: Responsive.contentWidth(context),
          child: Column(
            children: [
              const SectionTitle(
                title: 'Our Courses',
                subtitle:
                    'Explore our comprehensive range of courses designed for competitive exam success',
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: columns == 1 ? 1.4 : 0.85,
                ),
                itemCount: displayCourses.length,
                itemBuilder: (context, index) {
                  return _buildCourseCard(context, displayCourses[index], index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, Course course, int index) {
    final levelColor = switch (course.level) {
      'Beginner' => AppConstants.successColor,
      'Advanced' => AppConstants.errorColor,
      _ => AppConstants.accentColor,
    };

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course image placeholder
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppConstants.primaryColor.withValues(alpha: 0.8),
                  AppConstants.secondaryColor.withValues(alpha: 0.6),
                ],
              ),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Center(
              child: Icon(
                Icons.menu_book,
                size: 48,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: levelColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          course.level,
                          style: TextStyle(
                            fontSize: 12,
                            color: levelColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        course.duration,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppConstants.textLight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    course.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.textDark,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Text(
                      course.description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppConstants.textLight,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '\u20B9${course.fee.toInt()}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppConstants.primaryColor,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        child: const Text('Enroll', style: TextStyle(fontSize: 13)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 100 * index))
        .scale(begin: const Offset(0.95, 0.95), end: const Offset(1, 1));
  }
}
