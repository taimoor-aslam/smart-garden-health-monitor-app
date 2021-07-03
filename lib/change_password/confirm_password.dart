import 'package:flutter/material.dart';
import '../login/inputfield.dart';
import '../change_password/change_password.dart';

class ConfirmPassword extends StatefulWidget {
  @override
  _ConfirmPasswordState createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
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
            InputField(false, 'Enter your current password', Icons.lock, 40,
                this._errText, this.getVal),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 53,
              color: Color(0xffefefef),
              width: 130,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePassword()));
                },
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  primary: Colors.teal,
                  // side: BorderSide(color: Colors.black),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontFamily: 'FredokaOne',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
