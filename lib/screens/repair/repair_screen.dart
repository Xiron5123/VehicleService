import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_button.dart';

class RepairScreen extends StatelessWidget {
  const RepairScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sửa chữa'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thông tin dịch vụ sửa chữa
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dịch vụ sửa chữa',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildServiceItem(
                      'Bảo dưỡng định kỳ',
                      'Thay dầu, lọc gió, kiểm tra hệ thống',
                      '500.000 VNĐ',
                    ),
                    _buildServiceItem(
                      'Sửa chữa động cơ',
                      'Kiểm tra, sửa chữa các vấn đề về động cơ',
                      '1.000.000 VNĐ',
                    ),
                    _buildServiceItem(
                      'Sửa chữa hệ thống điện',
                      'Kiểm tra, sửa chữa các vấn đề về điện',
                      '800.000 VNĐ',
                    ),
                    _buildServiceItem(
                      'Sửa chữa hệ thống phanh',
                      'Kiểm tra, sửa chữa hệ thống phanh',
                      '600.000 VNĐ',
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn().slideX(
                  begin: 0.2,
                  duration: 600.ms,
                ),

            const SizedBox(height: 16),

            // Thông tin liên hệ
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Liên hệ',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildContactItem(
                      Icons.phone,
                      'Hotline',
                      '1900 1234',
                    ),
                    _buildContactItem(
                      Icons.email,
                      'Email',
                      'support@vehicleservice.com',
                    ),
                    _buildContactItem(
                      Icons.location_on,
                      'Địa chỉ',
                      '123 Đường ABC, Quận XYZ, TP.HCM',
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn().slideX(
                  begin: 0.2,
                  duration: 600.ms,
                  delay: 200.ms,
                ),

            const SizedBox(height: 24),

            // Nút đặt lịch
            CustomButton(
              text: 'Đặt lịch sửa chữa',
              onPressed: () {
                // TODO: Navigate to booking screen
              },
            ).animate().fadeIn().slideY(
                  begin: 0.2,
                  duration: 600.ms,
                  delay: 400.ms,
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem(String title, String description, String price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
