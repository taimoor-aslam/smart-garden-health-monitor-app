import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_garden_app/login/login_button.dart';
import 'package:smart_garden_app/signup/signup.dart';
import 'login/inputfield.dart';
import 'widgets/welcome.dart';
import 'forget_password/forget_password.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _errText;
  void getVal(String val) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefefef),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Welcome("Login"),
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.teal,
              backgroundImage: AssetImage('images/logo.png'),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InputField(false, "username", Icons.person, 40, this._errText,
                      this.getVal),
                  SizedBox(
                    height: 10,
                  ),
                  InputField(true, "password", Icons.lock, 40, this._errText,
                      this.getVal),
                  SizedBox(
                    height: 10,
                  ),
                  LoginButton("login", 53),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          child: Text(
                            "Forget Password",
                            style: TextStyle(
                              color: Colors.teal,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgetPassword()));
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          GestureDetector(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
