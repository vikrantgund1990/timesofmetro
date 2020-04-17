import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:timesofmetro/utils/resource_utility.dart';

import 'circle_shape.dart';

class JourneyPage extends StatefulWidget{

  const JourneyPage({Key key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _JourneyState();
  }
}
class _JourneyState extends State<JourneyPage>{

  final List<String> stations = ['Hadapsar','Shivajinagar','Swargate','Hinjewadi','Nigadi','Baner'];

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: Text('Journey',style: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontFamily: 'Montserrat_ExtraBold'
        )
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: ColorResource.AppBackground,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             // _titleText(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(bottom: 10),
                  children: <Widget>[
                    _startJourney(),
                    favouriteJourneyList(),
                    _importantUpdate()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleText(){
    return Container(
      padding: EdgeInsets.only(left: 10,bottom: 15,top: 15),
      child: Text('Journey',style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontFamily: 'Montserrat_ExtraBold'
      ),),
    );
  }

  Widget _startJourney(){
    return Card(
      margin: EdgeInsets.only(top: 10,left: 10,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _userInput(),
          _goButton()
        ],
      ),
    );
  }

  Widget _userInput(){
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildAutoCompleteText('Source'),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.black12,
          ),
          _buildAutoCompleteText('Destination')
        ],
      ),
    );
  }

  Widget _buildAutoCompleteText(String hint){
    return SimpleAutoCompleteTextField(
      suggestions: stations,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(fontSize: 16,
              fontFamily: 'Montserrat_Regular'
          ),
          contentPadding: EdgeInsets.only(left: 15,top: 18,bottom: 18)
      ),
      style: TextStyle(fontSize: 16,
          fontFamily: 'Montserrat_Regular',
          color: Colors.black),
    );
  }

  Widget _goButton(){
    return RawMaterialButton(
      onPressed: () {},
      child: new Icon(
        Icons.train,
        color: Colors.blue,
        size: 30.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(10.0),
    );
  }

  Widget favouriteJourneyList(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 25,left: 10),
          child: Text('Favourite Journey',style: TextStyle(
              fontFamily: 'Montserrat_SemiBold',
              fontSize: 20,
              color: Colors.black
          ),),
        ),
        _metroRout('Hadapsar', 'Swargate'),
        _metroRout('Shivajinagar', 'Wakad'),
      ],
    );
  }

  Widget _importantUpdate(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 25,left: 10),
          child: Text('Importants Updates',style: TextStyle(
              fontFamily: 'Montserrat_SemiBold',
              fontSize: 20,
              color: Colors.black
          ),),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Text('I want wrap text as text grows. I searched through and tried wrap with almost everything but still text stays one line and overflows from the screen. Does anyone know how to achieve this? Any help is highly appreciated!',
            style: TextStyle(color: Colors.black87,fontFamily: 'Montserrat_Regular'),),
        )
      ],
    );
  }

  Widget _metroRout(String source, String dest){
    return Card(
      margin: EdgeInsets.only(left: 15,top: 10,right: 15),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(source,style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'Montserrat_SemiBold'
                ),),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(width: 10,),
                  CustomPaint(painter: CircleShape(Colors.green,10)),
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
                  CustomPaint(painter: CircleShape(Colors.red,10)),
                  SizedBox(width: 10,)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(dest,style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
                    fontFamily: 'Montserrat_SemiBold'
                ),)
              ],
            )
          ],
        ),
      ),
    );

  }

}