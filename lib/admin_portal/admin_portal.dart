
import 'package:flutter/material.dart';
import 'package:smart_garden_app/sensor_reading/sensor_reading.dart';
import 'package:smart_garden_app/user_portal/user_drawer.dart';
import 'admin_drawer.dart';


class AdminPortal extends StatelessWidget {
  List<String> sensorName=["Water Motor","Temperature Sensor", "Moisture Sensor", "Humidity Sensor", "Light Sensor"];
  List<IconData> sensorIcon=[Icons.ac_unit,Icons.wb_sunny, Icons.grain, Icons.waves_sharp, Icons.wb_sunny_outlined];
  List<String> colors=['0xFF009688','0xff6cb87a', '0xffb25e5c', '0xff5f9fce', '0xff7b5cd2'];
  List<String> sensorLabel=["Water Level", "Temperature Level", " Moisture Level", "Humidity Level", "Light Intensity"];
  final String role;
  AdminPortal(this.role);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: this.role=='user'?UserCustomeDrawer():AdminCustomeDrawer(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              // iconTheme: IconThemeData(color: Colors.teal),
              expandedHeight: 200.0,
              backgroundColor: Colors.teal,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Smart Garden"),
                background: Image.asset("images/1.PNG",
                fit: BoxFit.cover,
                ),
              ),
            ),

            new SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index)=>GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(int.parse(colors[index])),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(sensorName[index],
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                  onTap:() {
                    print(sensorName[index]);
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SensorReading(sensorName[index], sensorIcon[index], sensorLabel[index],index , role)));
                  },
                ),
                childCount: sensorName.length,
              ),
            ),
          ],
        ),
    );
  }
}
