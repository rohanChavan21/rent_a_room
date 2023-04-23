import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_room/providers/rooms.dart';
import 'package:rent_a_room/screens/home_screen.dart';
import 'package:rent_a_room/screens/login_screen.dart';
import 'package:rent_a_room/screens/room_overview_screen.dart';
import 'package:rent_a_room/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Rooms(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.grey,
          ),
        ),
        home: LoginScreen(),
        routes: {
          MyHomePage.routeName: (ctx) => const MyHomePage(),
          RoomOverviewScreen.routeName: (ctx) => const RoomOverviewScreen(),
          SearchScreen.routeName: (ctx) => SearchScreen()
        },
      ),
    );
  }
}
