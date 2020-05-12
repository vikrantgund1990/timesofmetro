import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesofmetro/bloc/metro/metro_list_bloc.dart';
import 'package:timesofmetro/bloc/metro/metro_list_event.dart';
import 'package:timesofmetro/bloc/metro/metro_list_states.dart';
import 'package:timesofmetro/bloc/metro/timer_bloc.dart';
import 'package:timesofmetro/bloc/metro/timer_event.dart';
import 'package:timesofmetro/bloc/metro/timer_state.dart';
import 'package:timesofmetro/model/metro_info.dart';
import 'package:timesofmetro/model/route_details.dart';
import 'package:timesofmetro/screens/app_loader.dart';
import 'package:timesofmetro/screens/station_list_with_time.dart';
import 'package:timesofmetro/utils/resource_utility.dart';

import 'circle_shape.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class MetroList extends StatefulWidget {
  final List<MetroInfo> metroInfo;

  MetroList({this.metroInfo});

  @override
  State<MetroList> createState() {
    return _MetroListState();
  }
}

class _MetroListState extends State<MetroList> {
  MetroListBloc metroListBloc;
  MetroTimerBloc timerBloc;

  @override
  void initState() {
    super.initState();
    metroListBloc = MetroListBloc();
    metroListBloc.add(RefreshMetroList(widget.metroInfo));
    timerBloc = MetroTimerBloc();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MetroListBloc>(
          create: (context) => metroListBloc,
        ),
        BlocProvider<MetroTimerBloc>(
          create: (context) => timerBloc,
        )
      ],
      child: Scaffold(appBar: _appBar(), body: _buildMetroListStream()),
    );
  }

  Widget _buildView(List<MetroInfo> metroInfo) {
    return Container(
        color: ColorResource.AppBackground,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
                return _journeyDetails(metroInfo[0]);
              }, childCount: 1),
            ),
            //_buildJourneyInfoStream(),
            _timer(metroInfo[0].details[0].route.startTimeMsec),
            SliverList(
              delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
                return _metroRoutWithTime(metroInfo[index]);
              }, childCount: metroInfo.length),
            ),
          ],
        ));
  }

  Widget _buildMetroListStream() {
    return BlocBuilder(
        bloc: metroListBloc,
        builder: (context, state) {
          if (state is RefreshMetroListLoadedState) {
            return _buildView(state.filteredList);
          } else if (state is RefreshMetroListLoadingState) {
            return AppLoader(message: "Loading");
          }
          return Container();
        });
  }

  Widget _appBar() {
    return AppBar(
      title: Text(
        'Metro List',
        style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: FontResource.MontserratSemiBold),
      ),
      leading: BackButton(color: Colors.black),
      backgroundColor: Colors.white,
      centerTitle: true,
      actions: <Widget>[
        Icon(
          Icons.favorite_border,
          color: Colors.red,
        )
      ],
    ); //
  }

  Widget _journeyDetails(MetroInfo info) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _sourceToDestinationChildren(info.details),
      ),
    );
  }

  List<Widget> _sourceToDestinationChildren(List<RouteDetails> details) {
    List<Widget> col = [];
    for (int i = 0; i < details.length; i++) {
      if (i == 0) {
        col.add(_sourceDestinationRow(
            details[i].route.start.name, details[i].route.end.name));
        col.add(_fareRow(details[i].fareInfo.adult.toString()));
        col.add(_platformInfoRow(details[i].route.start.platform.toString()));
      } else {
        col.add(Container(
          margin: EdgeInsets.only(left: 25, top: 15),
          child: Text(
            'Take next metro from ${details[i].route.start
                .name} to travel ${details[i].route.end.name}',
            style: TextStyle(
                fontFamily: FontResource.MontserratSemiBold,
                color: Colors.lightBlueAccent,
                fontSize: 14),
          ),
        ));
        col.add(_sourceDestinationRow(
            details[i].route.start.name, details[i].route.end.name));
        col.add(_fareRow(details[i].fareInfo.adult.toString()));
        col.add(_platformInfoRow(details[i].route.start.platform.toString()));
      }
    }
    return col;
  }

  Widget _sourceDestinationRow(String source, String destination) {
    return Container(
      padding: EdgeInsets.only(left: 25, top: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 15),
            child: Text(
              source,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat_ExtraBold',
                  color: Colors.black),
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.black54,
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              destination,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat_ExtraBold',
                  color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fareRow(String fare) {
    return Container(
      padding: EdgeInsets.only(left: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              'Journey Fare',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat_SemiBold',
                  color: Colors.black54),
            ),
          ),
          SizedBox(width: 15),
          Image.asset(
            'assets/images/rupee_icon.png',
            width: 16,
            height: 14,
          ),
          Container(
            //margin: EdgeInsets.only(left: 5),
            child: Text(
              fare,
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Montserrat_SemiBold',
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  Widget _platformInfoRow(String plNo) {
    return Container(
      padding: EdgeInsets.only(left: 25, top: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              'Plateform No',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat_SemiBold',
                  color: Colors.black54),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              plNo,
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Montserrat_SemiBold',
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  Widget _timer(int startTime) {
    timerBloc.add(StartMetroTimer(
        DateTime
            .fromMillisecondsSinceEpoch(startTime)
            .millisecondsSinceEpoch));
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 120,
          maxHeight: 150,
          child: Container(
            color: ColorResource.AppBackground,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Your next metro will arrive in',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat_Regular',
                            color: Colors.red),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            top: 15, left: 30, right: 30, bottom: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 18.0,
                                  // has the effect of softening the shadow
                                  spreadRadius: 4.0,
                                  // has the effect of extending the shadow
                                  offset: Offset(
                                    5.0, // horizontal, move right 10
                                    1.0, // vertical, move down 10
                                  ))
                            ]),
                        child: BlocListener<MetroTimerBloc, TimerState>(
                          key: Key("Timer"),
                          listener: (context, state) {
                            if (state is MetroTimerFinishState) {
                              metroListBloc.add(
                                  RefreshMetroList(widget.metroInfo));
                            }
                          },
                          child: BlocBuilder<MetroTimerBloc, TimerState>(
                            builder: (context, state) {
                              String time = '00:00:00';
                              if (state is MetroTimerBeginState) {
                                time = state.time;
                                return Text(
                                  time,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Montserrat_ExtraBold',
                                      color: Colors.black),
                                );
                              }
                              return Text(
                                time,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Montserrat_ExtraBold',
                                    color: Colors.black),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget _metroRoutWithTime(MetroInfo info) {
    return GestureDetector(
      onTap: () => _navigateToRoutDetails(info),
      child: Card(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _metroStationPoints(info.details),
                  _metroStationNameAndTime(info.details),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _metroStationNameAndTime(List<RouteDetails> details) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _metroStationNameAndTimeColumn(details),
    );
  }

  List<Widget> _metroStationNameAndTimeColumn(List<RouteDetails> details) {
    List<Widget> col = []; //1
    for (int i = 0; i < details.length; i++) {
      if (i == 0) {
        col.add(_getTimeAndStationRow(
            details[i].route.startTime, details[i].route.start.name));
        col.add(SizedBox(height: 18));
        col.add(_distDurationHaltsText(
            details[i].routeInfo.distance,
            details[i].route.journeyTime,
            '${details[i].routeInfo.haltsCount}'));
        col.add(SizedBox(height: 18));
        col.add(_getTimeAndStationRow(
            details[i].route.endTime, details[i].route.end.name));
      } else {
        col.add(Container(
          padding: EdgeInsets.only(top: 5, bottom: 8, left: 20),
          child: Text(
            'Switch metro at ${details[i].route.start.name} to go ${details[i]
                .route.end.name}',
            style: TextStyle(
                fontFamily: FontResource.MontserratMedium,
                fontSize: 12,
                color: Colors.lightBlueAccent),
          ),
        ));

        col.add(_getTimeAndStationRow(
            details[i].route.startTime, details[i].route.start.name));
        col.add(SizedBox(height: 18));
        col.add(_distDurationHaltsText(
            details[i].routeInfo.distance,
            details[i].route.journeyTime,
            '${details[i].routeInfo.haltsCount}'));
        col.add(SizedBox(height: 18));
        col.add(_getTimeAndStationRow(
            details[i].route.endTime, details[i].route.end.name));
      }
    }
    return col;
  }

  Widget _metroStationPoints(List<RouteDetails> details) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _prepareStationPointWidget(details),
    );
  }

  List<Widget> _prepareStationPointWidget(List<RouteDetails> details) {
    List<Widget> col = []; //obj, obj, obj
    for (int i = 0; i < details.length; i++) {
      if (i == 0) {
        //last station
        col.add(_stationPoint());
        col.add(_verticalLine());
        col.add(_destStationPoint());
      } else {
        col.add(SizedBox(
          height: 38,
        ));
        col.add(_stationPoint());
        col.add(_verticalLine());
        col.add(_destStationPoint());
      }
    }
    return col;
  }

  Widget _time(String time) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        time,
        style: TextStyle(
            fontFamily: 'Montserrat_SemiBold',
            fontSize: 16,
            color: Colors.black),
      ),
    );
  }

  Widget _stationName(String name) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        name,
        style: TextStyle(
            fontFamily: 'Montserrat_Medium',
            fontSize: 12,
            color: Colors.black87),
      ),
    );
  }

  Widget _distDurationHaltsText(String dist, String duration, String halts) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Text('$dist :::: $duration :::: $halts Halts',
          style: TextStyle(fontSize: 12, fontFamily: 'Montserrat_Regular')),
    );
  }

  Widget _getTimeAndStationRow(String time, String station) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[_time(time), _stationName(station)],
    );
  }

  Widget _getInBetweenRow(String time, String station) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _time(time),
        _stationName(station),
        Text(
          '(Change Metro Here)',
          style: TextStyle(
              fontFamily: FontResource.MontserratMedium,
              color: Colors.red,
              fontSize: 12),
        )
      ],
    );
  }

  Widget _stationPoint() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.lightGreen,
            blurRadius: 20.0, // has the effect of softening the shadow
            spreadRadius: 6.0, // has the effect of extending the shadow
            offset: Offset(
              5.0, // horizontal, move right 10
              1.0, // vertical, move down 10
            ))
      ]),
      child: Stack(
        children: <Widget>[
          CustomPaint(painter: CircleShape(Colors.black, 10)),
          CustomPaint(painter: CircleShape(Colors.white, 4))
        ],
      ),
    );
  }

  Widget _destStationPoint() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 9),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.orangeAccent,
            blurRadius: 20.0, // has the effect of softening the shadow
            spreadRadius: 6.0, // has the effect of extending the shadow
            offset: Offset(
              5.0, // horizontal, move right 10
              1.0, // vertical, move down 10
            ))
      ]),
      child: Stack(
        children: <Widget>[
          CustomPaint(painter: CircleShape(Colors.orange, 10)),
          CustomPaint(painter: CircleShape(Colors.white, 4))
        ],
      ),
    );
  }

  Widget _verticalLine() {
    return Container(
      margin: EdgeInsets.only(left: 18, top: 9),
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
                ))
          ]),
      width: 5,
      height: 53,
    );
  }

  void _navigateToRoutDetails(MetroInfo info) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StationList(info: info)),
    );
  }
}
