import 'package:flutter/material.dart';
import 'package:smart_garden_app/sensor_reading/color_selection.dart';
import 'package:smart_garden_app/size_config.dart';

class CustomGestureDetector extends StatelessWidget {
  final String sensorName;
  final bool isSwitched=true;
  final int n;
  final IconData sensorIcon;
  final String sensorLabel;
  final Function changeColor;
  final ColorSelection color;
  CustomGestureDetector(this.sensorName,this.sensorLabel,this.sensorIcon,this.color,this.changeColor,this.n);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context) => SensorReading(this.n)));
        this.changeColor(this.sensorName,this.sensorIcon,this.sensorLabel,this.n);
      },
      child: Container(
        // height: 32,
        // width: 30,
        height: SizeConfig.blockSizeVertical*4,
        padding: EdgeInsets.all(10),
        // color: Colors.teal,
        decoration: BoxDecoration(
            color: this.color.backGroundColor,
            borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(sensorName,style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: this.color.textColor,
        ),
        ),
      ),
    );
  }
}
