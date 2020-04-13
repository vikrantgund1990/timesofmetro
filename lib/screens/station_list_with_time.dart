import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'circle_shape.dart';

class StationList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return  Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        color: Colors.white24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _appBar(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(bottom: 20),
                children: <Widget>[
                  _stationWithTime('Hadapsar','2:30 PM'),
                  _stationWithTime('Magarpatta','2:40 PM'),
                  _stationWithTime('Vaiduwadi','2:50 PM'),
                  _stationWithTime('Crome','3:10 PM'),
                  _stationWithTime('Fatima Nagar','3:20 PM'),
                  _stationWithTime('Camp','3:30 PM'),
                  _stationWithTime('Pulgate','3:40 PM'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar(){
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          BackButton(),
          Container(
            child: Text('Stations',style: TextStyle(
              fontFamily: 'Montserrat_SemiBold',
              fontSize: 20
            ),),
          )
        ],
      ),
    );
  }

  Widget _stationWithTime(String name,String time){
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _routesAndStations(),
          _time(time),
          _stationName(name)
        ],
      ),
    );
  }

  Widget _routesAndStations(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _routLine(),
        _stationPoint(),
      ],
    );
  }

  Widget _routLine(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.lightBlue,
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
      width: 18,
      height: 100,
    );
  }

  Widget _stationPoint(){
    return Container(
      margin: EdgeInsets.only(left: 10,bottom: 10,top: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 20.0, // has the effect of softening the shadow
                spreadRadius: 10.0, // has the effect of extending the shadow
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
          CustomPaint(painter: CircleShape(Colors.white,3))
        ],
      ),
    );
  }

  Widget _time(String time){
    return Container(
      padding: EdgeInsets.only(left: 15),
      child: Text(time,style: TextStyle(
        fontFamily: 'Montserrat_SemiBold',
        fontSize: 20,
        color: Colors.black
      ),),
    );
  }

  Widget _stationName(String name){
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Text(name,
        style: TextStyle(
          fontFamily: 'Montserrat_Medium',
          fontSize: 18,
            color: Colors.black54
        ),
      ),
    );
  }
}