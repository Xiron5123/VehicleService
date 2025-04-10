import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../models/vehicle.dart';
import '../../widgets/custom_button.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final Vehicle vehicle;
  final Map<String, dynamic> vehicleInfo;
  final DateTime bookingDate;
  final String timeSlot;

  const BookingConfirmationScreen({
    super.key,
    required this.vehicle,
    required this.vehicleInfo,
    required this.bookingDate,
    required this.timeSlot,
  });

  @override
  Widget build(BuildContext context) {
    final _currencyFormat = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Xác nhận đặt xe'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thông tin xe
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehicle.name,
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${vehicle.brand} ${vehicle.model} ${vehicle.year}',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${vehicle.type} • ${vehicle.transmission} • ${vehicle.seats} chỗ',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn().slideX(
                  begin: 0.2,
                  duration: 600.ms,
                ),

            const SizedBox(height: 16),

            // Thông tin người thuê
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thông tin người thuê',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('Họ tên', vehicleInfo['fullName']),
                    _buildInfoRow('Số điện thoại', vehicleInfo['phone']),
                    _buildInfoRow('Email', vehicleInfo['email']),
                    if (vehicleInfo['note'] != null &&
                        vehicleInfo['note'].isNotEmpty)
                      _buildInfoRow('Ghi chú', vehicleInfo['note']),
                  ],
                ),
              ),
            ).animate().fadeIn().slideX(
                  begin: 0.2,
                  duration: 600.ms,
                  delay: 200.ms,
                ),

            const SizedBox(height: 16),

            // Thông tin đặt xe
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thông tin đặt xe',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow(
                      'Ngày nhận xe',
                      DateFormat('dd/MM/yyyy').format(bookingDate),
                    ),
                    _buildInfoRow('Khung giờ', timeSlot),
                    _buildInfoRow(
                      'Tiền cọc',
                      '${_currencyFormat.format(vehicle.depositAmount)} VNĐ',
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn().slideX(
                  begin: 0.2,
                  duration: 600.ms,
                  delay: 400.ms,
                ),

            const SizedBox(height: 16),

            // Yêu cầu thuê xe
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yêu cầu thuê xe',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Giấy tờ cần thiết:',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...vehicle.requiredDocuments.map((doc) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 4),
                        child: Text(
                          '• $doc',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 16),
                    Text(
                      'Yêu cầu khác:',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...vehicle.rentalRequirements.map((req) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 4),
                        child: Text(
                          '• $req',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ).animate().fadeIn().slideX(
                  begin: 0.2,
                  duration: 600.ms,
                  delay: 600.ms,
                ),

            const SizedBox(height: 24),

            // Nút xác nhận
            CustomButton(
              text: 'Xác nhận đặt xe',
              onPressed: () {
                // TODO: Implement booking confirmation
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ).animate().fadeIn().slideY(
                  begin: 0.2,
                  duration: 600.ms,
                  delay: 800.ms,
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
