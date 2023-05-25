import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_room/providers/profile.dart';
import 'package:rent_a_room/screens/add_room_screen.dart';
import 'package:rent_a_room/screens/search_screen.dart';
import 'package:rent_a_room/screens/wishlist_screen.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profiles>(context).profile;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(profile.name),
            accountEmail: Text(profile.email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(profile.imageUrl!),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.search,
              color: Colors.amber,
            ),
            title: const Text('Search Properties'),
            onTap: () {
              Navigator.of(context).pushNamed(
                SearchScreen.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.bookmark,
              color: Colors.purple,
            ),
            title: const Text('WishList'),
            onTap: () {
              Navigator.of(context).pushNamed(
                WishlistScreen.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.payment,
              color: Colors.green,
            ),
            title: const Text('Pay Your Rent'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.add,
              color: Colors.cyan,
            ),
            title: const Text('Add Room'),
            onTap: () {
              Navigator.of(context).pushNamed(
                AddRoomScreen.routeName,
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            height: 20,
            thickness: 2,
            color: Colors.grey[400],
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Color(0xFF210347),
            ),
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
