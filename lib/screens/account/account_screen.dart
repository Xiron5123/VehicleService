import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../auth/login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual auth check
    final bool isLoggedIn = true;
    final userInfo = {
      'name': 'Đỗ Nam',
      'email': 'example@email.com',
      'phone': '+84 123 456 789',
      'initials': 'ĐN',
    };

    void handleLogout() {
      // TODO: Clear user session/token here
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false, // This will remove all routes from the stack
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue,
                child: Text(
                  userInfo['initials']!,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ).animate().fadeIn(duration: 600.ms),
              if (isLoggedIn) ...[
                const SizedBox(height: 12),
                Text(
                  userInfo['name']!,
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ).animate().fadeIn(duration: 600.ms),
                Text(
                  userInfo['email']!,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ).animate().fadeIn(duration: 600.ms),
                Text(
                  userInfo['phone']!,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ).animate().fadeIn(duration: 600.ms),
              ] else ...[
                const SizedBox(height: 20),
                Text(
                  'Vui lòng đăng nhập để xem thông tin tài khoản',
                  style: Theme.of(context).textTheme.bodyLarge,
                ).animate().fadeIn(duration: 600.ms),
              ],
              const SizedBox(height: 24),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Thông tin cá nhân'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // TODO: Navigate to personal information screen
                },
              ).animate().fadeIn().slideX(begin: 0.3),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Lịch sử đặt lịch'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // TODO: Navigate to booking history screen
                },
              ).animate().fadeIn().slideX(begin: 0.3),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Cài đặt'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // TODO: Navigate to settings screen
                },
              ).animate().fadeIn().slideX(begin: 0.3),
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: const Text('Trợ giúp'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // TODO: Navigate to help screen
                },
              ).animate().fadeIn().slideX(begin: 0.3),
              if (isLoggedIn)
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.red[700]),
                  title: Text(
                    'Đăng xuất',
                    style: TextStyle(
                      color: Colors.red[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: handleLogout,
                ).animate().fadeIn().slideX(begin: 0.3),
            ],
          ),
        ),
      ),
    );
  }
}
