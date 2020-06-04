import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesofmetro/model/halts.dart';
import 'package:timesofmetro/model/metro_info.dart';
import 'package:timesofmetro/screens/metro_track.dart';
import 'package:timesofmetro/utils/hex_color.dart';
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
                itemCount: 1,
                itemBuilder: (context, index) {
                  return _stationWithTime(halts);
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
    for (int i = 0; i < info.details.length; i++) {
      if (i == 0) {
        haltList.add(Halts(
            name: info.details[i].route.start.name,
            time: info.details[i].route.startTime,
            lineColor: info.details[i].routeLine.color));
        info.details[i].routeInfo.halts.forEach((h) =>
        {
          h.isChangeRout = false,
          h.lineColor = info.details[i].routeLine.color,
          haltList.add(h)
        });
        haltList.add(Halts(
            name: info.details[i].route.end.name,
            time: info.details[i].route.endTime,
            lineColor: info.details[i].routeLine.color));
      } else {
        //haltList.add(Halts(isChangeRout: true));
        haltList.last.isChangeRout = true;
        haltList.add(Halts(
            name: info.details[i].route.start.name,
            time: info.details[i].route.startTime,
            lineColor: info.details[i].routeLine.color));
        info.details[i].routeInfo.halts.forEach((h) =>
        {
          h.isChangeRout = false,
          h.lineColor = info.details[i].routeLine.color,
          haltList.add(h)
        });
        //haltList.addAll(info.details[i].routeInfo.halts);
        haltList.add(Halts(
            name: info.details[i].route.end.name,
            time: info.details[i].route.endTime,
            lineColor: info.details[i].routeLine.color));
      }
    }
    return haltList;
  }

  Widget _appBar() {
    return AppBar(
      title: Text(
        'Halts',
        style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: FontResource.MontserratSemiBold),
      ),
      leading: BackButton(color: Colors.black),
      backgroundColor: Colors.white,
      centerTitle: true,
    );
    ;
  }

  Widget _stationWithTime(List<Halts> halts) {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _metroStationPoints(halts),
          _metroStationNameAndTime(halts)
        ],
      ),
    );
  }

  Widget _metroStationPoints(List<Halts> haltList) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _prepareStationPointWidget(haltList),
    );
  }

  List<Widget> _prepareStationPointWidget(List<Halts> haltList) {
    List<Widget> col = []; //obj, obj, obj
    for (int i = 0; i < haltList.length; i++) {
      if (i == (haltList.length - 1)) {
        col.add(_stationPoint());
      } else {
        if (haltList[i].isChangeRout) {
          col.add(_stationPoint());
          col.add(SizedBox(
            height: 60,
          ));
        } else {
          col.add(_stationPoint());
          col.add(_buildMetroTrack(haltList[i].lineColor));
        }
      }
    }
    return col;
  }

  Widget _buildMetroTrack(String color) {
    return MetroTrack(HexColor(color));
  }

  Widget _verticalLine(String color) {
    return Container(
      margin: EdgeInsets.only(
        left: 6,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: HexColor(color),
          boxShadow: [
            BoxShadow(
                color: Color(0xff),
                blurRadius: 20.0, // has the effect of softening the shadow
                spreadRadius: 1.0, // has the effect of extending the shadow
                offset: Offset(
                  1.0, // horizontal, move right 10
                  1.0, // vertical, move down 10
                ))
          ]),
      width: 5,
      height: 53,
    );
  }

  Widget _metroStationNameAndTime(List<Halts> haltList) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _metroStationNameAndTimeColumn(haltList),
    );
  }

  List<Widget> _metroStationNameAndTimeColumn(List<Halts> haltList) {
    List<Widget> col = []; //1
    for (int i = 0; i < haltList.length; i++) {
      if (haltList[i].isChangeRout) {
        col.add(_getTimeAndStationRow(haltList[i].time, haltList[i].name));
        //col.add(SizedBox(height: 60));
        col.add(Container(
          padding: EdgeInsets.only(top: 20, bottom: 18, left: 20),
          child: Text(
            'Switch Metro Here (${haltList[i].name})',
            style: TextStyle(
                fontFamily: FontResource.MontserratMedium,
                fontSize: 18,
                color: Colors.red),
          ),
        ));
      } else {
        col.add(_getTimeAndStationRow(haltList[i].time, haltList[i].name));
        col.add(SizedBox(height: 70));
      }
    }
    return col;
  }

  Widget _getTimeAndStationRow(String time, String station) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[_time(time), _stationName(station)],
    );
  }

  Widget _routesAndStations() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _stationPoint(),
        _routLine(),
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
      margin: EdgeInsets.only(left: 20, bottom: 10, top: 10),
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
          CustomPaint(painter: CircleShape(Colors.black54, 15)),
          CustomPaint(painter: CircleShape(Colors.white, 6))
        ],
      ),
    );
  }

  Widget _time(String time) {
    return Container(
      padding: EdgeInsets.only(left: 25, top: 8),
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
      padding: EdgeInsets.only(left: 10, top: 8),
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
