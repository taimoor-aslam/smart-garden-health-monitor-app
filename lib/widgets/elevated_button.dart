import 'package:flutter/material.dart';
import '../admin_portal/admin_portal.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  CustomElevatedButton(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 130,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPortal('admin')));
        },
        style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          primary: Colors.teal,
          // side: BorderSide(color: Colors.black),
        ),
        child: Text(
          this.text,
          style: TextStyle(
            fontFamily: 'FredokaOne',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
