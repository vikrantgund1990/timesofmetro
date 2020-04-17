
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:timesofmetro/screens/journey.dart';
import 'package:timesofmetro/screens/near_by.dart';
import 'package:timesofmetro/screens/setting.dart';
import 'package:timesofmetro/utils/resource_utility.dart';

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
  int _currentIndex = 0;
  final List<Widget> _children = [
    JourneyPage(key: PageStorageKey('jorney')),
    TrendingNearByPage(key: PageStorageKey('nearby')),
    SettingPage(key: PageStorageKey('setting'))
  ];
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body:PageStorage(child: _children[_currentIndex],bucket: _bucket,),
      bottomNavigationBar:_bottomNavigation(),
    );
  }

  Widget _bottomNavigation(){
    return CurvedNavigationBar(
      height: 50,
      onTap: onTabTapped,
      animationDuration: Duration(milliseconds: 300),
      buttonBackgroundColor: ColorResource.AppBackground,
      backgroundColor: ColorResource.AppBackground,
      items: <Widget>[
        /*Icon(Icons.directions_transit,size: 30,),
        Icon(Icons.local_activity,size: 30,),
        Icon(Icons.settings,size: 30,)*/
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.directions_transit,size: 30,),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.local_activity,size: 30,)
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.settings,size: 30,)
          ],
        ),
      ],
    );
  }

  /*Widget _bottomNavigation(){
    return BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      backgroundColor: Colors.white,
      selectedFontSize: 12,
      selectedLabelStyle: TextStyle(fontFamily: 'Montserrat_SemiBold'),
      unselectedFontSize: 12,
      unselectedLabelStyle: TextStyle(fontFamily: 'Montserrat_Regular'),
      items: [
        new BottomNavigationBarItem(
          icon: Icon(Icons.directions_transit),
          title: Text('Journey'),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.local_activity),
          title: Text('Near By'),
        ),
        new BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Setting')
        )
      ],
    );
  }*/

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
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