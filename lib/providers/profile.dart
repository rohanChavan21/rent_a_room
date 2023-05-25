import 'package:flutter/material.dart';

class Profile with ChangeNotifier {
  final String name;
  final String mobileNumber;
  final String email;
  final String password;
  final String role;
  final int age;
  final String gender;
  final String? imageUrl;

  Profile({
    required this.name,
    required this.email,
    this.imageUrl,
    required this.mobileNumber,
    required this.role,
    required this.age,
    required this.gender,
    this.password = '',
  });
}

class Profiles with ChangeNotifier {
  final List<Profile> _profiles = [
    Profile(
    name: 'Promod Adde',
    email: 'PramodAdde@gmail.com',
    imageUrl: 'images/profile2.png',
    mobileNumber: '9322289768',
    role: 'Renter',
    age: 20,
    gender: 'male',
  ),
  ];

  Profile get profile {
    return _profiles[0];
  }

  void addProfile(Profile profile) {
    final newProfile = Profile(
      name: profile.name,
      email: profile.email,
      imageUrl: profile.imageUrl,
      mobileNumber: profile.mobileNumber,
      role: profile.role,
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
