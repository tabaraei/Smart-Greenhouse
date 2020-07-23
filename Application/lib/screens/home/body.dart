import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'body/box.dart';
import 'body/gauge.dart';
import '../../logic/home/home_services.dart';
import '../../logic/home/home_bloc.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        BlocBuilder<ShowRecordsBloc, Record>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Box(
                  value: '${state.temperature}°C',
                  title: 'دمای هوا',
                ),
                Box(
                  value: '${state.humidity.toInt()}%',
                  title: 'رطوبت هوا',
                ),
              ],
            );
          },
        ),
        Gauge(),
      ],
    );
  }
}
