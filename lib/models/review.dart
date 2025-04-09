import 'service.dart';

class Review {
  final int id;
  final Service service;
  final String customerName;
  final String customerImage;
  final double rating;
  final String comment;
  final DateTime date;

  Review({
    required this.id,
    required this.service,
    required this.customerName,
    required this.customerImage,
    required this.rating,
    required this.comment,
    required this.date,
  });

  // Mock data
  static List<Review> mockReviews = [
    Review(
      id: 1,
      service: Service.mockServices[0],
      customerName: 'Sarah Wilson',
      customerImage: 'assets/images/avatar1.jpg',
      rating: 5.0,
      comment: 'Great service! My car looks brand new. The staff was very professional and thorough.',
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Review(
      id: 2,
      service: Service.mockServices[1],
      customerName: 'David Brown',
      customerImage: 'assets/images/avatar2.jpg',
      rating: 4.5,
      comment: 'The detailing service was excellent. They paid attention to every detail and my car has never looked better.',
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Review(
      id: 3,
      service: Service.mockServices[2],
      customerName: 'Emily Davis',
      customerImage: 'assets/images/avatar3.jpg',
      rating: 4.0,
      comment: 'Quick and efficient oil change service. The staff was friendly and professional.',
      date: DateTime.now().subtract(const Duration(days: 7)),
    ),
  ];
} 