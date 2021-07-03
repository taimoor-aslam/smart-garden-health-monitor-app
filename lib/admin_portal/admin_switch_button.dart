import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';

class AdminSwitchButton extends StatefulWidget {
  AdminSwitchButton();
  @override
  _AdminSwitchButton createState() => _AdminSwitchButton();
}

class _AdminSwitchButton extends State<AdminSwitchButton> {
  bool isSwitched=false;
  @override
  Widget build(BuildContext context) {
    return CustomSwitch(
      value: isSwitched,
      activeColor: Colors.teal.shade100,
      // onChanged: (value){
      //   print("Value: $value");
      //   setState(() {
      //     isSwitched=value;
      //   });
      // },
    );
  }
}
