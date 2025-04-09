class Vehicle {
  final int id;
  final String name;
  final String brand;
  final String model;
  final int year;
  final String type; // sedan, SUV, truck, etc.
  final String transmission; // automatic, manual
  final String fuelType; // petrol, diesel, electric, hybrid
  final int seats;
  final String imageUrl;
  final double pricePerDay;
  final double rating;
  final int reviewCount;
  final List<String> features;
  final bool isAvailable;

  Vehicle({
    required this.id,
    required this.name,
    required this.brand,
    required this.model,
    required this.year,
    required this.type,
    required this.transmission,
    required this.fuelType,
    required this.seats,
    required this.imageUrl,
    required this.pricePerDay,
    required this.rating,
    required this.reviewCount,
    required this.features,
    required this.isAvailable,
  });

  // Mock data
  static List<Vehicle> mockVehicles = [
    Vehicle(
      id: 1,
      name: 'Toyota Camry',
      brand: 'Toyota',
      model: 'Camry',
      year: 2022,
      type: 'Sedan',
      transmission: 'Automatic',
      fuelType: 'Petrol',
      seats: 5,
      imageUrl: 'assets/images/camry.jpg',
      pricePerDay: 59.99,
      rating: 4.7,
      reviewCount: 45,
      features: [
        'Bluetooth',
        'Backup Camera',
        'Cruise Control',
        'Keyless Entry',
        'Air Conditioning',
      ],
      isAvailable: true,
    ),
    Vehicle(
      id: 2,
      name: 'Honda CR-V',
      brand: 'Honda',
      model: 'CR-V',
      year: 2023,
      type: 'SUV',
      transmission: 'Automatic',
      fuelType: 'Hybrid',
      seats: 5,
      imageUrl: 'assets/images/crv.jpg',
      pricePerDay: 79.99,
      rating: 4.8,
      reviewCount: 32,
      features: [
        'Bluetooth',
        'Backup Camera',
        'Cruise Control',
        'Keyless Entry',
        'Air Conditioning',
        'All-Wheel Drive',
      ],
      isAvailable: true,
    ),
    Vehicle(
      id: 3,
      name: 'Tesla Model 3',
      brand: 'Tesla',
      model: 'Model 3',
      year: 2023,
      type: 'Sedan',
      transmission: 'Automatic',
      fuelType: 'Electric',
      seats: 5,
      imageUrl: 'assets/images/tesla.jpg',
      pricePerDay: 99.99,
      rating: 4.9,
      reviewCount: 78,
      features: [
        'Autopilot',
        'Touchscreen Display',
        'Bluetooth',
        'Keyless Entry',
        'Air Conditioning',
        'Supercharger Network Access',
      ],
      isAvailable: true,
    ),
  ];
} 