import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../login/inputfield.dart';
import '../login/login_button.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String _errText;
  void getVal(String val) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefefef),
      appBar: AppBar(
        backgroundColor: Color(0xffefefef),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.teal),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            InputField(false, 'Enter your e-mail', Icons.email, 40,
                this._errText, this.getVal),
            SizedBox(
              height: 15,
            ),
            LoginButton('Done', 53),
          ],
        ),
      ),
    );
  }
}
