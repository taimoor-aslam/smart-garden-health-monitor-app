import 'package:flutter/material.dart';
import '../add_user/add_user.dart';
import '../remove_user/remove_user.dart';
import '../change_password/confirm_password.dart';

class AdminCustomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Taimoor Aslam'),
              accountEmail: Text('taslam525@gmail.com'),
              currentAccountPicture: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/logo.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 1,
                thickness: 2,
                color: Colors.teal,
              ),
            ),
            ListTile(
              title: Text('Add User'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddUser()));
                // Navigator.pop(context);
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 1,
                thickness: 2,
                color: Colors.teal,
              ),
            ),
            ListTile(
              title: Text('Remove User'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RemoveUser()));
                // Navigator.pop(context);
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 1,
                thickness: 2,
                color: Colors.teal,
              ),
            ),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmPassword()));
                // Navigator.pop(context);
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 1,
                thickness: 2,
                color: Colors.teal,
              ),
            ),
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.logout),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
  }
}
