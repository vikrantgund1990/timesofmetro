import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesofmetro/utils/resource_utility.dart';

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
    return Container(
      color: ColorResource.AppBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _appBar(),
          _userInput(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: ListView(
                padding: EdgeInsets.only(bottom: 20),
                children: <Widget>[
                  _newMetroRoutWithTime('Hadapsar', 'Shivajinagar'),
                  _newMetroRoutWithTime('Hadapsar', 'Shivajinagar'),
                  _newMetroRoutWithTime('Hadapsar', 'Shivajinagar'),
                  _newMetroRoutWithTime('Hadapsar', 'Shivajinagar'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _appBar(){
    return Container(
      padding: EdgeInsets.only(top: 25),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          BackButton(),
          Container(
            child: Text('Metro',style: TextStyle(
                fontFamily: 'Montserrat_SemiBold',
                fontSize: 20
            ),),
          )
        ],
      ),
    ); //
  }

  Widget _userInput(){
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
                  child: Text('Hinjewadi',style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat_ExtraBold',
                      color: Colors.orange
                  ),),
                )
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

  Widget _newMetroRoutWithTime(String source, String dest){
    return Card(
      margin: EdgeInsets.only(left: 15,top: 10,right: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 20,bottom: 20,left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _metroStationPoints(),
                _metroStationNameAndTime(),
              ],
            ),
            Column(
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
            )
          ],
        ),
      ),
    );
  }

  /*Widget _faresAndOtherSummary(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Plateform: 01',style: TextStyle(
                fontSize: 14,
                fontFamily: 'Montserrat_Regular',
                color: Colors.blueAccent

            ),)
          ],
        )
      ],
    );
  }*/

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
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _time('10:12 AM'),
            _stationName('Hadapsar')
          ],
        ),
        SizedBox(height: 18),
        Container(padding: EdgeInsets.only(left: 20),child: Text('10 Km -- 18:10 min -- 6 Halts',style: TextStyle(fontSize: 12,fontFamily: 'Montserrat_Regular')),),
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