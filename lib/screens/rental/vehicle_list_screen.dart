import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../models/vehicle.dart';
import 'rental_screen.dart';
import 'vehicle_info_screen.dart';
import 'rental_booking_screen.dart';

class VehicleListScreen extends StatelessWidget {
  final String title;
  final int seats;

  const VehicleListScreen({
    super.key,
    required this.title,
    required this.seats,
  });

  @override
  Widget build(BuildContext context) {
    final vehicles =
        Vehicle.mockVehicles.where((v) => v.seats == seats).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VehicleInfoScreen(
                      vehicle: vehicle,
                      onSubmitted: (vehicleInfo) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RentalBookingScreen(
                              vehicle: vehicle,
                              vehicleInfo: vehicleInfo,
                              bookingDate: DateTime.now(),
                              timeSlot: '8:00 - 12:00',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehicle.name,
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${vehicle.brand} ${vehicle.model} ${vehicle.year}',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _buildFeatureChip(
                          Icons.event_seat,
                          '${vehicle.seats} chỗ',
                        ),
                        const SizedBox(width: 8),
                        _buildFeatureChip(
                          Icons.settings,
                          vehicle.transmission,
                        ),
                        const SizedBox(width: 8),
                        _buildFeatureChip(
                          Icons.local_gas_station,
                          'Xăng',
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${vehicle.rating}',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              ' (${vehicle.reviewCount})',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${NumberFormat.currency(
                            locale: 'vi_VN',
                            symbol: '',
                            decimalDigits: 0,
                          ).format(vehicle.pricePerDay)}/ngày',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeatureChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: Colors.grey[600],
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: GoogleFonts.roboto(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
