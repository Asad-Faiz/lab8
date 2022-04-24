import 'package:flutter/material.dart';
import 'screen2.dart';
import 'package:geolocator/geolocator.dart';

class screen1 extends StatefulWidget {
  const screen1({Key? key}) : super(key: key);

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  var Permission;
  double lon = 0.0;
  double lat = 0.0;
  @override
  void initState() {
    
    super.initState();
    getCurrentPosition();
    print("init state");
  }

// method
  void getCurrentPosition() async {
    try {
      Permission = Geolocator.checkPermission();
      if (Permission == LocationPermission.denied) {
        Permission = Geolocator.requestPermission();
        if (Permission == LocationPermission.denied) {
          print("location can not Accessed");
        }
      }

      Position pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        lat = pos.latitude;
        lon = pos.longitude;
      });
      print(pos.latitude);
      print(pos.longitude);
    } catch (e) {
      setState(() {
        getCurrentPosition();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen1"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          // Text("latitude is $lat"),
          // Text("longitute is $lon"),
          ElevatedButton(
            onPressed: () {
              setState(() {
                getCurrentPosition();
              });
            },
            child: Text("get CurrentPosition",style: TextStyle(fontSize: 32),),
          ),
          Text("latitude is $lat",style: TextStyle(fontSize: 32),),
          Text("longitute is $lon",style: TextStyle(fontSize: 32),),

          ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>screen2()));
                Navigator.pushNamed(context, '/s2');
              },
              child: Text("go to screen 2",style: TextStyle(fontSize: 32),))
        ]),
      ),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("DE");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }
}
