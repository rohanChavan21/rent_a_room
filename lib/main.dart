import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_room/providers/profile.dart';
import 'package:rent_a_room/providers/rooms.dart';
import 'package:rent_a_room/screens/edit_profile_screen.dart';
import 'package:rent_a_room/screens/home_screen.dart';
import 'package:rent_a_room/screens/login_screen.dart';
import 'package:rent_a_room/screens/room_overview_screen.dart';
import 'package:rent_a_room/screens/search_screen.dart';
import 'package:rent_a_room/screens/sign_up_screen.dart';
import 'package:rent_a_room/screens/wishlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Rooms(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Profiles(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: const MaterialColor(
              0xFF210347, // RGB value of 33, 3, 71
              {
                50: Color(0xFFE5E0F5),
                100: Color(0xFFBDB1E1),
                200: Color(0xFF9481CD),
                300: Color(0xFF6C52B9),
                400: Color(0xFF4E2DA9),
                500: Color(0xFF330371),
                600: Color(0xFF2E056C),
                700: Color(0xFF26045F),
                800: Color(0xFF1F0454),
                900: Color(0xFF120342),
              },
            ),
          ).copyWith(
            secondary: Colors.grey,
          ),
        ),
        home: LoginScreen(),
        routes: {
          MyHomePage.routeName: (ctx) => const MyHomePage(),
          RoomOverviewScreen.routeName: (ctx) => const RoomOverviewScreen(),
          SearchScreen.routeName: (ctx) => SearchScreen(),
          WishlistScreen.routeName: (ctx) => WishlistScreen(),
          SignupScreen.routeName: (ctx) => SignupScreen(),
          EditProfileScreen.routeName: (ctx) => EditProfileScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
        },
      ),
    );
  }
}
