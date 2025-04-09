import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import '../../models/review.dart';
import '../../models/service.dart';

class ReviewsScreen extends StatelessWidget {
  final Service service;

  const ReviewsScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đánh giá dịch vụ'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: Review.mockReviews.length,
        itemBuilder: (context, index) {
          final review = Review.mockReviews[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(review.customerImage),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              review.customerName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Row(
                              children: [
                                ...List.generate(
                                  5,
                                  (starIndex) => Icon(
                                    Icons.star,
                                    size: 16,
                                    color: starIndex < review.rating
                                        ? Colors.amber
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy').format(review.date),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    review.comment,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ).animate().fadeIn().slideX(delay: (index * 100).ms);
        },
      ),
    );
  }
}
