import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async'; // Timer periodic
import 'drawer.dart';
import 'body.dart';
import '../../template/appbar.dart';
import '../../template/colors.dart';
import '../../logic/home/home_bloc.dart';
import '../../logic/automatic/automatic_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AutomaticIrrigationBloc>(context).add(GetThresholdEvent());
    Timer.periodic(
      Duration(seconds: 1),
      (Timer t) =>
          BlocProvider.of<ShowRecordsBloc>(context).add(NewRecordEvent()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyDark,
      appBar: MyAppBar('گلخانه هوشمند'),
      drawer: MyDrawer(),
      body: Body(),
    );
  }
}
