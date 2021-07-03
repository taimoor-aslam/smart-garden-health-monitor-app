import 'package:flutter/material.dart';
import 'admin_switch_button.dart';
import '../user_portal/user_switch_button.dart';

class SensorContainer extends StatelessWidget {
  final String sensorName;
  final IconData icon;
  final String colorhex;
  final String role;
  SensorContainer(this.sensorName,this.colorhex,this.icon,this.role);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 10),
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(int.parse(colorhex)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(this.icon),
              Transform.scale(
                scale: 0.8,
                child: this.role=='user'? UserSwitchButton():AdminSwitchButton(),
              ),
            ],
          ),
          Text(this.sensorName)
        ],
      ),
    );
  }
}
