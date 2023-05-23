import 'package:flutter/material.dart';

class Profile with ChangeNotifier {
  final String name;
  final String mobileNumber;
  final String email;
  final String password;
  final int age;
  final String gender;
  final String? imageUrl;

  Profile({
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.mobileNumber,
    required this.age,
    required this.gender,
    this.password = '',
  });
}

class Profiles with ChangeNotifier {
  final List<Profile> _profiles = [];

  Profile get profile {
    return _profiles[0];
  }

  void addProfile(Profile profile) {
    final newProfile = Profile(
      name: profile.name,
      email: profile.email,
      imageUrl: profile.imageUrl,
      mobileNumber: profile.mobileNumber,
      age: profile.age,
      gender: profile.gender,
    );
    _profiles.insert(0, newProfile);
    notifyListeners();
  }

  void updateProfile(Profile profile) {
    _profiles[0] = profile;
    notifyListeners();
  }

  void logout(Profile profile) {
    _profiles.removeAt(0);
    notifyListeners();
  }
}
