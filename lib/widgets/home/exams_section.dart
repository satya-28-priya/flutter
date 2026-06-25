import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../config/constants.dart';
import '../../utils/responsive.dart';
import '../common/section_title.dart';

class ExamsSection extends StatelessWidget {
  const ExamsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = Responsive.gridColumns(context);

    return Container(
      padding: Responsive.sectionPadding(context),
      child: Center(
        child: SizedBox(
          width: Responsive.contentWidth(context),
          child: Column(
            children: [
              const SectionTitle(
                title: 'Competitive Exams',
                subtitle:
                    'Comprehensive preparation for all major competitive examinations',
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: columns == 1 ? 1.3 : 0.9,
                ),
                itemCount: AppConstants.competitiveExams.length,
                itemBuilder: (context, index) {
                  return _buildExamCard(context, index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExamCard(BuildContext context, int index) {
    final exam = AppConstants.competitiveExams[index];
    final colors = [
      const Color(0xFF1565C0),
      const Color(0xFF2E7D32),
      const Color(0xFF6A1B9A),
      const Color(0xFFE65100),
      const Color(0xFF00838F),
      const Color(0xFFC62828),
    ];
    final color = colors[index % colors.length];

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Icon(Icons.emoji_events, color: Colors.white.withValues(alpha: 0.8), size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exam['name']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        exam['desc']!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildExamDetail(
                      Icons.person, 'Eligibility', exam['eligibility']!),
                  const SizedBox(height: 8),
                  _buildExamDetail(
                      Icons.assignment, 'Pattern', exam['pattern']!),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Enroll Now'),
                    ),
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
        .slideY(begin: 0.15, end: 0);
  }

  Widget _buildExamDetail(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: AppConstants.textLight),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppConstants.textLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppConstants.textDark,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
