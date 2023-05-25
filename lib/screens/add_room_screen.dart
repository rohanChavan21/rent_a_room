import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_room/providers/room.dart';
import 'package:rent_a_room/providers/rooms.dart';

class AddRoomScreen extends StatefulWidget {
  static const routeName = '/add-room';

  @override
  _AddRoomScreenState createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  final _form = GlobalKey<FormState>();

  var _editedRoom = Room(
    id: '',
    title: '',
    description: '',
    rent: 0.0,
    imageUrl: '',
    location: '',
    rating: 0.0,
    numReviews: 0,
    ownerNumber: '',
    isWishlisted: false,
    isBoysHostel: false,
    isGirlsHostel: false,
  );

  void _submitForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    Provider.of<Rooms>(context, listen: false).addRoom(_editedRoom);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Room'),
        actions: [
          IconButton(
            onPressed: _submitForm,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a title.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedRoom = Room(
                    id: _editedRoom.id,
                    title: value!,
                    description: _editedRoom.description,
                    rent: _editedRoom.rent,
                    imageUrl: _editedRoom.imageUrl,
                    location: _editedRoom.location,
                    rating: _editedRoom.rating,
                    numReviews: _editedRoom.numReviews,
                    ownerNumber: _editedRoom.ownerNumber,
                    isWishlisted: _editedRoom.isWishlisted,
                    isBoysHostel: _editedRoom.isBoysHostel,
                    isGirlsHostel: _editedRoom.isGirlsHostel,
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a description.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedRoom = Room(
                    id: _editedRoom.id,
                    title: _editedRoom.title,
                    description: value!,
                    rent: _editedRoom.rent,
                    imageUrl: _editedRoom.imageUrl,
                    location: _editedRoom.location,
                    rating: _editedRoom.rating,
                    numReviews: _editedRoom.numReviews,
                    ownerNumber: _editedRoom.ownerNumber,
                    isWishlisted: _editedRoom.isWishlisted,
                    isBoysHostel: _editedRoom.isBoysHostel,
                    isGirlsHostel: _editedRoom.isGirlsHostel,
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Rent',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide the rent amount.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please provide a valid rent amount.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedRoom = Room(
                    id: _editedRoom.id,
                    title: _editedRoom.title,
                    description: _editedRoom.description,
                    rent: double.parse(value!),
                    imageUrl: _editedRoom.imageUrl,
                    location: _editedRoom.location,
                    rating: _editedRoom.rating,
                    numReviews: _editedRoom.numReviews,
                    ownerNumber: _editedRoom.ownerNumber,
                    isWishlisted: _editedRoom.isWishlisted,
                    isBoysHostel: _editedRoom.isBoysHostel,
                    isGirlsHostel: _editedRoom.isGirlsHostel,
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Image URL',
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide an image URL.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedRoom = Room(
                    id: _editedRoom.id,
                    title: _editedRoom.title,
                    description: _editedRoom.description,
                    rent: _editedRoom.rent,
                    imageUrl: value!,
                    location: _editedRoom.location,
                    rating: _editedRoom.rating,
                    numReviews: _editedRoom.numReviews,
                    ownerNumber: _editedRoom.ownerNumber,
                    isWishlisted: _editedRoom.isWishlisted,
                    isBoysHostel: _editedRoom.isBoysHostel,
                    isGirlsHostel: _editedRoom.isGirlsHostel,
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a location.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedRoom = Room(
                    id: _editedRoom.id,
                    title: _editedRoom.title,
                    description: _editedRoom.description,
                    rent: _editedRoom.rent,
                    imageUrl: _editedRoom.imageUrl,
                    location: value!,
                    rating: _editedRoom.rating,
                    numReviews: _editedRoom.numReviews,
                    ownerNumber: _editedRoom.ownerNumber,
                    isWishlisted: _editedRoom.isWishlisted,
                    isBoysHostel: _editedRoom.isBoysHostel,
                    isGirlsHostel: _editedRoom.isGirlsHostel,
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Rating',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide the rating.';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please provide a valid rating.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedRoom = Room(
                    id: _editedRoom.id,
                    title: _editedRoom.title,
                    description: _editedRoom.description,
                    rent: _editedRoom.rent,
                    imageUrl: _editedRoom.imageUrl,
                    location: _editedRoom.location,
                    rating: double.parse(value!),
                    numReviews: _editedRoom.numReviews,
                    ownerNumber: _editedRoom.ownerNumber,
                    isWishlisted: _editedRoom.isWishlisted,
                    isBoysHostel: _editedRoom.isBoysHostel,
                    isGirlsHostel: _editedRoom.isGirlsHostel,
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Number of Reviews',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide the number of reviews.';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please provide a valid number of reviews.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedRoom = Room(
                    id: _editedRoom.id,
                    title: _editedRoom.title,
                    description: _editedRoom.description,
                    rent: _editedRoom.rent,
                    imageUrl: _editedRoom.imageUrl,
                    location: _editedRoom.location,
                    rating: _editedRoom.rating,
                    numReviews: int.parse(value!),
                    ownerNumber: _editedRoom.ownerNumber,
                    isWishlisted: _editedRoom.isWishlisted,
                    isBoysHostel: _editedRoom.isBoysHostel,
                    isGirlsHostel: _editedRoom.isGirlsHostel,
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Owner Contact Number',
                ),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide the owner contact number.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedRoom = Room(
                    id: _editedRoom.id,
                    title: _editedRoom.title,
                    description: _editedRoom.description,
                    rent: _editedRoom.rent,
                    imageUrl: _editedRoom.imageUrl,
                    location: _editedRoom.location,
                    rating: _editedRoom.rating,
                    numReviews: _editedRoom.numReviews,
                    ownerNumber: value!,
                    isWishlisted: _editedRoom.isWishlisted,
                    isBoysHostel: _editedRoom.isBoysHostel,
                    isGirlsHostel: _editedRoom.isGirlsHostel,
                  );
                },
              ),
              SwitchListTile(
                title: Text('Is Wishlisted'),
                value: _editedRoom.isWishlisted,
                onChanged: (newValue) {
                  setState(() {
                    _editedRoom = Room(
                      id: _editedRoom.id,
                      title: _editedRoom.title,
                      description: _editedRoom.description,
                      rent: _editedRoom.rent,
                      imageUrl: _editedRoom.imageUrl,
                      location: _editedRoom.location,
                      rating: _editedRoom.rating,
                      numReviews: _editedRoom.numReviews,
                      ownerNumber: _editedRoom.ownerNumber,
                      isWishlisted: newValue,
                      isBoysHostel: _editedRoom.isBoysHostel,
                      isGirlsHostel: _editedRoom.isGirlsHostel,
                    );
                  });
                },
              ),
              SwitchListTile(
                title: Text('Is Boys Hostel'),
                value: _editedRoom.isBoysHostel,
                onChanged: (newValue) {
                  setState(() {
                    _editedRoom = Room(
                      id: _editedRoom.id,
                      title: _editedRoom.title,
                      description: _editedRoom.description,
                      rent: _editedRoom.rent,
                      imageUrl: _editedRoom.imageUrl,
                      location: _editedRoom.location,
                      rating: _editedRoom.rating,
                      numReviews: _editedRoom.numReviews,
                      ownerNumber: _editedRoom.ownerNumber,
                      isWishlisted: _editedRoom.isWishlisted,
                      isBoysHostel: newValue,
                      isGirlsHostel: _editedRoom.isGirlsHostel,
                    );
                  });
                },
              ),
              SwitchListTile(
                title: Text('Is Girls Hostel'),
                value: _editedRoom.isGirlsHostel,
                onChanged: (newValue) {
                  setState(() {
                    _editedRoom = Room(
                      id: _editedRoom.id,
                      title: _editedRoom.title,
                      description: _editedRoom.description,
                      rent: _editedRoom.rent,
                      imageUrl: _editedRoom.imageUrl,
                      location: _editedRoom.location,
                      rating: _editedRoom.rating,
                      numReviews: _editedRoom.numReviews,
                      ownerNumber: _editedRoom.ownerNumber,
                      isWishlisted: _editedRoom.isWishlisted,
                      isBoysHostel: _editedRoom.isBoysHostel,
                      isGirlsHostel: newValue,
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
