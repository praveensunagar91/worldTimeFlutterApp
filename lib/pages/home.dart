import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {



  Map data={};



  @override
  Widget build(BuildContext context) {

  data= data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
  print(data);
  String bgimg = data['istime'] ? 'maxy65.jpg' : 'max.jpg';
  Color bgclr = data['istime'] ?  Colors.black : Colors.white;

  print(data);
    return Scaffold(
      backgroundColor: bgclr,

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/$bgimg"),
            fit: BoxFit.cover,
          ),
        ),

        child: SafeArea(
           child: ListView(

             children: <Widget>[




               SizedBox(height: 200.0,),
                Padding(
                  padding: EdgeInsets.only(right: 40.0),
                  child: FlatButton.icon(

                    onPressed: () async  {
                    dynamic result= await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data={
                        'location': result['location'],
                        'coutryimg':result['coutryimg'],
                        'time': result['time'],
                        'istime':result['istime']
                      };
                    });
                    },
                    icon: Icon(Icons.edit_location,size: 40.0,color: Colors.green,),
                    label: Text('Location',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: bgclr,

                    ),),
                  ),
                ),
                     SizedBox(height: 5.0,),

                Column(
                  children: <Widget>[
                    Center(
                      child: Text(data['location'],
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: bgclr,
                      ),),
                    ),
                  SizedBox(height: 5.0,),
                    Center(
                      child: Text(data['time'],
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: bgclr,
                        ),),

                    ),
                  ],
                )


             ],

           ),
        ),
      )
    );
  }
}
