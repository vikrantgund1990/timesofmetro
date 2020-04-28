import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesofmetro/utils/resource_utility.dart';

class AppLoader extends StatelessWidget {

  String message;

  AppLoader({this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange)),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(message, style: TextStyle(fontSize: 14,
                fontFamily: FontResource.MontserratRegular,
                color: Colors.black),),
          )
        ],
      ),
    );
  }
}
