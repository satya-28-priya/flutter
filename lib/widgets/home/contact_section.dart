import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../config/constants.dart';
import '../../utils/responsive.dart';
import '../common/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: Responsive.sectionPadding(context),
      color: AppConstants.lightBg,
      child: Center(
        child: SizedBox(
          width: Responsive.contentWidth(context),
          child: Column(
            children: [
              const SectionTitle(
                title: 'Contact Us',
                subtitle: 'Get in touch with us for any queries',
              ),
              isMobile
                  ? Column(children: [
                      _buildContactInfo(),
                      const SizedBox(height: 32),
                      _buildContactForm(context),
                    ])
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildContactInfo()),
                        const SizedBox(width: 48),
                        Expanded(child: _buildContactForm(context)),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactItem(
          Icons.phone,
          'Phone',
          '+91 98765 43210',
        ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.2, end: 0),
        const SizedBox(height: 20),
        _buildContactItem(
          Icons.email,
          'Email',
          'info@meritzone.com',
        ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.2, end: 0),
        const SizedBox(height: 20),
        _buildContactItem(
          Icons.location_on,
          'Address',
          '123 Education Street, Learning City, India',
        ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.2, end: 0),
        const SizedBox(height: 32),
        Row(
          children: [
            _buildSocialIcon(Icons.facebook),
            const SizedBox(width: 12),
            _buildSocialIcon(Icons.link),
            const SizedBox(width: 12),
            _buildSocialIcon(Icons.play_circle),
            const SizedBox(width: 12),
            _buildSocialIcon(Icons.camera_alt),
          ],
        ).animate().fadeIn(delay: 400.ms),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppConstants.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppConstants.primaryColor, size: 24),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: AppConstants.textLight,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppConstants.textDark,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppConstants.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: AppConstants.primaryColor, size: 20),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Send us a message',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppConstants.textDark,
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Full Name',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Email Address',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Phone Number',
              prefixIcon: Icon(Icons.phone_outlined),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'Message',
              alignLabelWithHint: true,
              prefixIcon: Padding(
                padding: EdgeInsets.only(bottom: 60),
                child: Icon(Icons.message_outlined),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.send),
              label: const Text('Send Message'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.2, end: 0);
  }
}
