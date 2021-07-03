import 'package:flutter/material.dart';
import 'package:smart_garden_app/user_portal/user_drawer.dart';
import '../size_config.dart';
import '../user_portal/user_switch_button.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../admin_portal/admin_drawer.dart';
import 'gesture_detector.dart';
import '../admin_portal/admin_switch_button.dart';
import 'color_selection.dart';


class SensorReading extends StatefulWidget {
  String sensorName;
  String sensorLabel;
  IconData icon;
  int n;
  String role;
  SensorReading(this.sensorName,this.icon,this.sensorLabel,this.n,this.role);
  @override
  _SensorReadingState createState() => _SensorReadingState();
}

class _SensorReadingState extends State<SensorReading> {
  int selection;
  ColorSelection c1=ColorSelection(Colors.white, Color(0xff6cbbc7), Colors.black);
  ColorSelection c2=ColorSelection(Color(0xff6cbbc7), Colors.white, Colors.white);
  void changeColor(String sensorName,IconData sensorIcon,String sensorLabel,int s){
    setState(() {
      this.selection=s;
      widget.n=s;
      widget.sensorName=sensorName;
      widget.sensorLabel=sensorLabel;
      widget.icon=sensorIcon;

    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    this.selection=widget.n;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text('Smart Garden'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      drawer: widget.role=='user'? UserCustomeDrawer():AdminCustomeDrawer(),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // height: 10,
                height: SizeConfig.blockSizeVertical*2,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomGestureDetector('Temperature Sensor','Temperature Level',Icons.wb_sunny,this.selection==1?c1:c2,this.changeColor,1),
                    SizedBox(
                      // width: 5,
                      width: SizeConfig.blockSizeHorizontal*2,
                    ),
                    CustomGestureDetector('Light Sensor','Light Intesnity',Icons.wb_sunny_outlined,this.selection==2?c1:c2,this.changeColor,2),
                    SizedBox(
                      // width: 5,
                      width: SizeConfig.blockSizeHorizontal*2,
                    ),
                    CustomGestureDetector('Humidity Sensor','Humidity Level',Icons.grain,this.selection==3?c1:c2,this.changeColor,3),
                    SizedBox(
                      // width: 5,
                      width: SizeConfig.blockSizeHorizontal*2,
                    ),
                    CustomGestureDetector('Moisture Sensor','Moisture Level',Icons.waves_sharp,this.selection==4?c1:c2,this.changeColor,4),
                    SizedBox(
                      // width: 5,
                      width: SizeConfig.blockSizeHorizontal*2,
                    ),
                    // CustomGestureDetector('Water Motor',this.selection==5?c1:c2,this.changeColor,5),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(16),
                // height: 63,
                height: SizeConfig.blockSizeVertical*12,
                // width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(widget.icon),
                        SizedBox(
                          // width: 10,
                          width: SizeConfig.blockSizeHorizontal*2,
                        ),
                        Text(widget.sensorName),
                      ],
                    ),
                   widget.role=='user'? UserSwitchButton():AdminSwitchButton(),
                  ],
                ),
              ),
              SizedBox(
                // height: 20,
                height: SizeConfig.blockSizeVertical*5,
              ),
              Container(
                padding: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // height: 300,
                      // width: 300,
                      height: SizeConfig.blockSizeVertical*37,
                      width: SizeConfig.blockSizeHorizontal*90,
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                            minimum: 0,
                            maximum: 150,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                  startValue: 0,
                                  endValue: 150,
                                  color: Colors.teal,
                                  startWidth: 15.0,
                                  endWidth: 15.0),
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(
                                value: 90,
                                needleColor: Colors.teal,
                              )
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                  widget: Container(
                                    child: Text(
                                      '90.0',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ),
                                  angle: 90,
                                  positionFactor: 0.5),
                            ]),
                      ]),
                    ),
                Text(
                  widget.sensorLabel,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
