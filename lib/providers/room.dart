import 'package:flutter/material.dart';

class Room with ChangeNotifier {
  final String? id;
  final String title;
  final String description;
  final double rent;
  final String imageUrl;
  final String location;
  final bool isBoysHostel;
  final bool isGirlsHostel;
  final String ownerNumber;
  double rating;
  int numReviews;
  bool isWishlisted;

  Room({
    required this.id,
    required this.title,
    required this.description,
    required this.rent,
    required this.imageUrl,
    required this.location,
    required this.ownerNumber,
    required this.isBoysHostel,
    required this.isGirlsHostel,
    this.rating = 0.0,
    this.numReviews = 0,
    this.isWishlisted = false,
  });

  void toggleWishlist() {
    isWishlisted = !isWishlisted;
    notifyListeners();
  }

  void addReview(double rating) {
    final newRating = (this.rating * numReviews + rating) / (numReviews + 1);

    this.rating = newRating;

    numReviews++;

    notifyListeners();
  }
}
