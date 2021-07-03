import 'package:flutter/material.dart';
import '../login/inputfield.dart';
import '../widgets/welcome.dart';
import '../widgets/elevated_button.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String _errText;
  void getVal(String val) {}
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
          padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24),
          //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Welcome('Add User'),
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
                  this._errText, this.getVal),
              SizedBox(
                height: 8,
              ),
              InputField(false, 'username', Icons.supervised_user_circle, 50,
                  this._errText, this.getVal),
              SizedBox(
                height: 8,
              ),
              InputField(
                  false, 'email', Icons.email, 50, this._errText, this.getVal),
              SizedBox(
                height: 8,
              ),
              InputField(false, 'role', Icons.settings, 50, this._errText,
                  this.getVal),
              SizedBox(
                height: 8,
              ),
              InputField(false, 'password', Icons.lock, 50, this._errText,
                  this.getVal),
              SizedBox(
                height: 8,
              ),
              InputField(false, 'confirm password', Icons.lock, 50,
                  this._errText, this.getVal),
              SizedBox(
                height: 8,
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton('Cancel'),
                  SizedBox(
                    width: 5,
                  ),
                  CustomElevatedButton('Add'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
