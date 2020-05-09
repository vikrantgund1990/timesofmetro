import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesofmetro/model/halts.dart';
import 'package:timesofmetro/model/metro_info.dart';
import 'package:timesofmetro/utils/resource_utility.dart';

import 'circle_shape.dart';

class StationList extends StatelessWidget {
  final MetroInfo info;

  StationList({this.info});

  @override
  Widget build(BuildContext context) {
    List<Halts> halts = _getHaltList();
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        //padding: EdgeInsets.only(top: statusBarHeight),
        color: ColorResource.AppBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 20),
                itemCount: halts.length,
                itemBuilder: (context, index) {
                  return _stationWithTime(halts[index].name, halts[index].time);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Halts> _getHaltList() {
    List<Halts> haltList = [];
    info.details.forEach((f) =>
    {
      haltList.add(Halts(name: f.route.start.name, time: f.route.startTime)),
      haltList.addAll(f.routeInfo.halts),
      haltList.add(Halts(name: f.route.end.name, time: f.route.endTime))
    });
    return haltList;
  }

  Widget _appBar() {
    return AppBar(
      title: Text(
        'Stations',
        style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: FontResource.MontserratSemiBold),
      ),
      leading: BackButton(color: Colors.black),
      backgroundColor: Colors.white,
      centerTitle: true,
    );
    ;
  }

  Widget _stationWithTime(String name, String time) {
    return Container(
      margin: EdgeInsets.only(left: 30),
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

  Widget _routesAndStations() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _routLine(),
        _stationPoint(),
      ],
    );
  }

  Widget _routLine() {
    return Container(
      margin: EdgeInsets.only(left: 2.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 20.0, // has the effect of softening the shadow
                spreadRadius: 1.0, // has the effect of extending the shadow
                offset: Offset(
                  1.0, // horizontal, move right 10
                  1.0, // vertical, move down 10
                ))
          ]),
      width: 10,
      height: 90,
    );
  }

  Widget _stationPoint() {
    return Container(
      margin: EdgeInsets.only(left: 8, bottom: 12, top: 12),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black38,
            blurRadius: 20.0, // has the effect of softening the shadow
            spreadRadius: 10.0, // has the effect of extending the shadow
            offset: Offset(
              5.0, // horizontal, move right 10
              1.0, // vertical, move down 10
            ))
      ]),
      child: Stack(
        children: <Widget>[
          CustomPaint(painter: CircleShape(Colors.green, 12)),
          CustomPaint(painter: CircleShape(Colors.white, 6))
        ],
      ),
    );
  }

  Widget _time(String time) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      child: Text(
        time,
        style: TextStyle(
            fontFamily: 'Montserrat_SemiBold',
            fontSize: 15,
            color: Colors.black),
      ),
    );
  }

  Widget _stationName(String name) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        name,
        style: TextStyle(
            fontFamily: 'Montserrat_Medium',
            fontSize: 15,
            color: Colors.black54),
      ),
    );
  }
}
