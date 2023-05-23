import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_room/providers/room.dart';
import 'package:rent_a_room/providers/rooms.dart';
import 'package:rent_a_room/screens/home_screen.dart';

class RoomOverviewScreen extends StatefulWidget {
  static const routeName = '/room-overview';

  const RoomOverviewScreen({super.key});

  @override
  State<RoomOverviewScreen> createState() => _RoomOverviewScreenState();
}

class _RoomOverviewScreenState extends State<RoomOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final roomId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedRoom =
        Provider.of<Rooms>(context, listen: false).findById(roomId);
    bool toggle = false;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .popAndPushNamed(MyHomePage.routeName);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () => {
                            setState(() {
                              toggle = !toggle;
                            }),
                            loadedRoom.toggleWishlist(),
                          },
                          icon: Icon(
                            loadedRoom.isWishlisted
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                          ),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(loadedRoom.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              loadedRoom.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              loadedRoom.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(
                loadedRoom.rating.toString(),
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber,
                ),
                child: Text(
                  '${loadedRoom.numReviews} Reviews',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.call,
                    ),
                    label: const Text(
                      'Contact Owner',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.home_filled,
                    ),
                    label: const Text(
                      'Book Now',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
