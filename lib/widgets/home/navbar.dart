import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../utils/responsive.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onLoginPressed;
  final VoidCallback? onRegisterPressed;
  final Function(String)? onMenuItemPressed;

  const Navbar({
    super.key,
    this.onLoginPressed,
    this.onRegisterPressed,
    this.onMenuItemPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 64 : 16,
        ),
        child: Row(
          children: [
            _buildLogo(),
            const SizedBox(width: 16),
            if (isDesktop) Flexible(child: _buildDesktopMenu()),
            if (isDesktop) const SizedBox(width: 16),
            if (!isDesktop) const Spacer(),
            _buildAuthButtons(context),
            if (!isDesktop) _buildMobileMenuButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppConstants.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.school, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 12),
        const Text(
          'Merit Zone',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppConstants.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: AppConstants.menuItems.take(7).map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: TextButton(
              onPressed: () => onMenuItemPressed?.call(item),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppConstants.textDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAuthButtons(BuildContext context) {
    if (Responsive.isMobile(context)) return const SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
          onPressed: onLoginPressed,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: const Text('Login'),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: onRegisterPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: const Text('Register'),
        ),
      ],
    );
  }

  Widget _buildMobileMenuButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu, color: AppConstants.textDark),
      onPressed: () => _showMobileDrawer(context),
    );
  }

  void _showMobileDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    children: [
                      ...AppConstants.menuItems.map(
                        (item) => ListTile(
                          title: Text(item),
                          onTap: () {
                            Navigator.pop(context);
                            onMenuItemPressed?.call(item);
                          },
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  onLoginPressed?.call();
                                },
                                child: const Text('Login'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  onRegisterPressed?.call();
                                },
                                child: const Text('Register'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
