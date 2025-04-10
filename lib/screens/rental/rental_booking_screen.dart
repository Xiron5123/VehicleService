import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../models/vehicle.dart';
import '../../widgets/custom_button.dart';

class RentalBookingScreen extends StatefulWidget {
  final Vehicle vehicle;
  final Map<String, dynamic> vehicleInfo;
  final DateTime bookingDate;
  final String timeSlot;

  const RentalBookingScreen({
    Key? key,
    required this.vehicle,
    required this.vehicleInfo,
    required this.bookingDate,
    required this.timeSlot,
  }) : super(key: key);

  @override
  State<RentalBookingScreen> createState() => _RentalBookingScreenState();
}

class _RentalBookingScreenState extends State<RentalBookingScreen> {
  int _rentalDays = 1;
  DateTime _selectedStartDate = DateTime.now();
  String? _selectedPaymentMethod;
  bool _acceptedTerms = false;
  bool _isLoading = false;
  final _currencyFormat = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: '',
    decimalDigits: 0,
  );
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullNameController.text = widget.vehicleInfo['fullName'] ?? '';
    _phoneController.text = widget.vehicleInfo['phone'] ?? '';
    _emailController.text = widget.vehicleInfo['email'] ?? '';
    _notesController.text = widget.vehicleInfo['notes'] ?? '';
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  // Kiểm tra xem ngày có hợp lệ không
  bool _isValidDate(DateTime date) {
    final now = DateTime.now();
    final maxDate = now.add(const Duration(days: 30));
    return date.isAfter(now.subtract(const Duration(days: 1))) &&
        date.isBefore(maxDate.add(const Duration(days: 1)));
  }

  // Kiểm tra xem số ngày thuê có hợp lệ không
  bool _isValidRentalDays(int days) {
    return days >= 1 && days <= 30;
  }

  Future<void> _confirmBooking() async {
    if (!_acceptedTerms ||
        _selectedPaymentMethod == null ||
        !_isValidDate(_selectedStartDate) ||
        !_isValidRentalDays(_rentalDays)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng kiểm tra lại thông tin đặt xe'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // TODO: Implement actual booking logic
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      if (!mounted) return;

      // Show success dialog
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Đặt xe thành công'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Xe: ${widget.vehicle.name}'),
              Text(
                  'Ngày bắt đầu: ${DateFormat('dd/MM/yyyy').format(_selectedStartDate)}'),
              Text('Số ngày thuê: $_rentalDays'),
              Text(
                  'Tổng thanh toán: ${_currencyFormat.format(widget.vehicle.calculateRentalPrice(_rentalDays) + widget.vehicle.depositAmount)} VNĐ'),
              const SizedBox(height: 16),
              const Text(
                  'Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất để xác nhận đặt xe.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Return to previous screen
              },
              child: const Text('Đóng'),
            ),
          ],
        ),
      );
    } catch (e) {
      if (!mounted) return;

      // Show error dialog
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Lỗi'),
          content:
              const Text('Đã có lỗi xảy ra khi đặt xe. Vui lòng thử lại sau.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Đóng'),
            ),
          ],
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement booking submission
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Đặt xe thành công'),
          content: const Text('Chúng tôi sẽ liên hệ với bạn sớm nhất có thể.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = widget.vehicle.calculateRentalPrice(_rentalDays);
    final totalDeposit = widget.vehicle.depositAmount;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
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

                // Thông tin người thuê
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thông tin người thuê',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildInfoRow('Họ tên', widget.vehicleInfo['fullName']),
                        _buildInfoRow(
                            'Số điện thoại', widget.vehicleInfo['phone']),
                        _buildInfoRow('Email', widget.vehicleInfo['email']),
                      ],
                    ),
                  ),
                ).animate().fadeIn().slideX(
                      begin: 0.2,
                      duration: 600.ms,
                      delay: 200.ms,
                    ),

                const SizedBox(height: 16),

                // Chọn ngày bắt đầu thuê
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chọn ngày bắt đầu thuê',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TableCalendar(
                          firstDay: DateTime.now(),
                          lastDay: DateTime.now().add(const Duration(days: 30)),
                          focusedDay: _selectedStartDate,
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedStartDate, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedStartDate = selectedDay;
                            });
                          },
                          calendarStyle: CalendarStyle(
                            selectedDecoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                            todayDecoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
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
                      delay: 400.ms,
                    ),

                const SizedBox(height: 16),

                // Chọn số ngày thuê
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chọn số ngày thuê',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            IconButton(
                              onPressed: _rentalDays > 1
                                  ? () => setState(() => _rentalDays--)
                                  : null,
                              icon: const Icon(Icons.remove_circle_outline),
                              color:
                                  _rentalDays > 1 ? Colors.blue : Colors.grey,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                '$_rentalDays ngày',
                                style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: _rentalDays < 30
                                  ? () => setState(() => _rentalDays++)
                                  : null,
                              icon: const Icon(Icons.add_circle_outline),
                              color:
                                  _rentalDays < 30 ? Colors.blue : Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).animate().fadeIn().slideX(
                      begin: 0.2,
                      duration: 600.ms,
                      delay: 600.ms,
                    ),

                const SizedBox(height: 16),

                // Chọn phương thức thanh toán
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phương thức thanh toán',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ...widget.vehicle.paymentMethods.map((method) {
                          return RadioListTile<String>(
                            title: Text(method),
                            value: method,
                            groupValue: _selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _selectedPaymentMethod = value;
                              });
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ).animate().fadeIn().slideX(
                      begin: 0.2,
                      duration: 600.ms,
                      delay: 800.ms,
                    ),

                const SizedBox(height: 16),

                // Điều khoản thuê xe
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Điều khoản thuê xe',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ...widget.vehicle.rentalTerms.entries.map((entry) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('• '),
                                Expanded(
                                  child: Text(
                                    '${entry.key}: ${entry.value}',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Checkbox(
                              value: _acceptedTerms,
                              onChanged: (value) {
                                setState(() {
                                  _acceptedTerms = value ?? false;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                'Tôi đã đọc và đồng ý với các điều khoản thuê xe',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).animate().fadeIn().slideX(
                      begin: 0.2,
                      duration: 600.ms,
                      delay: 1000.ms,
                    ),

                const SizedBox(height: 16),

                // Tổng thanh toán
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tổng thanh toán',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildPriceRow(
                          'Giá thuê xe',
                          widget.vehicle.pricePerDay * _rentalDays,
                        ),
                        if (widget.vehicle.priceDiscounts.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          ...widget.vehicle.priceDiscounts.entries.map((entry) {
                            if (_rentalDays >= entry.key) {
                              final discountAmount =
                                  widget.vehicle.pricePerDay *
                                      _rentalDays *
                                      entry.value;
                              return _buildPriceRow(
                                'Giảm giá (${(entry.value * 100).toInt()}%)',
                                -discountAmount,
                                isDiscount: true,
                              );
                            }
                            return const SizedBox.shrink();
                          }),
                        ],
                        const Divider(height: 32),
                        _buildPriceRow(
                          'Tổng tiền thuê',
                          totalPrice,
                          isTotal: true,
                        ),
                        const SizedBox(height: 8),
                        _buildPriceRow(
                          'Tiền cọc',
                          totalDeposit,
                        ),
                        const Divider(height: 32),
                        _buildPriceRow(
                          'Tổng thanh toán',
                          totalPrice + totalDeposit,
                          isTotal: true,
                          isFinal: true,
                        ),
                      ],
                    ),
                  ),
                ).animate().fadeIn().slideX(
                      begin: 0.2,
                      duration: 600.ms,
                      delay: 1200.ms,
                    ),

                const SizedBox(height: 24),

                // Nút xác nhận
                CustomButton(
                  text: 'Xác nhận đặt xe',
                  onPressed: (_selectedPaymentMethod != null &&
                          _acceptedTerms &&
                          !_isLoading)
                      ? () {
                          _confirmBooking();
                        }
                      : null,
                ).animate().fadeIn().slideY(
                      begin: 0.2,
                      duration: 600.ms,
                      delay: 1400.ms,
                    ),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(
    String label,
    double amount, {
    bool isDiscount = false,
    bool isTotal = false,
    bool isFinal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: isTotal ? 16 : 14,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                color: isDiscount ? Colors.green : Colors.black,
              ),
            ),
          ),
          Text(
            '${_currencyFormat.format(amount)} VNĐ',
            style: GoogleFonts.roboto(
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isDiscount
                  ? Colors.green
                  : isFinal
                      ? Colors.blue
                      : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
