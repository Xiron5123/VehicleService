import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../models/service.dart';
import '../../widgets/custom_button.dart';
import 'booking_date_screen.dart';

class VehicleInfoScreen extends StatefulWidget {
  final Service service;
  final Function(Map<String, dynamic>) onSubmitted;

  const VehicleInfoScreen({
    Key? key,
    required this.service,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  _VehicleInfoScreenState createState() => _VehicleInfoScreenState();
}

class _VehicleInfoScreenState extends State<VehicleInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _plateNumberController = TextEditingController();
  final _noteController = TextEditingController();
  String? _selectedBrand;
  String? _selectedModel;
  String? _selectedYear;

  // Danh sách hãng xe phổ biến
  final List<String> _brands = [
    'Toyota',
    'Honda',
    'Mazda',
    'Hyundai',
    'Kia',
    'Ford',
    'Mitsubishi',
    'VinFast',
    'Mercedes-Benz',
    'BMW',
    'Audi',
    'Lexus',
  ];

  // Danh sách mẫu xe theo hãng
  final Map<String, List<String>> _models = {
    'Toyota': ['Camry', 'Corolla', 'Vios', 'Innova', 'Fortuner', 'Hilux'],
    'Honda': ['City', 'Civic', 'Accord', 'CR-V', 'HR-V', 'BR-V'],
    'Mazda': ['Mazda2', 'Mazda3', 'Mazda6', 'CX-3', 'CX-5', 'CX-8'],
    'Hyundai': ['Accent', 'Elantra', 'Tucson', 'Santa Fe', 'Kona'],
    'Kia': ['Morning', 'Cerato', 'Seltos', 'Sportage', 'Sorento'],
    'Ford': ['Fiesta', 'Focus', 'EcoSport', 'Escape', 'Everest', 'Ranger'],
    'Mitsubishi': ['Attrage', 'Xpander', 'Outlander', 'Pajero Sport', 'Triton'],
    'VinFast': ['Fadil', 'Lux A2.0', 'Lux SA2.0', 'VF e34', 'VF 8', 'VF 9'],
    'Mercedes-Benz': ['A-Class', 'C-Class', 'E-Class', 'GLC', 'GLE'],
    'BMW': ['1 Series', '3 Series', '5 Series', 'X1', 'X3', 'X5'],
    'Audi': ['A3', 'A4', 'A6', 'Q3', 'Q5', 'Q7'],
    'Lexus': ['ES', 'NX', 'RX', 'UX'],
  };

  // Danh sách năm sản xuất
  final List<String> _years = List.generate(
    30,
    (index) => (DateTime.now().year - index).toString(),
  );

  @override
  void dispose() {
    _plateNumberController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final vehicleInfo = {
        'brand': _selectedBrand,
        'model': _selectedModel,
        'year': _selectedYear,
        'plateNumber': _plateNumberController.text,
        'note': _noteController.text,
      };
      widget.onSubmitted(vehicleInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin xe'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Animate(
              effects: [FadeEffect(delay: 100.ms), SlideEffect(begin: Offset(0, 0.2))],
              child: DropdownButtonFormField<String>(
                value: _selectedBrand,
                decoration: const InputDecoration(
                  labelText: 'Hãng xe',
                  hintText: 'Chọn hãng xe',
                ),
                items: _brands.map((brand) {
                  return DropdownMenuItem(
                    value: brand,
                    child: Text(brand),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedBrand = value;
                    _selectedModel = null; // Reset model when brand changes
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng chọn hãng xe';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),
            Animate(
              effects: [FadeEffect(delay: 200.ms), SlideEffect(begin: Offset(0, 0.2))],
              child: DropdownButtonFormField<String>(
                value: _selectedModel,
                decoration: const InputDecoration(
                  labelText: 'Mẫu xe',
                  hintText: 'Chọn mẫu xe',
                ),
                items: _selectedBrand != null
                    ? _models[_selectedBrand]!.map((model) {
                        return DropdownMenuItem(
                          value: model,
                          child: Text(model),
                        );
                      }).toList()
                    : [],
                onChanged: (value) {
                  setState(() {
                    _selectedModel = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng chọn mẫu xe';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),
            Animate(
              effects: [FadeEffect(delay: 300.ms), SlideEffect(begin: Offset(0, 0.2))],
              child: DropdownButtonFormField<String>(
                value: _selectedYear,
                decoration: const InputDecoration(
                  labelText: 'Năm sản xuất',
                  hintText: 'Chọn năm sản xuất',
                ),
                items: _years.map((year) {
                  return DropdownMenuItem(
                    value: year,
                    child: Text(year),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedYear = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng chọn năm sản xuất';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),
            Animate(
              effects: [FadeEffect(delay: 400.ms), SlideEffect(begin: Offset(0, 0.2))],
              child: TextFormField(
                controller: _plateNumberController,
                decoration: const InputDecoration(
                  labelText: 'Biển số xe',
                  hintText: 'Nhập biển số xe của bạn',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập biển số xe';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),
            Animate(
              effects: [FadeEffect(delay: 500.ms), SlideEffect(begin: Offset(0, 0.2))],
              child: TextFormField(
                controller: _noteController,
                decoration: const InputDecoration(
                  labelText: 'Ghi chú (tùy chọn)',
                  hintText: 'Nhập ghi chú nếu có',
                ),
                maxLines: 3,
              ),
            ),
            const SizedBox(height: 24),
            Animate(
              effects: [FadeEffect(delay: 600.ms), SlideEffect(begin: Offset(0, 0.2))],
              child: CustomButton(
                onPressed: _submitForm,
                text: 'Tiếp tục',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
