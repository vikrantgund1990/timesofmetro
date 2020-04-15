import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'circle_shape.dart';

class TrendingNearByPage extends StatefulWidget{

  const TrendingNearByPage({Key key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _TrendingNearByState();
  }
}

class _TrendingNearByState extends State<TrendingNearByPage>{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              _newMetroRoutWithTime('Hadapsar', 'Shivajinagar'),
              _newMetroRoutWithTime('Hadapsar', 'Shivajinagar'),
              _newMetroRoutWithTime('Hadapsar', 'Shivajinagar'),
              _newMetroRoutWithTime('Hadapsar', 'Shivajinagar'),
            ],
          ),
        )
      ],
    );
  }

  Widget _newMetroRoutWithTime(String source, String dest){
    return Card(
      margin: EdgeInsets.only(left: 15,top: 10,right: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 20,bottom: 20,left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _metroStationPoints(),
            _metroStationNameAndTime()
          ],
        ),
      ),
    );
  }

  Widget _time(String time){
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Text(time,style: TextStyle(
          fontFamily: 'Montserrat_SemiBold',
          fontSize: 16,
          color: Colors.black
      ),),
    );
  }

  Widget _stationName(String name){
    return Container(
      padding: EdgeInsets.only(left: 5),
      child: Text(name,
        style: TextStyle(
            fontFamily: 'Montserrat_Medium',
            fontSize: 12,
            color: Colors.black54
        ),
      ),
    );
  }

  Widget _metroStationNameAndTime(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _time('10:12 AM'),
            _stationName('Hadasar')
          ],
        ),
        SizedBox(height: 18),
        Container(child: Text('10 Km -- 18:10 min',style: TextStyle(fontSize: 12,fontFamily: 'Montserrat_Regular')),),
        SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _time('10:12 AM'),
            _stationName('Hadasar')
          ],
        )
      ],
    );
  }

  Widget _metroStationPoints(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _stationPoint(),
        _verticalLine(),
        _destStationPoint()
      ],
    );
  }

  Widget _stationPoint(){
    return Container(
      margin: EdgeInsets.only(left: 20,top: 10),
      decoration: BoxDecoration(
                  boxShadow: [
                        BoxShadow(
                        color: Colors.lightGreen,
                            blurRadius: 20.0, // has the effect of softening the shadow
              spreadRadius: 6.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                1.0, // vertical, move down 10
              )
          )
        ]
     ),
      child: Stack(
        children: <Widget>[
          CustomPaint(painter: CircleShape(Colors.green,10)),
          CustomPaint(painter: CircleShape(Colors.white,4))
        ],
      ),
    );
  }

  Widget _destStationPoint(){
    return Container(
      margin: EdgeInsets.only(left: 20,top: 9),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.orangeAccent,
                blurRadius: 20.0, // has the effect of softening the shadow
                spreadRadius: 6.0, // has the effect of extending the shadow
                offset: Offset(
                  5.0, // horizontal, move right 10
                  1.0, // vertical, move down 10
                )
            )
          ]
      ),
      child: Stack(
        children: <Widget>[
          CustomPaint(painter: CircleShape(Colors.orangeAccent,10)),
          CustomPaint(painter: CircleShape(Colors.white,4))
        ],
      ),
    );
  }

  Widget _verticalLine(){
    return Container(
      margin: EdgeInsets.only(left: 18,top: 9),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: Colors.black26,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 20.0, // has the effect of softening the shadow
                spreadRadius: 1.0, // has the effect of extending the shadow
                offset: Offset(
                  1.0, // horizontal, move right 10
                  1.0, // vertical, move down 10
                )
            )
          ]
      ),
      width: 5,
      height: 53,
    );
  }

  Widget _metroRoutWithTime(String source, String dest){
    return Card(
      margin: EdgeInsets.only(left: 15,top: 10,right: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black54
        ),
        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('6:10 PM',style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Montserrat_SemiBold'
                    ),),
                    Text(source,style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontFamily: 'Montserrat_Regular'
                    ),)
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(width: 10,),
                  CustomPaint(painter: CircleShape(Colors.green,8)),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 8,right: 6),
                      child: Divider(
                        height: 2,
                        thickness: 2,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  CustomPaint(painter: CircleShape(Colors.lightBlue,8)),
                  SizedBox(width: 10,)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('7:10 PM',style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Montserrat_SemiBold'
                    ),),
                    Text(dest,style: TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                        fontFamily: 'Montserrat_Regular'
                    ),)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );

  }

}