import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../models/booking.dart';
import '../../models/service.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({super.key});

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final currencyFormat = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: '₫',
    decimalDigits: 0,
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch sử đặt lịch'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Sắp tới'),
            Tab(text: 'Đã hoàn thành'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _BookingList(bookings: _upcomingBookings),
          _BookingList(bookings: _completedBookings),
        ],
      ),
    );
  }
}

class _BookingList extends StatelessWidget {
  final List<Map<String, dynamic>> bookings;

  const _BookingList({required this.bookings});

  String _formatDuration(int minutes) {
    if (minutes < 60) {
      return '$minutes phút';
    } else {
      final hours = minutes ~/ 60;
      final remainingMinutes = minutes % 60;
      if (remainingMinutes == 0) {
        return '$hours giờ';
      } else {
        return '$hours giờ $remainingMinutes phút';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (bookings.isEmpty) {
      return const Center(
        child: Text('Không có lịch đặt nào'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        final service = booking['service'] as Service;
        final vehicleInfo = booking['vehicleInfo'] as Map<String, dynamic>;
        final bookingDate = booking['bookingDate'] as DateTime;
        final status = booking['status'] as String;

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
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
                          service.type == 'repair' ? Icons.build : Icons.directions_car,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            service.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        _StatusChip(status: status),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      DateFormat('dd/MM/yyyy HH:mm').format(bookingDate),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    if (booking['note']?.isNotEmpty ?? false) ...[
                      const SizedBox(height: 8),
                      Text(
                        booking['note'] as String,
                        style: TextStyle(
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
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          NumberFormat.currency(
                            locale: 'vi_VN',
                            symbol: '',
                            decimalDigits: 0,
                          ).format(service.price) + ' VNĐ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor,
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
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final dynamic value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(
          '$label ',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    String displayText;

    switch (status.toLowerCase()) {
      case 'pending':
        backgroundColor = Colors.orange[100]!;
        textColor = Colors.orange[900]!;
        displayText = 'Chờ xác nhận';
        break;
      case 'confirmed':
        backgroundColor = Colors.blue[100]!;
        textColor = Colors.blue[900]!;
        displayText = 'Đã xác nhận';
        break;
      case 'completed':
        backgroundColor = Colors.green[100]!;
        textColor = Colors.green[900]!;
        displayText = 'Hoàn thành';
        break;
      case 'cancelled':
        backgroundColor = Colors.red[100]!;
        textColor = Colors.red[900]!;
        displayText = 'Đã hủy';
        break;
      default:
        backgroundColor = Colors.grey[100]!;
        textColor = Colors.grey[900]!;
        displayText = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        displayText,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}

// Mock data for testing
final List<Map<String, dynamic>> _upcomingBookings = [
  {
    'service': Service(
      id: '1',
      name: 'Bảo dưỡng định kỳ',
      description: 'Bảo dưỡng xe định kỳ 10,000 km',
      price: 2500000,
      imageUrl: 'assets/images/service1.jpg',
      rating: 4.5,
      reviewCount: 128,
      type: 'repair',
      estimatedDuration: 120,
      process: [
        'Kiểm tra tổng quát',
        'Thay dầu động cơ',
        'Thay lọc dầu',
        'Kiểm tra và bổ sung dầu phanh',
      ],
      availableTimeSlots: [],
      features: [],
      isAvailable: true,
    ),
    'vehicleInfo': {
      'brand': 'Toyota',
      'model': 'Camry',
      'year': 2020,
      'plateNumber': 51123,
    },
    'bookingDate': DateTime.now().add(const Duration(days: 2)),
    'status': 'confirmed',
    'note': 'Xe có tiếng kêu lạ khi khởi động',
  },
  // Add more upcoming bookings here
];

final List<Map<String, dynamic>> _completedBookings = [
  {
    'service': Service(
      id: '2',
      name: 'Thay lốp xe',
      description: 'Thay lốp xe mới chính hãng',
      price: 3200000,
      imageUrl: 'assets/images/service2.jpg',
      rating: 4.8,
      reviewCount: 95,
      type: 'repair',
      estimatedDuration: 60,
      process: [
        'Kiểm tra lốp cũ',
        'Tháo lốp cũ',
        'Lắp lốp mới',
        'Cân bằng động',
      ],
      availableTimeSlots: [],
      features: [],
      isAvailable: true,
    ),
    'vehicleInfo': {
      'brand': 'Honda',
      'model': 'Civic',
      'year': 2019,
      'plateNumber': 51789,
    },
    'bookingDate': DateTime.now().subtract(const Duration(days: 5)),
    'status': 'completed',
    'note': '',
  },
  // Add more completed bookings here
];

final List<Map<String, dynamic>> mockBookings = [
  {
    'id': 1,
    'service': 'Rửa xe cơ bản',
    'date': '2024-03-15',
    'time': '09:00',
    'status': 'completed',
    'vehicleInfo': {
      'brand': 'Toyota',
      'model': 'Camry',
      'year': 2020,
      'plateNumber': 51123,
      'note': 'Vệ sinh kỹ nội thất'
    },
    'price': 200000,
  },
  {
    'id': 2,
    'service': 'Bảo dưỡng định kỳ',
    'date': '2024-03-10',
    'time': '14:30',
    'status': 'cancelled',
    'vehicleInfo': {
      'brand': 'Honda',
      'model': 'Civic',
      'year': 2021,
      'plateNumber': 51789,
      'note': 'Thay dầu và kiểm tra phanh'
    },
    'price': 1500000,
  },
];
