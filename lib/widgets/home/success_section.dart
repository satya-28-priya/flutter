import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../config/constants.dart';
import '../../utils/responsive.dart';
import '../common/section_title.dart';

class SuccessSection extends StatelessWidget {
  const SuccessSection({super.key});

  static const List<Map<String, String>> testimonials = [
    {
      'name': 'Priya Sharma',
      'exam': 'UPSC CSE',
      'rank': 'AIR 45',
      'message':
          'Merit Zone\'s structured approach and expert faculty helped me crack UPSC in my first attempt. The mock tests were incredibly helpful.',
    },
    {
      'name': 'Rahul Kumar',
      'exam': 'SSC CGL',
      'rank': 'Score: 210/300',
      'message':
          'The online classes and study materials provided by Merit Zone were top-notch. I could study from anywhere and track my progress easily.',
    },
    {
      'name': 'Sneha Patel',
      'exam': 'IBPS PO',
      'rank': 'Selected',
      'message':
          'Thank you Merit Zone! The banking preparation course covered everything I needed. The weekly tests kept me on track throughout.',
    },
    {
      'name': 'Amit Verma',
      'exam': 'RRB NTPC',
      'rank': 'Selected',
      'message':
          'Merit Zone made my railway exam preparation journey smooth and effective. The faculty support was exceptional.',
    },
  ];

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
                title: 'Student Success Stories',
                subtitle: 'Our students\' achievements speak for themselves',
              ),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: testimonials.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: isMobile ? 300 : 360,
                      child: _buildTestimonialCard(index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTestimonialCard(int index) {
    final testimonial = testimonials[index];
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor:
                      AppConstants.primaryColor.withValues(alpha: 0.1),
                  child: Text(
                    testimonial['name']![0],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        testimonial['name']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppConstants.textDark,
                        ),
                      ),
                      Text(
                        '${testimonial['exam']} - ${testimonial['rank']}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppConstants.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: List.generate(
                5,
                (i) => const Icon(
                  Icons.star,
                  color: AppConstants.accentColor,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                '"${testimonial['message']!}"',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppConstants.textLight,
                  height: 1.5,
                  fontStyle: FontStyle.italic,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 150 * index))
        .slideX(begin: 0.2, end: 0);
  }
}
