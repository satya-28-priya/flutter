import 'package:flutter/material.dart';
import '../../widgets/home/navbar.dart';
import '../../widgets/home/hero_banner.dart';
import '../../widgets/home/student_registration_section.dart';
import '../../widgets/home/about_section.dart';
import '../../widgets/home/courses_section.dart';
import '../../widgets/home/exams_section.dart';
import '../../widgets/home/features_section.dart';
import '../../widgets/home/success_section.dart';
import '../../widgets/home/contact_section.dart';
import '../../widgets/home/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  // Section keys for scroll navigation
  final _aboutKey = GlobalKey();
  final _coursesKey = GlobalKey();
  final _examsKey = GlobalKey();
  final _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleMenuItemPressed(String item) {
    switch (item) {
      case 'About Us':
        _scrollToSection(_aboutKey);
        break;
      case 'Courses':
        _scrollToSection(_coursesKey);
        break;
      case 'Competitive Exams':
        _scrollToSection(_examsKey);
        break;
      case 'Contact':
        _scrollToSection(_contactKey);
        break;
      case 'Home':
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Navbar(
            onLoginPressed: () =>
                Navigator.of(context).pushNamed('/login'),
            onRegisterPressed: () =>
                Navigator.of(context).pushNamed('/register'),
            onMenuItemPressed: _handleMenuItemPressed,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const HeroBanner(),
                  const StudentRegistrationSection(),
                  KeyedSubtree(
                    key: _aboutKey,
                    child: const AboutSection(),
                  ),
                  KeyedSubtree(
                    key: _coursesKey,
                    child: const CoursesSection(),
                  ),
                  KeyedSubtree(
                    key: _examsKey,
                    child: const ExamsSection(),
                  ),
                  const FeaturesSection(),
                  const SuccessSection(),
                  KeyedSubtree(
                    key: _contactKey,
                    child: const ContactSection(),
                  ),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
