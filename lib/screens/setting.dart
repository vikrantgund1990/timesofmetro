import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timesofmetro/utils/resource_utility.dart';

class SettingPage extends StatefulWidget{

  const SettingPage({Key key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _SettingState();
  }
}
class _SettingState extends State<SettingPage>{
  @override
  Widget build(BuildContext context) {
    return Container(color: ColorResource.AppBackground,);
  }

}