import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../utils/responsive.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _menuItems = [
    {'icon': Icons.dashboard, 'label': 'Dashboard'},
    {'icon': Icons.image, 'label': 'Banners'},
    {'icon': Icons.menu_book, 'label': 'Courses'},
    {'icon': Icons.quiz, 'label': 'Exams'},
    {'icon': Icons.people, 'label': 'Students'},
    {'icon': Icons.notifications, 'label': 'Notifications'},
    {'icon': Icons.star, 'label': 'Testimonials'},
    {'icon': Icons.library_books, 'label': 'Study Materials'},
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Panel',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      drawer: isMobile ? _buildDrawer() : null,
      body: Row(
        children: [
          if (!isMobile) _buildSidebar(),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppConstants.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.admin_panel_settings,
                    color: Colors.white, size: 40),
                const SizedBox(height: 8),
                const Text(
                  'Merit Zone',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Admin Dashboard',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ..._menuItems.asMap().entries.map((entry) {
            return ListTile(
              leading: Icon(entry.value['icon'] as IconData),
              title: Text(entry.value['label'] as String),
              selected: _selectedIndex == entry.key,
              onTap: () {
                setState(() => _selectedIndex = entry.key);
                Navigator.pop(context);
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: AppConstants.primaryColor,
            child: const Row(
              children: [
                Icon(Icons.admin_panel_settings,
                    color: Colors.white, size: 28),
                SizedBox(width: 12),
                Text(
                  'Admin Panel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: _menuItems.asMap().entries.map((entry) {
                final isSelected = _selectedIndex == entry.key;
                return Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppConstants.primaryColor.withValues(alpha: 0.1)
                        : null,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: Icon(
                      entry.value['icon'] as IconData,
                      color: isSelected
                          ? AppConstants.primaryColor
                          : AppConstants.textLight,
                    ),
                    title: Text(
                      entry.value['label'] as String,
                      style: TextStyle(
                        color: isSelected
                            ? AppConstants.primaryColor
                            : AppConstants.textDark,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                    onTap: () =>
                        setState(() => _selectedIndex = entry.key),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    final title = _menuItems[_selectedIndex]['label'] as String;

    return Container(
      color: AppConstants.lightBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppConstants.textDark,
              ),
            ),
          ),
          if (_selectedIndex == 0) _buildDashboardOverview(),
          if (_selectedIndex > 0)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _menuItems[_selectedIndex]['icon'] as IconData,
                      size: 64,
                      color: AppConstants.textLight.withValues(alpha: 0.3),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Manage $title',
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppConstants.textLight,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Content management features will be available here',
                      style: TextStyle(
                        color: AppConstants.textLight,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: Text('Add $title'),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDashboardOverview() {
    final stats = [
      {'label': 'Total Students', 'value': '5,234', 'icon': Icons.people, 'color': Colors.blue},
      {'label': 'Active Courses', 'value': '48', 'icon': Icons.menu_book, 'color': Colors.green},
      {'label': 'Tests Conducted', 'value': '1,256', 'icon': Icons.assignment, 'color': Colors.orange},
      {'label': 'Revenue', 'value': '\u20B912.5L', 'icon': Icons.account_balance_wallet, 'color': Colors.purple},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: stats.map((stat) {
          return SizedBox(
            width: 250,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: (stat['color'] as Color).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        stat['icon'] as IconData,
                        color: stat['color'] as Color,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stat['value'] as String,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppConstants.textDark,
                          ),
                        ),
                        Text(
                          stat['label'] as String,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppConstants.textLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
