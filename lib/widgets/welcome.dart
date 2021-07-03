import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final String text;
  Welcome(this.text);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xffefefef),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'FredokaOne',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("Hi,",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Text("Good Day!",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily:'FredokaOne',
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
