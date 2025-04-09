import 'package:flutter/material.dart';
import 'service.dart';

class Booking {
  final String id;
  final Service service;
  final DateTime date;
  final String time;
  final String endTime;
  final String status;
  final String vehicleInfo;
  final String? note;

  Booking({
    required this.id,
    required this.service,
    required this.date,
    required this.time,
    required this.endTime,
    required this.status,
    required this.vehicleInfo,
    this.note,
  });

  static final List<Booking> mockBookings = [
    Booking(
      id: '1',
      service: Service.mockServices[0],
      date: DateTime.now().add(const Duration(days: 1)),
      time: '09:00',
      endTime: '10:00',
      status: 'pending',
      vehicleInfo: '51A-12345',
      note: 'Cần rửa xe kỹ',
    ),
    Booking(
      id: '2',
      service: Service.mockServices[1],
      date: DateTime.now().add(const Duration(days: 2)),
      time: '14:00',
      endTime: '16:00',
      status: 'completed',
      vehicleInfo: '51B-67890',
    ),
    Booking(
      id: '3',
      service: Service.mockServices[2],
      date: DateTime.now().add(const Duration(days: 3)),
      time: '10:00',
      endTime: '11:00',
      status: 'cancelled',
      vehicleInfo: '51C-54321',
      note: 'Đã hủy do bận việc',
    ),
  ];
}
