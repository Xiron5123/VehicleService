import 'package:flutter/material.dart';

enum BookingStatus {
  completed,
  cancelled,
  processing,
  pending,
}

extension BookingStatusExtension on BookingStatus {
  String get name {
    switch (this) {
      case BookingStatus.completed:
        return 'Đã hoàn thành';
      case BookingStatus.cancelled:
        return 'Đã hủy';
      case BookingStatus.processing:
        return 'Đang xử lý';
      case BookingStatus.pending:
        return 'Chờ xác nhận';
    }
  }

  Color get color {
    switch (this) {
      case BookingStatus.completed:
        return Colors.green;
      case BookingStatus.cancelled:
        return Colors.red;
      case BookingStatus.processing:
        return Colors.orange;
      case BookingStatus.pending:
        return Colors.blue;
    }
  }
}

class Booking {
  final String id;
  final String serviceName;
  final String serviceType; // 'rental' hoặc 'repair'
  final DateTime bookingDate;
  final DateTime? startDate;
  final DateTime? endDate;
  final double totalPrice;
  final BookingStatus status;
  final String? imageUrl;
  final String customerName;
  final String customerPhone;
  final String customerEmail;
  final String? notes;

  const Booking({
    required this.id,
    required this.serviceName,
    required this.serviceType,
    required this.bookingDate,
    this.startDate,
    this.endDate,
    required this.totalPrice,
    required this.status,
    this.imageUrl,
    required this.customerName,
    required this.customerPhone,
    required this.customerEmail,
    this.notes,
  });

  static final List<Booking> mockBookings = [
    Booking(
      id: 'B001',
      serviceName: 'Toyota Camry 2023',
      serviceType: 'rental',
      bookingDate: DateTime.now().subtract(const Duration(days: 2)),
      startDate: DateTime.now().add(const Duration(days: 1)),
      endDate: DateTime.now().add(const Duration(days: 3)),
      totalPrice: 3600000,
      status: BookingStatus.processing,
      imageUrl: 'assets/images/camry.jpg',
      customerName: 'Nguyễn Văn A',
      customerPhone: '0901234567',
      customerEmail: 'nguyenvana@email.com',
      notes: 'Cần giao xe tại sân bay',
    ),
    Booking(
      id: 'B002',
      serviceName: 'Thay dầu động cơ',
      serviceType: 'repair',
      bookingDate: DateTime.now().subtract(const Duration(days: 5)),
      totalPrice: 1200000,
      status: BookingStatus.completed,
      customerName: 'Trần Thị B',
      customerPhone: '0909876543',
      customerEmail: 'tranthib@email.com',
    ),
    Booking(
      id: 'B003',
      serviceName: 'Mercedes GLC 300',
      serviceType: 'rental',
      bookingDate: DateTime.now().subtract(const Duration(days: 1)),
      startDate: DateTime.now().add(const Duration(days: 7)),
      endDate: DateTime.now().add(const Duration(days: 10)),
      totalPrice: 6000000,
      status: BookingStatus.pending,
      imageUrl: 'assets/images/glc300.jpg',
      customerName: 'Lê Văn C',
      customerPhone: '0905555666',
      customerEmail: 'levanc@email.com',
      notes: 'Xe có tài xế',
    ),
    Booking(
      id: 'B004',
      serviceName: 'Bảo dưỡng định kỳ',
      serviceType: 'repair',
      bookingDate: DateTime.now().subtract(const Duration(days: 3)),
      totalPrice: 2500000,
      status: BookingStatus.cancelled,
      customerName: 'Phạm Thị D',
      customerPhone: '0907777888',
      customerEmail: 'phamthid@email.com',
      notes: 'Khách hẹn lại lịch sau',
    ),
    Booking(
      id: 'B005',
      serviceName: 'Honda Civic 2023',
      serviceType: 'rental',
      bookingDate: DateTime.now().subtract(const Duration(days: 7)),
      startDate: DateTime.now().subtract(const Duration(days: 5)),
      endDate: DateTime.now().subtract(const Duration(days: 3)),
      totalPrice: 2400000,
      status: BookingStatus.completed,
      imageUrl: 'assets/images/civic.jpg',
      customerName: 'Hoàng Văn E',
      customerPhone: '0903333444',
      customerEmail: 'hoangvane@email.com',
    ),
  ];
}
