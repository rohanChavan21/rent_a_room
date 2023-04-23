import 'package:flutter/material.dart';
import 'package:rent_a_room/screens/search_screen.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Promod Adde'),
            accountEmail: Text('PramodAdde@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search Properties'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(SearchScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.bookmark,
            ),
            title: const Text('WishList'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Pay Your Rent'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('About Developers'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
