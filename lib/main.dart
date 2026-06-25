import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/theme.dart';
import 'providers/auth_provider.dart';
import 'providers/course_provider.dart';
import 'screens/home/home_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/admin/admin_dashboard.dart';
import 'services/api_service.dart';
import 'services/auth_service.dart';
import 'services/course_service.dart';

void main() {
  runApp(const MeritZoneApp());
}

class MeritZoneApp extends StatelessWidget {
  const MeritZoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            authService: AuthService(api: apiService),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => CourseProvider(
            courseService: CourseService(api: apiService),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Merit Zone - Your Gateway To Success',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/admin': (context) => const AdminDashboard(),
        },
      ),
    );
  }
}
