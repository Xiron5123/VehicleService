import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mockBookings = [
      {
        'type': 'rental',
        'title': 'Toyota Camry 2023',
        'date': '17/04/2023 - 13/04/2023',
        'status': 'pending',
        'note': 'Cần giao xe tại sân bay',
        'price': 3600000,
      },
      {
        'type': 'repair',
        'title': 'Thay dầu động cơ',
        'date': '15/03/2024',
        'status': 'completed',
        'note': '',
        'price': 1200000,
      },
      {
        'type': 'rental',
        'title': 'Mercedes GLC 300',
        'date': '17/04/2023 - 20/04/2023',
        'status': 'waiting',
        'note': 'Xe có tài xế',
        'price': 6000000,
      },
    ];

    if (mockBookings.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Lịch sử'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.history,
                size: 64,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 16),
              Text(
                'Chưa có lịch sử đặt lịch',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch sử'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockBookings.length,
        itemBuilder: (context, index) {
          final booking = mockBookings[index];
          final isRepair = booking['type'] == 'repair';
          
          Color statusColor;
          String statusText;
          Color cardColor;
          
          switch (booking['status']) {
            case 'completed':
              statusColor = Colors.green;
              statusText = 'Đã hoàn thành';
              cardColor = Colors.green[50]!;
              break;
            case 'pending':
              statusColor = Colors.orange;
              statusText = 'Đang xử lý';
              cardColor = Colors.orange[50]!;
              break;
            case 'waiting':
              statusColor = Colors.blue;
              statusText = 'Chờ xác nhận';
              cardColor = Colors.blue[50]!;
              break;
            default:
              statusColor = Colors.grey;
              statusText = 'Không xác định';
              cardColor = Colors.grey[50]!;
          }
          
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            color: cardColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            isRepair ? Icons.build : Icons.directions_car,
                            color: statusColor,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              booking['title'] as String,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              statusText,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: statusColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        booking['date'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      if (booking['note'] != null && (booking['note'] as String).isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(
                          booking['note'] as String,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Tổng tiền',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${NumberFormat.currency(locale: 'vi_VN', symbol: '', decimalDigits: 0).format(booking['price'])} VNĐ',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: statusColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
