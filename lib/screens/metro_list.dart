import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesofmetro/screens/station_list_with_time.dart';
import 'package:timesofmetro/utils/resource_utility.dart';

import 'circle_shape.dart';

class MetroList extends StatefulWidget{
  @override
  State<MetroList> createState() {
    return _MetroListState();
  }
}

class _MetroListState extends State<MetroList>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        color: ColorResource.AppBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //_appBar(),
            _journeyDetails(),
            Expanded(
              child: Container(
                child: ListView(
                  padding: EdgeInsets.only(bottom: 20),
                  children: <Widget>[
                    _metroRoutWithTime('Hadapsar', 'Shivajinagar'),
                    _metroRoutWithTime('Hadapsar', 'Shivajinagar'),
                    _metroRoutWithTime('Hadapsar', 'Shivajinagar'),
                    _metroRoutWithTime('Hadapsar', 'Shivajinagar'),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  Widget _appBar(){
    return AppBar(
      title: Text('Metro List',style: TextStyle(fontSize: 20,
          color: Colors.black,
          fontFamily: FontResource.MontserratSemiBold
      ),),
      leading: BackButton(
          color: Colors.black
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      actions: <Widget>[
        Icon(
          Icons.favorite_border,
          color: Colors.red,
        )
      ],
    ); //
  }

  Widget _journeyDetails(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding:EdgeInsets.only(left: 25,top: 20,bottom: 10),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Text('Shivajinagar',style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat_ExtraBold',
                      color: Colors.black
                  ),),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.black54,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Wakad',style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat_ExtraBold',
                      color: Colors.orange
                  ),),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text('Journey Fare',style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat_SemiBold',
                      color: Colors.black54
                  ),),
                ),
                SizedBox(width: 15),
                Image.asset('assets/images/rupee_icon.png',width: 16,height: 14,),
                Container(
                  //margin: EdgeInsets.only(left: 5),
                  child: Text('30',style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat_SemiBold',
                      color: Colors.black
                  ),),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25,top: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text('Plateform No',style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat_SemiBold',
                      color: Colors.black54
                  ),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text('2',style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat_SemiBold',
                      color: Colors.black
                  ),),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10,top: 15),
            child: Text('You need change metro at Wakad to travel Hinjewadi',style: TextStyle(
                fontFamily: FontResource.MontserratSemiBold,
                color: Colors.red,
                fontSize: 14
            ),),
          ),
          Container(
            padding:EdgeInsets.only(left: 25,top: 20,bottom: 10),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Text('Wakad',style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat_ExtraBold',
                      color: Colors.orange
                  ),),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.black54,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Hinjewadi',style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat_ExtraBold',
                      color: Colors.black
                  ),),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text('Journey Fare',style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat_SemiBold',
                      color: Colors.black54
                  ),),
                ),
                SizedBox(width: 15),
                Image.asset('assets/images/rupee_icon.png',width: 16,height: 14,),
                Container(
                  //margin: EdgeInsets.only(left: 5),
                  child: Text('30',style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat_SemiBold',
                      color: Colors.black
                  ),),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25,top: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text('Plateform No',style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat_SemiBold',
                      color: Colors.black54
                  ),),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text('2',style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat_SemiBold',
                      color: Colors.black
                  ),),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Your next metro will arrive in',style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat_Regular',
                    color: Colors.red
                ),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10,bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15,left: 30,right: 30,bottom: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 18.0, // has the effect of softening the shadow
                            spreadRadius: 4.0, // has the effect of extending the shadow
                            offset: Offset(
                              5.0, // horizontal, move right 10
                              1.0, // vertical, move down 10
                            )
                        )
                      ]
                  ),
                  child: Text('00:01:20',style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat_ExtraBold',
                      color: Colors.black
                  ),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _metroRoutWithTime(String source, String dest){
    return GestureDetector(
      onTap: _navigateToRoutDetails,
      child: Card(
        margin: EdgeInsets.only(left: 15,top: 10,right: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 20,bottom: 20,left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _metroStationPoints(),
                  _metroStationNameAndTime(),
                ],
              ),
              /*Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 38),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black26,
                      size: 15,
                    ),
                  )
                ],
              )*/
            ],
          ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _metroStationNameAndTimeColumn(3)/*<Widget>[
        _getTimeAndStationRow('10:12 AM','Hadasar'),
        SizedBox(height: 18),
        _distDurationHaltsText('10','18:12','5'),
        SizedBox(height: 18),
        _getTimeAndStationRow('10:12 AM','Hadasar'),
      ]*/,
    );
  }

  List<Widget> _metroStationNameAndTimeColumn(int noOfStations){
    List<Widget> col = [];
    for(int i = 0; i < noOfStations; i++){
      if(i == 0){
        col.add(_getTimeAndStationRow('10:12 AM','Hadasar'));
        col.add(SizedBox(height: 18));
        col.add(_distDurationHaltsText('10','18:12','5'));
      }else if( i == (noOfStations - 1)){
        col.add(SizedBox(height: 18));
        col.add(_getTimeAndStationRow('10:12 AM','AAAAAA'));
      }else{
        col.add(SizedBox(height: 18));
        col.add(_getInBetweenRow('10:12 AM','Shivajinagar'));
        col.add(SizedBox(height: 18));
        col.add(_distDurationHaltsText('10','18:12','5'));
      }
    }
    return col;
  }

  Widget _distDurationHaltsText(String dist, String duration, String halts){
    return Container(padding: EdgeInsets.only(left: 20),child: Text('$dist Km ___ $duration min ___ $halts Halts',
        style: TextStyle(fontSize: 12,fontFamily: 'Montserrat_Regular')),);
  }

  Widget _getTimeAndStationRow(String time,String station){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _time(time),
        _stationName(station)
      ],
    );
  }

  Widget _getInBetweenRow(String time,String station){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _time(time),
        _stationName(station),
        Text('(Change Metro Here)',style: TextStyle(
          fontFamily: FontResource.MontserratMedium,
          color: Colors.red,
          fontSize: 12
        ),)
      ],
    );
  }

  Widget _metroStationPoints(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _prepareStationPointWidget(3)/*<Widget>[
        _stationPoint(),
        _verticalLine(),
        _destStationPoint()
      ]*/,
    );
  }

  List<Widget> _prepareStationPointWidget(int noOfStations){
    List<Widget> col = [];
    for(int i = 0; i < noOfStations; i++){
      if(i == 0){
        col.add(_stationPoint());
      }else if( i == (noOfStations - 1)){
        col.add(_verticalLine());
        col.add(_stationPoint());
      }else{
        col.add(_verticalLine());
        col.add(_destStationPoint());
      }
    }
    return col;
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
          CustomPaint(painter: CircleShape(Colors.black,10)),
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
          CustomPaint(painter: CircleShape(Colors.orange,10)),
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

  void _navigateToRoutDetails(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StationList()),
    );
  }
}