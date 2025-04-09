# Vehicle Service App

Ứng dụng đặt lịch dịch vụ xe hơi với các tính năng:
- Xem danh sách dịch vụ sửa chữa và thuê xe
- Đặt lịch dịch vụ
- Xem lịch sử đặt lịch
- Quản lý thông tin cá nhân

## Yêu cầu hệ thống

- Flutter SDK (phiên bản 3.19.0 hoặc cao hơn)
- Dart SDK (phiên bản 3.3.0 hoặc cao hơn)
- Android Studio / VS Code với Flutter extension
- Git

## Cài đặt

1. Clone repository:
```bash
git clone https://github.com/Xiron5123/VehicleService.git
cd VehicleService
```

2. Cài đặt dependencies:
```bash
flutter pub get
```

3. Tạo file cấu hình:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Chạy ứng dụng

1. Đảm bảo bạn đã kết nối thiết bị hoặc máy ảo Android/iOS

2. Chạy ứng dụng:
```bash
flutter run
```

## Cấu trúc thư mục

```
lib/
├── models/           # Các model dữ liệu
├── screens/          # Các màn hình chính
│   ├── auth/        # Màn hình xác thực
│   ├── home/        # Màn hình chính
│   ├── service/     # Màn hình dịch vụ
│   ├── booking/     # Màn hình đặt lịch
│   ├── history/     # Màn hình lịch sử
│   └── account/     # Màn hình tài khoản
├── widgets/         # Các widget tái sử dụng
└── main.dart        # Điểm khởi đầu ứng dụng
```

## Tính năng chính

### Dịch vụ
- Xem danh sách dịch vụ sửa chữa và thuê xe
- Chi tiết dịch vụ với hình ảnh, mô tả và giá
- Đánh giá và bình luận từ người dùng

### Đặt lịch
- Chọn dịch vụ
- Nhập thông tin xe (hãng, model, năm sản xuất)
- Chọn ngày và giờ hẹn
- Xác nhận đặt lịch

### Lịch sử
- Xem danh sách các lần đặt lịch
- Chi tiết từng lần đặt lịch
- Trạng thái đặt lịch

### Tài khoản
- Thông tin cá nhân
- Cài đặt ứng dụng
- Đăng xuất

## Công nghệ sử dụng

- Flutter: Framework phát triển ứng dụng
- Provider: Quản lý state
- Google Fonts: Font chữ
- Flutter SVG: Hiển thị SVG
- Cached Network Image: Cache hình ảnh
- Intl: Định dạng ngày giờ và tiền tệ
- Flutter Animate: Animation
- Table Calendar: Lịch
- Freezed: Code generation cho model

## Lưu ý

- Ứng dụng đang sử dụng mock data
- Cần kết nối với backend để hoạt động đầy đủ
- Đảm bảo đã cài đặt đúng phiên bản Flutter và Dart

## Đóng góp

Nếu bạn muốn đóng góp cho dự án, vui lòng:
1. Fork repository
2. Tạo branch mới
3. Commit thay đổi
4. Push lên branch
5. Tạo Pull Request

## Giấy phép

Dự án được phát triển bởi Tuấn Anh và được cấp phép theo [MIT License](LICENSE).
