import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

// Tạo mixin cho các phương thức tính toán
mixin VehicleCalculationMixin {
  double get pricePerDay;
  Map<int, double> get priceDiscounts;

  double calculateRentalPrice(int days) {
    double basePrice = pricePerDay * days;
    double maxDiscount = 0.0;

    // Tìm mức giảm giá cao nhất có thể áp dụng
    for (var entry in priceDiscounts.entries) {
      if (days >= entry.key && entry.value > maxDiscount) {
        maxDiscount = entry.value;
      }
    }

    // Áp dụng giảm giá
    double discount = basePrice * maxDiscount;
    return basePrice - discount;
  }
}

@freezed
class Vehicle with _$Vehicle, VehicleCalculationMixin {
  const factory Vehicle({
    required String id,
    required String name,
    required String brand,
    required String model,
    required int year,
    required String type,
    required String transmission,
    required String fuelType,
    required int seats,
    required String imageUrl,
    required double pricePerDay,
    required double rating,
    required int reviewCount,
    required List<String> features,
    required bool isAvailable,
    // Thêm thông tin yêu cầu thuê xe
    required double depositAmount, // Số tiền cọc
    required List<String> requiredDocuments, // Danh sách giấy tờ cần thiết
    required List<String> rentalRequirements, // Yêu cầu khi thuê
    required Map<int, double> priceDiscounts, // Giảm giá theo số ngày thuê
    required List<String> paymentMethods,
    required Map<String, String> rentalTerms,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  // Tính giá thuê xe dựa trên số ngày và áp dụng giảm giá (nếu có)
  const Vehicle._();

  // Danh sách xe mẫu
  static final List<Vehicle> mockVehicles = [
    Vehicle(
      id: '1',
      name: 'Toyota Camry 2023',
      brand: 'Toyota',
      model: 'Camry',
      year: 2023,
      type: 'Sedan',
      transmission: 'Tự động',
      fuelType: 'Xăng',
      seats: 5,
      imageUrl: 'assets/images/toyota_camry.jpg',
      pricePerDay: 1200000,
      rating: 4.8,
      reviewCount: 128,
      features: [
        'Camera lùi',
        'Cảm biến va chạm',
        'Hệ thống giải trí thông minh',
        'Điều hòa tự động',
        'Ghế da cao cấp',
      ],
      isAvailable: true,
      depositAmount: 5000000, // 5 triệu cọc
      requiredDocuments: [
        'CMND/CCCD',
        'Bằng lái xe',
        'Hộ khẩu/Giấy tạm trú',
      ],
      rentalRequirements: [
        'Tuổi từ 21 trở lên',
        'Có kinh nghiệm lái xe ít nhất 1 năm',
        'Không có tiền án tiền sự',
      ],
      priceDiscounts: {
        3: 0.1, // Giảm 10% cho thuê 3 ngày
        7: 0.15, // Giảm 15% cho thuê 7 ngày
        30: 0.2, // Giảm 20% cho thuê 30 ngày
      },
      paymentMethods: [
        'Tiền mặt',
        'Chuyển khoản',
        'Thẻ tín dụng',
        'Ví điện tử',
      ],
      rentalTerms: {
        'Thời gian thuê tối thiểu': '1 ngày',
        'Thời gian thuê tối đa': '30 ngày',
        'Giờ nhận xe': '8:00 - 20:00',
        'Giờ trả xe': '8:00 - 20:00',
        'Phí trả xe muộn': '20% giá thuê/ngày',
        'Phí hủy đặt xe': '10% giá thuê (trước 24h)',
      },
    ),
    Vehicle(
      id: '2',
      name: 'Honda CR-V 2023',
      brand: 'Honda',
      model: 'CR-V',
      year: 2023,
      type: 'SUV',
      transmission: 'Tự động',
      fuelType: 'Xăng',
      seats: 7,
      imageUrl: 'assets/images/honda_crv.jpg',
      pricePerDay: 1500000,
      rating: 4.7,
      reviewCount: 95,
      features: [
        'Hệ thống dẫn đường',
        'Camera 360 độ',
        'Cảnh báo điểm mù',
        'Hỗ trợ đỗ xe',
        'Ghế chỉnh điện',
      ],
      isAvailable: true,
      depositAmount: 7000000, // 7 triệu cọc
      requiredDocuments: [
        'CMND/CCCD',
        'Bằng lái xe',
        'Hộ khẩu/Giấy tạm trú',
      ],
      rentalRequirements: [
        'Tuổi từ 21 trở lên',
        'Có kinh nghiệm lái xe ít nhất 1 năm',
        'Không có tiền án tiền sự',
      ],
      priceDiscounts: {
        3: 0.1,
        7: 0.15,
        30: 0.2,
      },
      paymentMethods: [
        'Tiền mặt',
        'Chuyển khoản',
        'Thẻ tín dụng',
        'Ví điện tử',
      ],
      rentalTerms: {
        'Thời gian thuê tối thiểu': '1 ngày',
        'Thời gian thuê tối đa': '30 ngày',
        'Giờ nhận xe': '8:00 - 20:00',
        'Giờ trả xe': '8:00 - 20:00',
        'Phí trả xe muộn': '20% giá thuê/ngày',
        'Phí hủy đặt xe': '10% giá thuê (trước 24h)',
      },
    ),
    Vehicle(
      id: '3',
      name: 'Toyota Innova 2023',
      brand: 'Toyota',
      model: 'Innova',
      year: 2023,
      type: 'MPV',
      transmission: 'Tự động',
      fuelType: 'Xăng',
      seats: 7,
      imageUrl: 'assets/images/toyota_innova.jpg',
      pricePerDay: 1300000,
      rating: 4.6,
      reviewCount: 75,
      features: [
        'Khoang hành lý rộng',
        'Hệ thống giải trí',
        'Điều hòa tự động',
        'Camera lùi',
        'Cảm biến va chạm',
      ],
      isAvailable: true,
      depositAmount: 6000000, // 6 triệu cọc
      requiredDocuments: [
        'CMND/CCCD',
        'Bằng lái xe',
        'Hộ khẩu/Giấy tạm trú',
      ],
      rentalRequirements: [
        'Tuổi từ 21 trở lên',
        'Có kinh nghiệm lái xe ít nhất 1 năm',
        'Không có tiền án tiền sự',
      ],
      priceDiscounts: {
        3: 0.1,
        7: 0.15,
        30: 0.2,
      },
      paymentMethods: [
        'Tiền mặt',
        'Chuyển khoản',
        'Thẻ tín dụng',
        'Ví điện tử',
      ],
      rentalTerms: {
        'Thời gian thuê tối thiểu': '1 ngày',
        'Thời gian thuê tối đa': '30 ngày',
        'Giờ nhận xe': '8:00 - 20:00',
        'Giờ trả xe': '8:00 - 20:00',
        'Phí trả xe muộn': '20% giá thuê/ngày',
        'Phí hủy đặt xe': '10% giá thuê (trước 24h)',
      },
    ),
    Vehicle(
      id: '4',
      name: 'Ford Transit 2023',
      brand: 'Ford',
      model: 'Transit',
      year: 2023,
      type: 'Van',
      transmission: 'Tự động',
      fuelType: 'Dầu',
      seats: 16,
      imageUrl: 'assets/images/ford_transit.jpg',
      pricePerDay: 2000000,
      rating: 4.5,
      reviewCount: 42,
      features: [
        'Khoang hành lý lớn',
        'Hệ thống giải trí',
        'Điều hòa tự động',
        'Camera lùi',
        'Cảm biến va chạm',
      ],
      isAvailable: true,
      depositAmount: 10000000, // 10 triệu cọc
      requiredDocuments: [
        'CMND/CCCD',
        'Bằng lái xe',
        'Hộ khẩu/Giấy tạm trú',
      ],
      rentalRequirements: [
        'Tuổi từ 21 trở lên',
        'Có kinh nghiệm lái xe ít nhất 1 năm',
        'Không có tiền án tiền sự',
      ],
      priceDiscounts: {
        3: 0.1,
        7: 0.15,
        30: 0.2,
      },
      paymentMethods: [
        'Tiền mặt',
        'Chuyển khoản',
        'Thẻ tín dụng',
        'Ví điện tử',
      ],
      rentalTerms: {
        'Thời gian thuê tối thiểu': '1 ngày',
        'Thời gian thuê tối đa': '30 ngày',
        'Giờ nhận xe': '8:00 - 20:00',
        'Giờ trả xe': '8:00 - 20:00',
        'Phí trả xe muộn': '20% giá thuê/ngày',
        'Phí hủy đặt xe': '10% giá thuê (trước 24h)',
      },
    ),
    Vehicle(
      id: '16',
      name: 'Kia Carnival',
      brand: 'Kia',
      model: 'Carnival',
      year: 2023,
      type: 'MPV',
      transmission: 'Số tự động',
      fuelType: 'Xăng',
      seats: 7,
      pricePerDay: 1200000,
      depositAmount: 12000000,
      rating: 4.5,
      reviewCount: 89,
      imageUrl: 'https://example.com/carnival.jpg',
      features: [
        'Camera 360',
        'Cảm biến va chạm',
        'Hệ thống giải trí',
        'Điều hòa 3 vùng',
        'Ghế da cao cấp',
        'Cửa điện',
        'Cốp điện',
      ],
      isAvailable: true,
      requiredDocuments: [
        'CMND/CCCD',
        'Bằng lái xe',
        'Hộ khẩu/KT3',
      ],
      rentalRequirements: [
        'Tuổi từ 23 trở lên',
        'Có kinh nghiệm lái xe ít nhất 2 năm',
        'Không có tiền án tiền sự',
      ],
      priceDiscounts: {
        3: 0.1,
        7: 0.15,
        30: 0.2,
      },
      paymentMethods: [
        'Tiền mặt',
        'Chuyển khoản',
        'Thẻ tín dụng',
        'Ví điện tử',
      ],
      rentalTerms: {
        'Thời gian thuê tối thiểu': '1 ngày',
        'Thời gian thuê tối đa': '30 ngày',
        'Giờ nhận xe': '8:00 - 20:00',
        'Giờ trả xe': '8:00 - 20:00',
        'Phí trả xe muộn': '20% giá thuê/ngày',
        'Phí hủy đặt xe': '10% giá thuê (trước 24h)',
      },
    ),
    Vehicle(
      id: '17',
      name: 'Mercedes GLC 300',
      brand: 'Mercedes',
      model: 'GLC 300',
      year: 2023,
      type: 'SUV',
      transmission: 'Số tự động',
      fuelType: 'Xăng',
      seats: 5,
      pricePerDay: 2000000,
      depositAmount: 20000000,
      rating: 4.9,
      reviewCount: 78,
      imageUrl: 'https://example.com/glc300.jpg',
      features: [
        'Camera 360',
        'Cảm biến va chạm',
        'Hệ thống giải trí MBUX',
        'Điều hòa 3 vùng',
        'Ghế da Nappa',
        'Cửa sổ trời toàn cảnh',
        'Cốp điện',
        'Đèn viền nội thất',
      ],
      isAvailable: true,
      requiredDocuments: [
        'CMND/CCCD',
        'Bằng lái xe',
        'Hộ khẩu/KT3',
        'Hợp đồng thuê có công chứng',
      ],
      rentalRequirements: [
        'Tuổi từ 25 trở lên',
        'Có kinh nghiệm lái xe ít nhất 3 năm',
        'Không có tiền án tiền sự',
        'Đặt cọc bằng tài sản có giá trị tương đương',
      ],
      priceDiscounts: {
        3: 0.1,
        7: 0.15,
        30: 0.2,
      },
      paymentMethods: [
        'Tiền mặt',
        'Chuyển khoản',
        'Thẻ tín dụng',
        'Ví điện tử',
      ],
      rentalTerms: {
        'Thời gian thuê tối thiểu': '1 ngày',
        'Thời gian thuê tối đa': '30 ngày',
        'Giờ nhận xe': '8:00 - 20:00',
        'Giờ trả xe': '8:00 - 20:00',
        'Phí trả xe muộn': '30% giá thuê/ngày',
        'Phí hủy đặt xe': '20% giá thuê (trước 48h)',
      },
    ),
  ];

  // Phân loại xe theo số chỗ ngồi
  static List<Vehicle> getVehiclesBySeats(int seats) {
    return mockVehicles.where((vehicle) => vehicle.seats == seats).toList();
  }

  // Lấy danh sách các loại số chỗ ngồi có sẵn
  static List<int> getAvailableSeatTypes() {
    return mockVehicles.map((vehicle) => vehicle.seats).toSet().toList()
      ..sort();
  }

  static Map<int, List<Vehicle>> getVehiclesBySeatTypes() {
    final vehiclesBySeats = <int, List<Vehicle>>{};
    for (final vehicle in mockVehicles) {
      if (!vehiclesBySeats.containsKey(vehicle.seats)) {
        vehiclesBySeats[vehicle.seats] = [];
      }
      vehiclesBySeats[vehicle.seats]!.add(vehicle);
    }
    return vehiclesBySeats;
  }
}
