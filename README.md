# Vehicle Service App

Ứng dụng đặt lịch sửa chữa và thuê xe ô tô với các tính năng:
- Đặt lịch sửa chữa ô tô
- Dịch vụ cho thuê xe
- Quản lý lịch sử đặt lịch
- Quản lý thông tin cá nhân

## Yêu cầu hệ thống

- Flutter SDK (phiên bản 3.19.0 hoặc cao hơn)
- Dart SDK (phiên bản 3.3.0 hoặc cao hơn)
- Android Studio / VS Code với Flutter extension
- Git

## Cài đặt và chạy ứng dụng

1. Clone repository:
```bash
git clone https://github.com/Xiron5123/VehicleService.git
```

2. Di chuyển vào thư mục project:
```bash
cd VehicleService/FEVehicleService
```

3. Cài đặt dependencies:
```bash
flutter pub get
```

4. Chạy ứng dụng:
```bash
flutter run
```

## Tài khoản demo

Để test ứng dụng, bạn có thể sử dụng tài khoản sau:
- Email: example@email.com
- Mật khẩu: 12345678

## Các tính năng chính

### 1. Xác thực
- Đăng ký tài khoản mới
- Đăng nhập
- Quên mật khẩu

### 2. Dịch vụ sửa chữa
- Xem danh sách dịch vụ
- Đặt lịch sửa chữa
- Chọn thời gian

### 3. Thuê xe
- Xem danh sách xe cho thuê
- Đặt thuê xe
- Chọn thời gian thuê

### 4. Quản lý
- Xem lịch sử đặt lịch
- Theo dõi trạng thái
- Quản lý thông tin cá nhân

## Cấu trúc thư mục

```
lib/
├── models/         # Data models
├── screens/        # Các màn hình
│   ├── auth/      # Đăng nhập/Đăng ký
│   ├── home/      # Màn hình chính
│   ├── rental/    # Thuê xe
│   └── account/   # Tài khoản
├── widgets/        # Widgets tái sử dụng
└── main.dart      # Entry point
```

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.1.0
  flutter_animate: ^4.5.0
  form_validator: ^2.1.1
  flutter_riverpod: ^2.4.9
  dio: ^5.4.0
  retrofit: ^4.0.1
  flutter_secure_storage: ^9.0.0
  table_calendar: ^3.0.9
```

## Lưu ý

- Ứng dụng hiện đang sử dụng dữ liệu mẫu
- Một số tính năng có thể chưa hoạt động đầy đủ do chưa có backend
- Đảm bảo cài đặt đúng phiên bản Flutter và Dart SDK

## Hỗ trợ

Nếu bạn gặp vấn đề khi cài đặt hoặc sử dụng, vui lòng tạo issue trên GitHub hoặc liên hệ qua email.

## License

Dự án được phát triển bởi Tuấn Anh và được cấp phép theo [MIT License](LICENSE).
