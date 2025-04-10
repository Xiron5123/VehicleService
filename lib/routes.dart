import 'package:flutter/material.dart';
import 'models/service.dart';
import 'models/vehicle.dart';
import 'screens/home/services_screen.dart';
import 'screens/rental/rental_screen.dart';
import 'screens/rental/vehicle_list_screen.dart';
import 'screens/rental/vehicle_info_screen.dart';
import 'screens/rental/booking_date_screen.dart';
import 'screens/rental/rental_booking_screen.dart';
import 'screens/service/service_detail_screen.dart';

class Routes {
  static const String home = '/';
  static const String rental = '/rental';
  static const String vehicleList = '/vehicle-list';
  static const String vehicleInfo = '/vehicle-info';
  static const String bookingDate = '/booking-date';
  static const String rentalBooking = '/rental-booking';
  static const String serviceDetail = '/service-detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const ServicesScreen());
      case rental:
        return MaterialPageRoute(builder: (_) => const RentalScreen());
      case vehicleList:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => VehicleListScreen(
            title: args['title'] as String,
            seats: args['seats'] as int,
          ),
        );
      case vehicleInfo:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => VehicleInfoScreen(
            vehicle: args['vehicle'] as Vehicle,
            onSubmitted: args['onSubmitted'] as Function(Map<String, String>),
          ),
        );
      case bookingDate:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BookingDateScreen(
            vehicle: args['vehicle'] as Vehicle,
            vehicleInfo: args['vehicleInfo'] as Map<String, String>,
          ),
        );
      case rentalBooking:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => RentalBookingScreen(
            vehicle: args['vehicle'] as Vehicle,
            vehicleInfo: args['vehicleInfo'] as Map<String, dynamic>,
            bookingDate: args['bookingDate'] as DateTime,
            timeSlot: args['timeSlot'] as String,
          ),
        );
      case serviceDetail:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ServiceDetailScreen(
            service: args['service'] as Service,
            onSubmitted: args['onSubmitted'] as Function(Map<String, dynamic>),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
