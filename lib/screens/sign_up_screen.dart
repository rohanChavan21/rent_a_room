import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:rent_a_room/screens/login_screen.dart';
import '/screens/home_screen.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/sign-up';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passFocusNode = FocusNode();

  String _name = '';
  String _age = '';
  bool _isOwner = false;
  bool _isMale = false;
  String _email = '';
  String _password = '';
  String _mobileNumber = '';

  final List<String> _genders = ['Male', 'Female'];

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Handle signup with the entered details
    }
  }

  @override
  void dispose() {
    _passFocusNode.dispose();
    super.dispose();
  }

  void _signInWithGoogle() {
    // TODO: Handle sign in with Google
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF210347),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 230,
                  height: 230,
                  child: Image(
                    image: AssetImage('images/1.jpg'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Please sign up to continue',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.only(left: 35, right: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5E0F5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              hintText: 'Enter your name',
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_passFocusNode);
                            },
                            onSaved: (value) {
                              _name = value!;
                            },
                          ),
                        ),
                        const SizedBox(height: 18),
                        Container(
                          padding: const EdgeInsets.only(left: 35, right: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5E0F5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Age',
                              hintText: 'Enter your age',
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your age';
                              }
                              return null;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_passFocusNode);
                            },
                            onSaved: (value) {
                              _age = value!;
                            },
                          ),
                        ),
                        const SizedBox(height: 18),
                        SwitchListTile(
                          title: const Text('Owner'),
                          value: _isOwner,
                          onChanged: (value) {
                            setState(() {
                              _isOwner = value;
                            });
                          },
                        ),
                        const SizedBox(height: 18),
                        Container(
                          padding: const EdgeInsets.only(left: 35, right: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5E0F5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_passFocusNode);
                            },
                            onSaved: (value) {
                              _email = value!;
                            },
                          ),
                        ),
                        const SizedBox(height: 18),
                        Container(
                          padding: const EdgeInsets.only(left: 35, right: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5E0F5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: 'Mobile Number',
                              hintText: 'Enter your mobile number',
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your mobile number';
                              }
                              return null;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_passFocusNode);
                            },
                            onSaved: (value) {
                              _mobileNumber = value!;
                            },
                          ),
                        ),
                        const SizedBox(height: 18),
                        SwitchListTile(
                          title: const Text('Male'),
                          value: _isMale,
                          onChanged: (value) {
                            setState(() {
                              _isMale = value;
                            });
                          },
                        ),
                        const SizedBox(height: 18),
                        Container(
                          padding: const EdgeInsets.only(left: 35, right: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5E0F5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            focusNode: _passFocusNode,
                            onSaved: (value) {
                              _password = value!;
                            },
                          ),
                        ),
                        const SizedBox(height: 18),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              MyHomePage.routeName,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: const Size(400, 50),
                          ),
                          child: const Text('Sign Up'),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed(
                              LoginScreen.routeName,
                            );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: SignInButton(
                    Buttons.Google,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: _signInWithGoogle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
