import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_garden_app/admin_portal/admin_portal.dart';
import 'package:smart_garden_app/signup/user.dart';
import '../widgets/welcome.dart';
import '../login/inputfield.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String data;
  User user = new User();
  String _nameErrorText;
  String _emailErrorText;
  String _usernameErrorText;
  String _passwordErrorText;
  String _cnfrmErrorText;

  void getName(String name) {
    user.name = name;
  }

  void getUsername(String username) {
    user.username = username;
  }

  void getEmail(String email) {
    user.email = email;
  }

  void getPassword(String password) {
    user.password = password;
  }

  void getRole(String role) {
    user.role = role;
  }

  void getConfirmPassword(String password) {
    user.confirmPassword = password;
  }

  Future<http.Response> addUser() async {
    final response = http.post(
      Uri.parse('http://10.141.52.3:3000/signup'),
      // Uri.parse('http://myapidomaincom/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': user.name,
        'username': user.username,
        'email': user.email,
        'password': user.password,
        'role': 'user'
      }),
    );
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffefefef),
      appBar: AppBar(
        backgroundColor: Color(0xffefefef),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.teal),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: double.infinity,
          padding: EdgeInsets.all(16),
          // margin: EdgeInsets.only(left: 16,right: 16),
          color: Color(0xffefefef),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Welcome('Sign up'),
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.teal,
                backgroundImage: AssetImage('images/logo.png'),
              ),
              SizedBox(
                height: 5,
              ),
              InputField(false, 'full name', Icons.perm_identity, 50,
                  this._nameErrorText, this.getName),
              SizedBox(
                height: 8,
              ),
              InputField(false, 'username', Icons.supervised_user_circle, 50,
                  this._usernameErrorText, this.getUsername),
              SizedBox(
                height: 8,
              ),
              InputField(false, 'email', Icons.email, 50, this._emailErrorText,
                  this.getEmail),
              SizedBox(
                height: 8,
              ),
              InputField(true, 'password', Icons.lock, 50,
                  this._passwordErrorText, this.getPassword),
              SizedBox(
                height: 8,
              ),
              InputField(true, 'confirm password', Icons.lock, 50,
                  this._cnfrmErrorText, this.getConfirmPassword),
              SizedBox(
                height: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 180),
                    height: 45,
                    // color:Color(0xffefefef),
                    width: 130,
                    child: ElevatedButton(
                      onPressed: () {
                        if (user.name == null ||
                            user.username == null ||
                            user.email == null ||
                            user.password == null ||
                            user.confirmPassword == null) {
                          if (user.name == null || user.name.isEmpty) {
                            setState(() {
                              this._nameErrorText = "Name field can't be empty";
                              print('hello');
                            });
                          } else {
                            setState(() {
                              this._nameErrorText = '';
                              print("hello 2");
                            });
                          }
                          //   } else if (user.username == null) {
                          //     setState(() {
                          //       this._usernameErrorText =
                          //           "Username can't be empty";
                          //     });
                          //   } else if (user.email == null) {
                          //     setState(() {
                          //       this._emailErrorText =
                          //           "Email field can't be empty";
                          //     });
                          //   } else if (user.password == null) {
                          //     setState(() {
                          //       this._passwordErrorText =
                          //           "Password field can't be empty";
                          //     });
                          //   } else if (user.confirmPassword == null) {
                          //     setState(() {
                          //       this._cnfrmErrorText =
                          //           "Confirm password field can't be empty";
                          //     });
                          //   }
                        } else {
                          if (user.password == user.confirmPassword) {
                            //send data to server
                            addUser().then((res) {
                              data = jsonDecode(res.body)['message'];
                              if (data == 'User added successfully') {
                                //navigating to other screen
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AdminPortal('admin')));
                              } else {
                                if (data == 'email already exist') {
                                  setState(() {
                                    this._emailErrorText =
                                        'email already exist';
                                  });
                                } else {
                                  setState(() {
                                    this._emailErrorText = '';
                                  });
                                }
                                if (data == 'username already exist') {
                                  setState(() {
                                    this._usernameErrorText =
                                        'username already exist';
                                  });
                                } else {
                                  setState(() {
                                    this._usernameErrorText = '';
                                  });
                                }
                              }
                            });
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        primary: Colors.teal,
                        // side: BorderSide(color: Colors.black),
                      ),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          // fontFamily: 'FredokaOne',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  GestureDetector(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()),
                      // );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
