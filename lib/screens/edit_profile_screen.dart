import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './/providers/profile.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/edit-profile';

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _form = GlobalKey<FormState>();

  var _editedProfile = Profile(
    name: '',
    email: '',
    mobileNumber: '',
    role: '',
    age: 0,
    gender: '',
  );
  late Map<String, String> _initValues = {
    'name': '',
    'email': '',
    'imageUrl': '',
    'mobileNumber': '',
    'age': 0.toString(),
    'gender': '',
  };

  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final profile = Provider.of<Profiles>(context).profile;
      _editedProfile = profile;

      _initValues = {
        'name': profile.name,
        'email': profile.email,
        'imageUrl': profile.imageUrl ?? '',
        'mobileNumber': profile.mobileNumber,
        'age': profile.age.toString(),
        'gender': profile.gender,
      };
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _submitForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    Provider.of<Profiles>(context, listen: false).updateProfile(_editedProfile);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
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
                initialValue: _initValues['name'],
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a name.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProfile = Profile(
                    name: value!,
                    email: _editedProfile.email,
                    imageUrl: _editedProfile.imageUrl,
                    mobileNumber: _editedProfile.mobileNumber,
                    role: _editedProfile.role,
                    age: _editedProfile.age,
                    gender: _editedProfile.gender,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['email'],
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide an email.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProfile = Profile(
                    name: _editedProfile.name,
                    email: value!,
                    imageUrl: _editedProfile.imageUrl,
                    mobileNumber: _editedProfile.mobileNumber,
                    role: _editedProfile.role,
                    age: _editedProfile.age,
                    gender: _editedProfile.gender,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['imageUrl'],
                decoration: const InputDecoration(
                  labelText: 'Image URL',
                ),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  // Add any desired validation for the image URL.
                  return null;
                },
                onSaved: (value) {
                  _editedProfile = Profile(
                    name: _editedProfile.name,
                    email: _editedProfile.email,
                    imageUrl: value!,
                    mobileNumber: _editedProfile.mobileNumber,
                    role: _editedProfile.role,
                    age: _editedProfile.age,
                    gender: _editedProfile.gender,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['mobileNumber'],
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                ),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a mobile number.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProfile = Profile(
                    name: _editedProfile.name,
                    email: _editedProfile.email,
                    imageUrl: _editedProfile.imageUrl,
                    role: _editedProfile.role,
                    mobileNumber: value!,
                    age: _editedProfile.age,
                    gender: _editedProfile.gender,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['age'],
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide an age.';
                  }
                  final age = int.tryParse(value);
                  if (age == null || age <= 0) {
                    return 'Please provide a valid age.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProfile = Profile(
                    name: _editedProfile.name,
                    email: _editedProfile.email,
                    imageUrl: _editedProfile.imageUrl,
                    mobileNumber: _editedProfile.mobileNumber,
                    role: _editedProfile.role,
                    age: int.parse(value!),
                    gender: _editedProfile.gender,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['gender'],
                decoration: const InputDecoration(
                  labelText: 'Gender',
                ),
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a gender.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProfile = Profile(
                    name: _editedProfile.name,
                    email: _editedProfile.email,
                    imageUrl: _editedProfile.imageUrl,
                    mobileNumber: _editedProfile.mobileNumber,
                    role: _editedProfile.role,
                    age: _editedProfile.age,
                    gender: value!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
