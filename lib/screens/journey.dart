import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:timesofmetro/bloc/bloc_provider.dart';
import 'package:timesofmetro/bloc/stations_list_bloc.dart';
import 'package:timesofmetro/model/station.dart';
import 'package:timesofmetro/screens/app_loader.dart';
import 'package:timesofmetro/screens/metro_list.dart';
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

  List<Station> stations;
  GlobalKey sourceKey = GlobalKey<AutoCompleteTextFieldState<Station>>();
  GlobalKey destKey = GlobalKey<AutoCompleteTextFieldState<Station>>();
  Station selectedSource, selectedDest;
  TextEditingController sourceController = TextEditingController();
  TextEditingController destController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    StationListBloc bloc = StationListBloc();
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
      body: BlocProvider(
        bloc: bloc,
        child: Container(
          padding: EdgeInsets.only(top: statusBarHeight),
          child: Container(
            decoration: BoxDecoration(
              color: ColorResource.AppBackground,
            ),
            child: _buildStationListStreamBuilder(bloc),
          ),
        ),
      ),
    );
  }

  Widget _buildStationListStreamBuilder(StationListBloc bloc) {
    bloc.fetchStationList();
    return StreamBuilder(
      stream: bloc.stationStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          stations = snapshot.data;
          return initView();
        } else if (snapshot.hasError) {
          return Container();
        }
        return AppLoader(message: 'Loading journey data please wait',);

      },
    );
  }

  Widget initView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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

  Widget _startJourney() {
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

  Widget _userInput() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildSourceAutoCompleteText('Source'),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.black12,
          ),
          _buildDestAutoCompleteText('Destination')
        ],
      ),
    );
  }

  Widget _buildSourceAutoCompleteText(String hint) {
    return AutoCompleteTextField<Station>(
      key: sourceKey,
      suggestions: stations,
      itemFilter: (suggestion, input) => _filterAutoComplete(suggestion, input),
      submitOnSuggestionTap: true,
      controller: sourceController,
      itemSubmitted: (station) {
        sourceController.text = station.name;
        selectedSource = station;
      },
      clearOnSubmit: false,
      itemBuilder: (context, suggestion) =>
      new Padding(
          child: new ListTile(
            title: new Text(suggestion.name, style: TextStyle(
                fontFamily: FontResource.MontserratRegular,
                fontSize: 14,
                color: Colors.black87
            ),),),
          padding: EdgeInsets.all(4.0)),
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

  Widget _buildDestAutoCompleteText(String hint) {
    return AutoCompleteTextField<Station>(
      key: destKey,
      suggestions: stations,
      itemFilter: (suggestion, input) => _filterAutoComplete(suggestion, input),
      submitOnSuggestionTap: true,
      controller: destController,
      itemSubmitted: (station) {
        destController.text = station.name;
        selectedDest = station;
      },
      clearOnSubmit: false,
      itemBuilder: (context, suggestion) =>
      new Padding(
          child: new ListTile(
            title: new Text(suggestion.name, style: TextStyle(
                fontFamily: FontResource.MontserratRegular,
                fontSize: 14,
                color: Colors.black87
            ),),),
          padding: EdgeInsets.all(4.0)),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(fontSize: 16,
              fontFamily: 'Montserrat_Regular'
          ),
          contentPadding: EdgeInsets.only(left: 15, top: 18, bottom: 18)
      ),
      style: TextStyle(fontSize: 16,
          fontFamily: 'Montserrat_Regular',
          color: Colors.black),
    );
  }

  void _navigateToMetroList(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MetroList()),
    );
  }

  bool _filterAutoComplete(Station suggestion, String input) {
    return suggestion.name.toLowerCase().startsWith(input.toLowerCase());
  }

  Widget _goButton(){
    return RawMaterialButton(
      onPressed: _navigateToMetroList,
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
          child: Text('Favourite Routs',style: TextStyle(
              fontFamily: 'Montserrat_SemiBold',
              fontSize: 18,
              color: Colors.black
          ),),
        ),
        _metroRoutWithTime('Hadapsar', 'Swargate'),
        _metroRoutWithTime('Shivajinagar', 'Wakad'),
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
              fontSize: 18,
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

  Widget _metroRoutWithTime(String source, String dest){
    return GestureDetector(
      onTap: _navigateToMetroList,
      child: Card(
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
      ),
    );
  }

  Widget _stationName(String name){
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Text(name,
        style: TextStyle(
            fontFamily: 'Montserrat_Medium',
            fontSize: 16,
            color: Colors.black87
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
            _stationName('Hadapsar')
          ],
        ),
        SizedBox(height: 38),
        //Container(padding: EdgeInsets.only(left: 20),child: Text('10 Km -- 18:10 min -- 6 Halts',style: TextStyle(fontSize: 12,fontFamily: 'Montserrat_Regular')),),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _stationName('Swargate')
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
      height: 40,
    );
  }

}