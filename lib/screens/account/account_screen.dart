import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tài khoản'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const _ProfileHeader(),
            const SizedBox(height: 24),
            _buildSettingsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cài đặt',
          style: Theme.of(context).textTheme.titleLarge,
        ).animate().fadeIn().slideX(),
        const SizedBox(height: 16),
        _SettingsTile(
          icon: Icons.person_outline,
          title: 'Thông tin cá nhân',
          onTap: () {
            // TODO: Navigate to profile edit screen
          },
        ),
        _SettingsTile(
          icon: Icons.lock_outline,
          title: 'Đổi mật khẩu',
          onTap: () {
            // TODO: Navigate to change password screen
          },
        ),
        _SettingsTile(
          icon: Icons.history,
          title: 'Lịch sử đặt lịch',
          onTap: () {
            // TODO: Navigate to booking history screen
          },
        ),
        _SettingsTile(
          icon: Icons.language,
          title: 'Ngôn ngữ',
          trailing: const Text('Tiếng Việt'),
          onTap: () {
            // TODO: Show language selection dialog
          },
        ),
        _SettingsTile(
          icon: Icons.brightness_6,
          title: 'Giao diện',
          trailing: const Text('Sáng'),
          onTap: () {
            // TODO: Show theme selection dialog
          },
        ),
        _SettingsTile(
          icon: Icons.info_outline,
          title: 'Về ứng dụng',
          onTap: () {
            // TODO: Show about dialog
          },
        ),
        _SettingsTile(
          icon: Icons.logout,
          title: 'Đăng xuất',
          textColor: Colors.red,
          onTap: () {
            // TODO: Show logout confirmation dialog
          },
        ),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Text(
              'NT',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Nguyễn Văn A',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'example@email.com',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 8),
          Text(
            '+84 123 456 789',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
        ],
      ),
    ).animate().fadeIn().scale();
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
    this.textColor,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    ).animate().fadeIn().slideX();
  }
} 