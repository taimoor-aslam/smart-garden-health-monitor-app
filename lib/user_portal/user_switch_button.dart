import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class UserSwitchButton extends StatelessWidget {
  final bool isSwitched=false;
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        // width: 125.0,
        // height: 55.0,
        // valueFontSize: 25.0,
        toggleSize: 25,
        value: isSwitched,
        borderRadius: 30,
        padding: 8,
        showOnOff: true,
        onToggle: null,
    );
  }
}
