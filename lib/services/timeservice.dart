import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class Worldtime{

  String location;
  String time;
  String coutryimg;
  String url;
  bool istime;



  Worldtime({this.location,this.coutryimg,this.url});

 Future <void> getdata()  async {


    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data =jsonDecode(response.body);


    ///getting properties from data object


    String datetime= data['utc_datetime'];
    String offset = data['utc_offset'].substring(1,3);



    /// creating datetime object

    DateTime now = DateTime.parse(datetime);



    now= now.add(Duration(hours:int.parse(offset),minutes: int.parse(offset)));


    /// set the time property
     istime=now.hour > 6 && now.hour < 19 ? true : false ;
    time=DateFormat.jm().format(now);


  }



}