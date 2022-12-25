import 'package:ecommerce3/Admin/admin_home.dart';
import 'package:ecommerce3/Screens/home_page.dart';
import 'package:ecommerce3/Screens/signup_screen.dart';
import 'package:ecommerce3/Services/auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;
  final adminPassword = 'admin123';
  final _auth = Auth();

  bool isAdmin = false;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[100],
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 170,
                ),
                /*IconButton(
               onPressed: (){},
               icon: Icon(Icons.ac_unit_sharp, size: 100,)),*/

                Text(
                  'SuperMarket',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 50,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    onSaved: (value) {
                      _email = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ' Please Enter am E-mail';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email',
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.redAccent[200],
                      ),
                      fillColor: Colors.white54,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ' Please Enter a password';
                      }
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.redAccent[200],
                      ),
                      fillColor: Colors.white54,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      if (_globalKey.currentState!.validate()) {
                        _globalKey.currentState!.save();
                        if (isAdmin) {
                          if (_password == adminPassword) {
                            final authResult =
                                await _auth.signIn(_email.trim(), _password.trim());
                            Navigator.pushNamed(context, AdminHome.id);
                          } else {
                            Navigator.pushNamed(context, LoginScreen.id);
                          }
                        } else {
                          final authResult =
                              await _auth.signIn(_email.trim(), _password.trim());
                          Navigator.pushNamed(context, HomePage.id);
                        }
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignupScreen.id);
                  },
                  child: Text('Do not have an account ? Sign up'),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isAdmin = true;
                        });
                      },
                      child: Text(
                        'I am an Admin',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isAdmin ? Colors.red : Colors.black,
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isAdmin = false;
                        });
                      },
                      child: Text(
                        'I am a User',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isAdmin ? Colors.black : Colors.red,
                        ),
                      ),
                    )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
