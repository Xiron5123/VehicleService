import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../models/vehicle.dart';
import '../../widgets/custom_button.dart';
import 'booking_confirmation_screen.dart';

class BookingDateScreen extends StatefulWidget {
  final Vehicle vehicle;
  final Map<String, dynamic> vehicleInfo;

  const BookingDateScreen({
    super.key,
    required this.vehicle,
    required this.vehicleInfo,
  });

  @override
  State<BookingDateScreen> createState() => _BookingDateScreenState();
}

class _BookingDateScreenState extends State<BookingDateScreen> {
  DateTime _selectedDay = DateTime.now();
  String? _selectedTimeSlot;
  final List<String> _timeSlots = [
    '8:00 - 12:00',
    '12:00 - 16:00',
    '16:00 - 20:00',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn ngày và giờ'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thông tin xe
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.vehicle.name,
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${widget.vehicle.brand} ${widget.vehicle.model} ${widget.vehicle.year}',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${widget.vehicle.type} • ${widget.vehicle.transmission} • ${widget.vehicle.seats} chỗ',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn().slideX(
                  begin: 0.2,
                  duration: 600.ms,
                ),

            const SizedBox(height: 16),

            // Chọn ngày
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chọn ngày',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TableCalendar(
                      firstDay: DateTime.now(),
                      lastDay: DateTime.now().add(const Duration(days: 30)),
                      focusedDay: _selectedDay,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                        });
                      },
                      calendarStyle: CalendarStyle(
                        selectedDecoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn().slideX(
                  begin: 0.2,
                  duration: 600.ms,
                  delay: 200.ms,
                ),

            const SizedBox(height: 16),

            // Chọn khung giờ
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chọn khung giờ',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _timeSlots.map((timeSlot) {
                        final isSelected = _selectedTimeSlot == timeSlot;
                        return ChoiceChip(
                          label: Text(timeSlot),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              _selectedTimeSlot = selected ? timeSlot : null;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn().slideX(
                  begin: 0.2,
                  duration: 600.ms,
                  delay: 400.ms,
                ),

            const SizedBox(height: 24),

            // Nút xác nhận
            CustomButton(
              text: 'Tiếp tục',
              onPressed: _selectedTimeSlot == null
                  ? null
                  : () {
                      Navigator.pushNamed(
                        context,
                        '/rental_booking',
                        arguments: {
                          'vehicle': widget.vehicle,
                          'vehicleInfo': widget.vehicleInfo,
                          'bookingDate': _selectedDay,
                          'timeSlot': _selectedTimeSlot,
                        },
                      );
                    },
            ).animate().fadeIn().slideY(
                  begin: 0.2,
                  duration: 600.ms,
                  delay: 600.ms,
                ),
          ],
        ),
      ),
    );
  }
}
