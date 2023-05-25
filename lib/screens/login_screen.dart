import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:rent_a_room/screens/sign_up_screen.dart';
import '/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passFocusNode = FocusNode();

  late String _email;
  late String _password;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: handle login with email and password
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passFocusNode.dispose();
    super.dispose();
  }

  void _signInWithGoogle() {
    // TODO: handle sign in with Google
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Center(
      //     child: Text('Login'),
      //   ),
      // ),
      body: Container(
        color: const Color(0xFF210347),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 230, // Set the desired width
                height: 230, // Set the desired height
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
                        'Please login to continue',
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
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              border: InputBorder.none),
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
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              border: InputBorder.none),
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
                        child: const Text('Login'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed(
                            SignupScreen.routeName,
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              decoration: TextDecoration.underline),
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
    );
  }
}
