import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/welcome.dart';
import '../login/inputfield.dart';
import '../widgets/elevated_button.dart';

class RemoveUser extends StatefulWidget {
  @override
  _RemoveUserState createState() => _RemoveUserState();
}

class _RemoveUserState extends State<RemoveUser> {
  String _errText;
  void getVal(String val) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xffefefef),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.teal),
      ),
      backgroundColor: Color(0xffefefef),
      body: Container(
        // padding: EdgeInsets.all(24),
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Welcome('Remove User'),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 300,
              width: 300,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffefefef),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.teal,
                    backgroundImage: AssetImage('images/logo.png'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputField(false, 'username', Icons.supervised_user_circle,
                      50, this._errText, this.getVal),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomElevatedButton('Cancel'),
                      SizedBox(
                        width: 5,
                      ),
                      CustomElevatedButton('Remove'),
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
