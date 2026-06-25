import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../config/constants.dart';
import '../../utils/responsive.dart';
import '../common/section_title.dart';

class StudentRegistrationSection extends StatelessWidget {
  const StudentRegistrationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Container(
      padding: Responsive.sectionPadding(context),
      child: Center(
        child: SizedBox(
          width: Responsive.contentWidth(context),
          child: Column(
            children: [
              const SectionTitle(
                title: 'Student Registration',
                subtitle: 'Choose your preferred mode of learning',
              ),
              isMobile
                  ? Column(
                      children: [
                        _buildCard(
                          context,
                          title: 'Online Student',
                          icon: Icons.laptop_mac,
                          color: AppConstants.primaryColor,
                          features: [
                            'Live interactive classes',
                            'Recorded video lectures',
                            'Online tests & quizzes',
                            'Digital notes & materials',
                            'Progress tracking dashboard',
                          ],
                          buttonText: 'Register Online',
                          index: 0,
                        ),
                        const SizedBox(height: 24),
                        _buildCard(
                          context,
                          title: 'Offline Student',
                          icon: Icons.school,
                          color: AppConstants.secondaryColor,
                          features: [
                            'Classroom training',
                            'Direct faculty support',
                            'Attendance management',
                            'Physical study materials',
                            'Regular examinations',
                          ],
                          buttonText: 'Register Offline',
                          index: 1,
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: _buildCard(
                            context,
                            title: 'Online Student',
                            icon: Icons.laptop_mac,
                            color: AppConstants.primaryColor,
                            features: [
                              'Live interactive classes',
                              'Recorded video lectures',
                              'Online tests & quizzes',
                              'Digital notes & materials',
                              'Progress tracking dashboard',
                            ],
                            buttonText: 'Register Online',
                            index: 0,
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          child: _buildCard(
                            context,
                            title: 'Offline Student',
                            icon: Icons.school,
                            color: AppConstants.secondaryColor,
                            features: [
                              'Classroom training',
                              'Direct faculty support',
                              'Attendance management',
                              'Physical study materials',
                              'Regular examinations',
                            ],
                            buttonText: 'Register Offline',
                            index: 1,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required List<String> features,
    required String buttonText,
    required int index,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 48, color: color),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 20),
            ...features.map(
              (feature) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: color, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        feature,
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppConstants.textDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 200 * index))
        .slideX(begin: index == 0 ? -0.2 : 0.2, end: 0);
  }
}
