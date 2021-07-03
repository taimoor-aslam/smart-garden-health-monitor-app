import 'package:flutter/material.dart';
import 'package:smart_garden_app/admin_portal/admin_portal.dart';

class LoginButton extends StatelessWidget {
  final String btnTxt;
  final double height;
  LoginButton(this.btnTxt,this.height);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: this.height,
        color:Color(0xffefefef),
        width: 130,
        child: ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPortal('user')));
        },
            style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
              primary: Colors.teal,
              // side: BorderSide(color: Colors.black),
            ),
            child: Text(this.btnTxt,style: TextStyle(
              fontFamily: 'FredokaOne',
            ),
            ),
        ),
      ),
    );
  }
}
