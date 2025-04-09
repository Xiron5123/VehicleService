import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import '../../models/service.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final Service service;
  final Map<String, String> vehicleInfo;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  const BookingConfirmationScreen({
    super.key,
    required this.service,
    required this.vehicleInfo,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '',
      decimalDigits: 0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Xác nhận đặt lịch'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thông tin đặt lịch',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ).animate().fadeIn().slideX(),
            const SizedBox(height: 24),
            _buildInfoCard(
              context,
              'Dịch vụ',
              service.name,
              Icons.build_outlined,
            ).animate().fadeIn().slideX(delay: 100.ms),
            const SizedBox(height: 16),
            _buildInfoCard(
              context,
              'Thời gian',
              '${DateFormat('dd/MM/yyyy').format(selectedDate)} - ${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}',
              Icons.access_time,
            ).animate().fadeIn().slideX(delay: 200.ms),
            const SizedBox(height: 16),
            _buildInfoCard(
              context,
              'Thông tin xe',
              '${vehicleInfo['brand']} ${vehicleInfo['model']} (${vehicleInfo['year']})\nBiển số: ${vehicleInfo['plateNumber']}',
              Icons.directions_car,
            ).animate().fadeIn().slideX(delay: 300.ms),
            if (vehicleInfo['note']?.isNotEmpty ?? false) ...[
              const SizedBox(height: 16),
              _buildInfoCard(
                context,
                'Ghi chú',
                vehicleInfo['note']!,
                Icons.note_outlined,
              ).animate().fadeIn().slideX(delay: 400.ms),
            ],
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng cộng',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '${currencyFormat.format(service.price)} VNĐ',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ).animate().fadeIn().slideX(delay: 500.ms),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // TODO: Handle booking submission
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Đặt lịch thành công!'),
                  ),
                );
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Xác nhận đặt lịch'),
            ).animate().fadeIn().slideX(delay: 600.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context,
    String title,
    String content,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
