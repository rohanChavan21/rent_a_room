import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_room/providers/rooms.dart';
import 'package:rent_a_room/widgets/drawerr.dart';
import 'package:rent_a_room/widgets/room_item.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final wishListRooms = Provider.of<Rooms>(context).wishlistItem;

    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawerr(),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Builder(
                        builder: (ctx) => IconButton(
                          icon: const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('images/profile2.png'),
                          ),
                          onPressed: () {
                            Scaffold.of(ctx).openDrawer();
                          },
                          iconSize: 48.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Your Wishlist',
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        iconSize: 25,
                        icon: const Icon(
                          Icons.bookmark,
                          color: Colors.purple,
                        ),
                        onPressed: () {
                          // ...
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: wishListRooms.length,
              itemBuilder: (ctx, i) {
                return RoomItem(
                  id: wishListRooms[i].id!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
