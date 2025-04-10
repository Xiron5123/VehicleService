import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'service.freezed.dart';
part 'service.g.dart';

@freezed
class Service with _$Service {
  const factory Service({
    required String id,
    required String name,
    required String description,
    required String imageUrl,
    required double price,
    required double rating,
    required int reviewCount,
    required String type,
    required List<String> features,
    required List<TimeSlot> availableTimeSlots,
    required int estimatedDuration, // in minutes
    required bool isAvailable,
    required List<String> process,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  static final List<Service> mockServices = [
    Service(
      id: '1',
      name: 'Thay dầu nhớt động cơ',
      description: 'Dịch vụ thay dầu động cơ và kiểm tra tổng thể',
      imageUrl: 'assets/images/oilservice.jpg',
      price: 850000,
      rating: 4.8,
      reviewCount: 128,
      type: 'repair',
      features: [
        'Kiểm tra mức dầu hiện tại',
        'Xả dầu cũ',
        'Thay lọc dầu mới',
        'Đổ dầu động cơ mới',
        'Kiểm tra các thông số động cơ',
      ],
      availableTimeSlots: [
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 8, 0),
          endTime: DateTime(2024, 1, 1, 9, 0),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 9, 0),
          endTime: DateTime(2024, 1, 1, 10, 0),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 10, 0),
          endTime: DateTime(2024, 1, 1, 11, 0),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 11, 0),
          endTime: DateTime(2024, 1, 1, 12, 0),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 12, 0),
          endTime: DateTime(2024, 1, 1, 13, 0),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 13, 0),
          endTime: DateTime(2024, 1, 1, 14, 0),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 14, 0),
          endTime: DateTime(2024, 1, 1, 15, 0),
          isAvailable: true,
        ),
      ],
      estimatedDuration: 45,
      isAvailable: true,
      process: [
        'Kiểm tra mức dầu hiện tại',
        'Tháo dầu cũ',
        'Thay lọc dầu',
        'Đổ dầu mới',
        'Kiểm tra rò rỉ',
        'Kiểm tra tổng thể xe',
      ],
    ),
    Service(
      id: '2',
      name: 'Bảo dưỡng định kỳ',
      description: 'Dịch vụ bảo dưỡng định kỳ theo km',
      imageUrl: 'assets/images/carmaintenance.jpg',
      price: 1200000,
      rating: 4.9,
      reviewCount: 256,
      type: 'repair',
      features: [
        'Kiểm tra tổng thể xe',
        'Thay dầu và các bộ lọc',
        'Kiểm tra và bảo dưỡng phanh',
        'Kiểm tra hệ thống điện',
        'Cân bằng động và thay các phụ tùng cần thiết',
      ],
      availableTimeSlots: [
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 8, 0),
          endTime: DateTime(2024, 1, 1, 10, 0),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 10, 0),
          endTime: DateTime(2024, 1, 1, 12, 0),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 13, 0),
          endTime: DateTime(2024, 1, 1, 15, 0),
          isAvailable: true,
        ),
      ],
      estimatedDuration: 120,
      isAvailable: true,
      process: [
        'Kiểm tra tổng thể xe',
        'Thay dầu và các bộ lọc',
        'Kiểm tra và bảo dưỡng phanh',
        'Kiểm tra hệ thống điện',
        'Cân bằng động và thay các phụ tùng cần thiết',
      ],
    ),
    Service(
      id: '3',
      name: 'Rửa xe cao cấp',
      description: 'Dịch vụ rửa xe và chăm sóc nội thất cao cấp',
      imageUrl: 'assets/images/carwashing.jpg',
      price: 350000,
      rating: 4.7,
      reviewCount: 95,
      type: 'repair',
      features: [
        'Rửa xe bằng máy áp lực cao',
        'Làm sạch nội thất',
        'Đánh bóng và phủ nano',
        'Vệ sinh khoang máy',
        'Bảo dưỡng và dưỡng ẩm da',
      ],
      availableTimeSlots: [
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 8, 0),
          endTime: DateTime(2024, 1, 1, 10, 0),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 10, 0),
          endTime: DateTime(2024, 1, 1, 12, 0),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 13, 0),
          endTime: DateTime(2024, 1, 1, 15, 0),
          isAvailable: true,
        ),
      ],
      estimatedDuration: 90,
      isAvailable: true,
      process: [
        'Rửa xe bằng máy áp lực cao',
        'Làm sạch nội thất',
        'Đánh bóng và phủ nano',
        'Vệ sinh khoang máy',
        'Bảo dưỡng và dưỡng ẩm da',
      ],
    ),
    Service(
      id: '4',
      name: 'Kiểm tra và thay thế gương',
      description: 'Dịch vụ kiểm tra và thay thế gương xe',
      imageUrl: 'assets/images/mirrorservice.jpg',
      price: 450000,
      rating: 4.6,
      reviewCount: 75,
      type: 'repair',
      features: [
        'Kiểm tra tình trạng gương',
        'Thay thế gương mới nếu cần',
        'Căn chỉnh góc gương',
        'Kiểm tra chức năng điều khiển điện',
        'Bảo hành sau thay thế',
      ],
      availableTimeSlots: [
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 8, 0),
          endTime: DateTime(2024, 1, 1, 9, 30),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 10, 0),
          endTime: DateTime(2024, 1, 1, 11, 30),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 13, 0),
          endTime: DateTime(2024, 1, 1, 14, 30),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 14, 0),
          endTime: DateTime(2024, 1, 1, 15, 30),
          isAvailable: true,
        ),
      ],
      estimatedDuration: 60,
      isAvailable: true,
      process: [
        'Kiểm tra tình trạng gương',
        'Thay thế gương mới nếu cần',
        'Căn chỉnh góc gương',
        'Kiểm tra chức năng điều khiển điện',
        'Bảo hành sau thay thế',
      ],
    ),
    Service(
      id: '5',
      name: 'Đổ xăng và kiểm tra hệ thống xăng dầu',
      description: 'Dịch vụ kiểm tra và nạp gas điều hòa ô tô',
      imageUrl: 'assets/images/gasservice.jpg',
      price: 550000,
      rating: 4.8,
      reviewCount: 112,
      type: 'repair',
      features: [
        'Kiểm tra áp suất gas',
        'Kiểm tra rò rỉ hệ thống',
        'Hút chân không',
        'Nạp gas mới',
        'Kiểm tra hoạt động sau nạp',
      ],
      availableTimeSlots: [
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 8, 0),
          endTime: DateTime(2024, 1, 1, 10, 0),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 10, 0),
          endTime: DateTime(2024, 1, 1, 12, 0),
          isAvailable: true,
        ),
        TimeSlot(
          startTime: DateTime(2024, 1, 1, 13, 0),
          endTime: DateTime(2024, 1, 1, 15, 0),
          isAvailable: true,
        ),
      ],
      estimatedDuration: 90,
      isAvailable: true,
      process: [
        'Kiểm tra áp suất gas',
        'Kiểm tra rò rỉ hệ thống',
        'Hút chân không',
        'Nạp gas mới',
        'Kiểm tra hoạt động sau nạp',
      ],
    ),
  ];
}

@freezed
class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    required DateTime startTime,
    required DateTime endTime,
    required bool isAvailable,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
}
