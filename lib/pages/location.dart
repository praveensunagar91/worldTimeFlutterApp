import 'package:flutter/material.dart';
import 'package:worldtime/services/timeservice.dart';


class location extends StatefulWidget {
  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {

  List<Worldtime> Locations=[

    Worldtime(location: "Amsterdam",coutryimg: "amst.png",url: 'Europe/Amsterdam'),
  Worldtime(location: "Australia",coutryimg: "aus.jpg",url: 'Australia/Adelaide'),
    Worldtime(location: "Berlin",coutryimg: "ber.png",url: 'Europe/Berlin'),
    Worldtime(location: "Brussels",coutryimg: "bru.png",url: 'Europe/Brussels'),
    Worldtime(location: "Dubai",coutryimg: "dubai.jpg",url: 'Asia/Dubai'),
    Worldtime(location: "England",coutryimg: "eng.png",url: 'Europe/London'),
    Worldtime(location: "India",coutryimg: "ind.jpeg",url: 'Asia/Kolkata'),
    Worldtime(location: "NewZealand",coutryimg: "new.png",url: 'Pacific/Auckland'),
    Worldtime(location: "Paris",coutryimg: "par.jpg",url: 'Europe/Paris'),
    Worldtime(location: "Qatar",coutryimg: "qatar.jpg",url: 'Asia/Qatar'),
    Worldtime(location: "Rome",coutryimg: "rom.jpg",url: 'Europe/Rome'),
    Worldtime(location: "Singapore",coutryimg: "sing.jpg",url: 'Asia/Singapore'),
    Worldtime(location: "South Africa",coutryimg: "sa.jpg",url: 'Africa/Johannesburg'),
    Worldtime(location: "Tokyo",coutryimg: "tokyo.jpg",url: 'Asia/Tokyo'),













  ];


  void updatetime(index) async{
    Worldtime instance= Locations[index];
    await  instance.getdata();

      ///navigating to home screen
      Navigator.pop(context,{
        "location":instance.location,
        'coutryimg': instance.coutryimg,
        'time':instance.time,
        'istime':instance.istime

      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select location'),

        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: Locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                updatetime(index);
              },
              title: Text(Locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/${Locations[index].coutryimg}"),
              ),
            ),
            
          );
        }
      ),
    );
  }
}
