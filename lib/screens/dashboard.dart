
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:timesofmetro/screens/circle_shape.dart';

class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard>{
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final List<String> stations = ['Hadapsar','Shivajinagar','Swargate','Hinjewadi','Nigadi','Baner'];
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _titleText(),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    _startJourney(),
                    favouriteJourneyList()
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
        color: Colors.white,
        fontSize: 30,
        fontFamily: 'Montserrat_ExtraBold'
      ),),
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
              color: Colors.white
          ),),
        ),
        _metroRout('Hadapsar', 'Swargate'),
        _metroRout('Shivajinagar', 'Wakad'),
        _metroRout('Laxmi Road', 'Shivajinagar')
      ],
    );
  }

  Widget _metroRout(String source, String dest){
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
                    Text(source,style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontFamily: 'Montserrat_Regular'
                    ),),
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
                      CustomPaint(painter: CircleShape(Colors.red,8)),
                      SizedBox(width: 10,)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(dest,style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontFamily: 'Montserrat_Regular'
                    ),)
                  ],
                )
              ],
            ),
          ),
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

  Widget _buildCarousalSlider(){
    return CarouselSlider(
        items: imgList.map((url){
                return Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                      width: 1000.0,
                    ),
                  ),
                );
              }).toList(),
      autoPlay: true,
      viewportFraction: 0.9,
      enlargeCenterPage: true,
    );

  }

}