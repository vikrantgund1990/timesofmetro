import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MetroTrack extends StatelessWidget {
  final Color trackColor;

  MetroTrack(this.trackColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 30, left: 30),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.black,
                  width: 5,
                  height: 80,
                ),
                SizedBox(
                    width: 20,
                    height: 80,
                    child: Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      color: trackColor,
                    )),
                Container(
                  color: Colors.black,
                  width: 5,
                  height: 80,
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 42,
                height: 2,
                color: Colors.black,
                margin: EdgeInsets.only(top: 10),
              ),
              Container(
                width: 42,
                height: 2,
                color: Colors.black,
                margin: EdgeInsets.only(top: 10),
              ),
              Container(
                width: 42,
                height: 2,
                color: Colors.black,
                margin: EdgeInsets.only(top: 10),
              ),
              Container(
                width: 42,
                height: 2,
                color: Colors.black,
                margin: EdgeInsets.only(top: 10),
              ),
              Container(
                width: 42,
                height: 2,
                color: Colors.black,
                margin: EdgeInsets.only(top: 10),
              ),
              Container(
                width: 42,
                height: 2,
                color: Colors.black,
                margin: EdgeInsets.only(top: 10),
              ),
            ],
          )
        ],
      ),
    );
  }
}
