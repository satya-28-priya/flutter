import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../config/constants.dart';
import '../../utils/responsive.dart';
import '../common/section_title.dart';
import '../common/animated_counter.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAboutContent(context),
        _buildCounterSection(context),
      ],
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Container(
      padding: Responsive.sectionPadding(context),
      child: Center(
        child: SizedBox(
          width: Responsive.contentWidth(context),
          child: Column(
            children: [
              const SectionTitle(
                title: 'About Merit Zone',
                subtitle:
                    'Empowering students with quality education and expert guidance',
              ),
              isMobile
                  ? Column(children: [
                      _buildAboutInfo(context),
                      const SizedBox(height: 32),
                      _buildTimeline(context),
                    ])
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildAboutInfo(context)),
                        const SizedBox(width: 48),
                        Expanded(child: _buildTimeline(context)),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoCard(
          'Our Vision',
          'To become India\'s most trusted platform for competitive exam preparation, making quality education accessible to every aspirant.',
          Icons.visibility,
        ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.2, end: 0),
        const SizedBox(height: 20),
        _buildInfoCard(
          'Our Mission',
          'Providing comprehensive, affordable, and technology-driven learning solutions that bridge the gap between potential and achievement.',
          Icons.flag,
        ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.2, end: 0),
        const SizedBox(height: 20),
        _buildInfoCard(
          'Teaching Methodology',
          'Our expert faculty uses a blend of interactive lectures, real-world examples, practice sessions, and personalized mentoring.',
          Icons.psychology,
        ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.2, end: 0),
      ],
    );
  }

  Widget _buildInfoCard(String title, String description, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppConstants.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child:
                Icon(icon, color: AppConstants.primaryColor, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppConstants.textLight,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    final items = [
      {'year': '2020', 'title': 'Founded', 'desc': 'Merit Zone was established with a vision to transform education.'},
      {'year': '2021', 'title': 'Online Launch', 'desc': 'Launched our online platform reaching students across India.'},
      {'year': '2022', 'title': 'Expansion', 'desc': 'Expanded to multiple cities with offline coaching centers.'},
      {'year': '2023', 'title': 'AI Integration', 'desc': 'Introduced AI-powered learning tools and analytics.'},
      {'year': '2024', 'title': 'LMS Platform', 'desc': 'Launched comprehensive LMS with advanced features.'},
    ];

    return Column(
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return _buildTimelineItem(
          item['year']!,
          item['title']!,
          item['desc']!,
          isLast: index == items.length - 1,
        ).animate().fadeIn(delay: Duration(milliseconds: 150 * index));
      }).toList(),
    );
  }

  Widget _buildTimelineItem(
    String year,
    String title,
    String description, {
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              year,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppConstants.primaryColor,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: AppConstants.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: AppConstants.primaryColor.withValues(alpha: 0.3),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppConstants.primaryColor.withValues(alpha: 0.3),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppConstants.textLight,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterSection(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 64,
        vertical: 60,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppConstants.primaryColor, AppConstants.secondaryColor],
        ),
      ),
      child: Center(
        child: SizedBox(
          width: Responsive.contentWidth(context),
          child: Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.spaceEvenly,
            children: AppConstants.counters.map((counter) {
              return SizedBox(
                width: isMobile ? 140 : 200,
                child: AnimatedCounter(
                  targetValue: counter['value'] as int,
                  label: counter['label'] as String,
                  icon: counter['icon'] as IconData,
                  suffix: (counter['suffix'] as String?) ?? '+',
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
