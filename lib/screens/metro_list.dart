import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Container(
        child: Column(
          children: <Widget>[
            _appBar(),
            Expanded(
              child: _metroListWithTime(),
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar(){
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.only(top: statusBarHeight+10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            child: new Icon(
              Icons.chevron_left,
              color: Colors.blue,
              size: 30.0,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(10.0),
          ),
          Text('Source',style: TextStyle(
            color: Colors.black,
            fontSize: 25
          ),),
          Text(' to '),
          Text('Destination',style: TextStyle(
              color: Colors.black,
              fontSize: 25
          ),),
        ],
      ),
    );
  }

  Widget _metroListWithTime(){
    return ListView(
      children: <Widget>[
        _listRow(),
        _listRow(),
        _listRow(),
        _listRow(),
        _listRow(),
        _listRow(),
        _listRow(),
        _listRow(),
        _listRow(),
        _listRow(),
        _listRow(),
      ],
    );
  }

  Widget _listRow(){
    return Container(
      margin: EdgeInsets.only(top: 10,left: 10,right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10,top: 25,bottom: 25),
            child: Wrap(
              children: <Widget>[
                Text('Metro 1231')
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Text('12:30 PM'),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.keyboard_arrow_right),
              )
            ],
          )
        ],
      ),
    );
  }
}