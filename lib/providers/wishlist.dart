import 'package:flutter/material.dart';
import 'package:rent_a_room/providers/room.dart';

class Wishlist with ChangeNotifier {
  final List<Room> _items = [];

  List<Room> get items {
    return [...items];
  }

  List<Room> get wishlistItem {
    return _items
        .where(
          (prod) => prod.isWishlisted,
        )
        .toList();
  }

  void addToWishlist(Room room) {
    final wishlistItem = Room(
      id: room.id,
      title: room.title,
      description: room.description,
      rent: room.rent,
      imageUrl: room.imageUrl,
      location: room.location,
      isBoysHostel: room.isBoysHostel,
      isGirlsHostel: room.isGirlsHostel,
    );

    items.insert(0, wishlistItem);
    notifyListeners();
  }

  void removeFromWishlist(String id, Room room) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
