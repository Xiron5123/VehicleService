import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: _buildMenuItems(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: Text(
              'NT',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Nguyễn Văn A',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            'example@email.com',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withOpacity(0.8),
                ),
          ),
        ],
      ),
    ).animate().fadeIn().slideX();
  }

  Widget _buildMenuItems(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _DrawerItem(
          icon: Icons.home_outlined,
          title: 'Trang chủ',
          onTap: () {
            Navigator.pop(context);
            // TODO: Navigate to home if not already there
          },
        ),
        _DrawerItem(
          icon: Icons.build_outlined,
          title: 'Dịch vụ sửa chữa',
          onTap: () {
            Navigator.pop(context);
            // TODO: Navigate to repair services
          },
        ),
        _DrawerItem(
          icon: Icons.car_rental,
          title: 'Thuê xe',
          onTap: () {
            Navigator.pop(context);
            // TODO: Navigate to car rental
          },
        ),
        _DrawerItem(
          icon: Icons.history,
          title: 'Lịch sử đặt lịch',
          onTap: () {
            Navigator.pop(context);
            // TODO: Navigate to booking history
          },
        ),
        const Divider(),
        _DrawerItem(
          icon: Icons.person_outline,
          title: 'Tài khoản',
          onTap: () {
            Navigator.pop(context);
            // TODO: Navigate to account screen
          },
        ),
        _DrawerItem(
          icon: Icons.settings_outlined,
          title: 'Cài đặt',
          onTap: () {
            Navigator.pop(context);
            // TODO: Navigate to settings
          },
        ),
        _DrawerItem(
          icon: Icons.help_outline,
          title: 'Trợ giúp',
          onTap: () {
            Navigator.pop(context);
            // TODO: Show help dialog
          },
        ),
        const Divider(),
        _DrawerItem(
          icon: Icons.logout,
          title: 'Đăng xuất',
          textColor: Colors.red,
          onTap: () {
            Navigator.pop(context);
            // TODO: Show logout confirmation
          },
        ),
      ],
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      onTap: onTap,
    ).animate().fadeIn().slideX();
  }
} 