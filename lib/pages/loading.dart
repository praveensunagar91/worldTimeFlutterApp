import 'package:flutter/material.dart';
import 'package:worldtime/pages/location.dart';
import 'package:worldtime/services/timeservice.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {

  void worldtime()  async{

  Worldtime instance = Worldtime(location: "India",coutryimg: "ind.jpg",url: 'Asia/Kolkata');

  await instance.getdata();
  print(instance.time);

  Navigator.pushReplacementNamed(context, '/home', arguments: {
     "location":instance.location,
      'coutryimg': instance.coutryimg,
    'time':instance.time,
    "istime":instance.istime,



  });






}
  @override
  void initState() {
    worldtime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[300],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 50.0,
        ),


      ),
    );
  }
}
