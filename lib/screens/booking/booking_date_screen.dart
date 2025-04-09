import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../models/service.dart';

class BookingDateScreen extends StatefulWidget {
  final Service service;
  final Map<String, String> vehicleInfo;

  const BookingDateScreen({
    super.key,
    required this.service,
    required this.vehicleInfo,
  });

  @override
  State<BookingDateScreen> createState() => _BookingDateScreenState();
}

class _BookingDateScreenState extends State<BookingDateScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  TimeSlot? _selectedTimeSlot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn ngày và giờ'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(const Duration(days: 30)),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _selectedTimeSlot = null;
              });
            },
            calendarFormat: CalendarFormat.month,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  'Chọn giờ',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.service.availableTimeSlots
                      .map((timeSlot) => ChoiceChip(
                            label: Text(
                              '${_formatTime(timeSlot.startTime)} - ${_formatTime(timeSlot.endTime)}',
                            ),
                            selected: _selectedTimeSlot == timeSlot,
                            onSelected: timeSlot.isAvailable
                                ? (selected) {
                                    setState(() {
                                      _selectedTimeSlot =
                                          selected ? timeSlot : null;
                                    });
                                  }
                                : null,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: _selectedTimeSlot != null
                ? () {
                    // TODO: Xử lý đặt lịch
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Đặt lịch thành công!'),
                      ),
                    );
                    Navigator.popUntil(
                      context,
                      (route) => route.isFirst,
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Xác nhận đặt lịch',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
