import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_room/providers/rooms.dart';
import 'package:rent_a_room/widgets/room_item.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rooms = Provider.of<Rooms>(context);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/profile2.png'),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                iconSize: 48.0,
              ),
              const Center(
                child: Text(
                  'Current Location',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              IconButton(
                iconSize: 25,
                icon: const Icon(
                  Icons.bookmark,
                  color: Colors.purple,
                ),
                onPressed: () {
                  // ...
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.search_sharp,
                    color: Colors.purple,
                  ),
                  onPressed: () {},
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search address, city, location',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: rooms.items.length,
            itemBuilder: (ctx, i) {
              return RoomItem(
                  id: rooms.items[i].id!,
                );
            },
          ),
        ),
      ],
    );
  }
}
