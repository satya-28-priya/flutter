import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'Merit Zone';
  static const String tagline = 'Your Gateway To Success';
  static const String baseUrl = 'http://localhost:8000/api';

  // Colors
  static const Color primaryColor = Color(0xFF1565C0);
  static const Color secondaryColor = Color(0xFF0D47A1);
  static const Color accentColor = Color(0xFFFFA726);
  static const Color darkBg = Color(0xFF0A1628);
  static const Color lightBg = Color(0xFFF5F7FA);
  static const Color cardBg = Colors.white;
  static const Color textDark = Color(0xFF1A1A2E);
  static const Color textLight = Color(0xFF6B7280);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFE53935);

  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  // Menu items
  static const List<String> menuItems = [
    'Home',
    'About Us',
    'Courses',
    'Competitive Exams',
    'Online Student',
    'Offline Student',
    'Test Series',
    'Study Materials',
    'Store',
    'Contact',
  ];

  // Banner data
  static const List<Map<String, String>> banners = [
    {
      'title': 'Merit Zone - Your Gateway To Success',
      'subtitle': 'Learn. Practice. Achieve.',
    },
    {
      'title': 'Prepare Smarter. Achieve Better.',
      'subtitle': 'Build Your Future With Expert Guidance',
    },
    {
      'title': 'Online + Offline Learning Platform',
      'subtitle': 'Complete LMS Experience',
    },
  ];

  // Counter data
  static const List<Map<String, dynamic>> counters = [
    {'label': 'Students Trained', 'value': 5000, 'icon': Icons.people},
    {'label': 'Courses Available', 'value': 120, 'icon': Icons.menu_book},
    {'label': 'Tests Conducted', 'value': 8500, 'icon': Icons.assignment},
    {'label': 'Success Rate', 'value': 95, 'icon': Icons.trending_up, 'suffix': '%'},
  ];

  // LMS Features
  static const List<Map<String, dynamic>> lmsFeatures = [
    {'title': 'AI Chatbot', 'icon': Icons.smart_toy, 'desc': 'Get instant answers to your doubts with our AI-powered chatbot'},
    {'title': 'Doubt Support', 'icon': Icons.help_center, 'desc': 'Connect with faculty for personalized doubt resolution'},
    {'title': 'Mock Tests', 'icon': Icons.quiz, 'desc': 'Practice with realistic mock tests for all competitive exams'},
    {'title': 'Weekly Tests', 'icon': Icons.event_note, 'desc': 'Regular assessments to track your preparation progress'},
    {'title': 'Performance Analysis', 'icon': Icons.analytics, 'desc': 'Detailed analytics and insights on your performance'},
    {'title': 'Student Dashboard', 'icon': Icons.dashboard, 'desc': 'Centralized dashboard to manage your learning journey'},
    {'title': 'Progress Tracking', 'icon': Icons.trending_up, 'desc': 'Track your learning progress with visual charts'},
    {'title': 'Payment Tracking', 'icon': Icons.payment, 'desc': 'Easy and secure payment management system'},
    {'title': 'Certificates', 'icon': Icons.card_membership, 'desc': 'Earn certificates upon successful course completion'},
  ];

  // Competitive exams
  static const List<Map<String, String>> competitiveExams = [
    {'name': 'UPSC', 'eligibility': 'Graduate in any discipline', 'pattern': 'Prelims + Mains + Interview', 'desc': 'Civil Services Examination'},
    {'name': 'SSC', 'eligibility': '10th / 12th / Graduate', 'pattern': 'Tier I + Tier II + Tier III', 'desc': 'Staff Selection Commission'},
    {'name': 'Banking', 'eligibility': 'Graduate with valid percentage', 'pattern': 'Prelims + Mains + Interview', 'desc': 'IBPS PO, Clerk, SBI Exams'},
    {'name': 'Railways', 'eligibility': '10th / 12th / ITI / Graduate', 'pattern': 'CBT + Physical Test', 'desc': 'RRB NTPC, Group D, ALP'},
    {'name': 'State Govt', 'eligibility': 'Varies by state and post', 'pattern': 'Written + Interview', 'desc': 'State PSC & Government Exams'},
    {'name': 'Entrance Exams', 'eligibility': '10+2 with relevant subjects', 'pattern': 'MCQ Based / Written', 'desc': 'JEE, NEET, GATE, CAT'},
  ];
}
