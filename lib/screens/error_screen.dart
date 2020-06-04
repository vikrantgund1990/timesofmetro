import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesofmetro/utils/resource_utility.dart';

class ErrorScreen extends StatelessWidget {
  final ErrorType errorType;
  final String message;

  ErrorScreen({this.errorType, this.message = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorResource.AppBackground,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                _getIcon(errorType),
                size: 60,
                color: Colors.black54,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                message,
                style: TextStyle(
                    fontFamily: FontResource.MontserratMedium,
                    fontSize: 15,
                    color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }

  IconData _getIcon(ErrorType type) {
    switch (type) {
      case ErrorType.empty:
        {
          return Icons.mood_bad;
        }
      case ErrorType.network:
        {
          return Icons.wifi;
        }
      case ErrorType.server:
        {
          return Icons.mood_bad;
        }
    }

    return Icons.report;
  }
}

enum ErrorType { network, empty, server }
