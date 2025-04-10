import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../models/vehicle.dart';
import 'vehicle_list_screen.dart';
import 'vehicle_info_screen.dart';
import 'booking_date_screen.dart';

class RentalScreen extends StatelessWidget {
  const RentalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'title': 'Xe 4 chỗ Sedan',
        'subtitle': 'Toyota Vios, Honda City, Hyundai Accent,...',
        'seats': 4,
        'icon': Icons.directions_car,
      },
      {
        'title': 'Xe 5 chỗ Gầm Cao',
        'subtitle': 'Honda CRV, Hyundai Tucson, Mazda CX-5,...',
        'seats': 5,
        'icon': Icons.directions_car,
      },
      {
        'title': 'Xe 7 chỗ Gầm Thấp',
        'subtitle': 'Toyota Innova, Mitsubishi Xpander,...',
        'seats': 7,
        'icon': Icons.airport_shuttle,
      },
      {
        'title': 'Xe 7 chỗ Gầm Cao',
        'subtitle': 'Toyota Fortuner, Ford Everest, Hyundai Santa Fe,...',
        'seats': 7,
        'icon': Icons.airport_shuttle,
      },
      {
        'title': 'Xe 16 chỗ',
        'subtitle': 'Ford Transit, Mercedes Sprinter,...',
        'seats': 16,
        'icon': Icons.directions_bus,
      },
      {
        'title': 'Xe 29-30 chỗ',
        'subtitle': 'Hyundai County, Samco Felix,...',
        'seats': 29,
        'icon': Icons.directions_bus,
      },
      {
        'title': 'Xe 45-47 chỗ',
        'subtitle': 'Hyundai Universe, Thaco Town,...',
        'seats': 45,
        'icon': Icons.directions_bus_filled,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VehicleListScreen(
                    title: category['title'] as String,
                    seats: category['seats'] as int,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      category['icon'] as IconData,
                      color: Theme.of(context).colorScheme.primary,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category['title'] as String,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          category['subtitle'] as String,
                          style: GoogleFonts.roboto(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[400],
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ).animate().fadeIn().slideX(
              begin: 0.2,
              duration: 600.ms,
              delay: (index * 100).ms,
            );
      },
    );
  }
}
