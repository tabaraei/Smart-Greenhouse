import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/home/home_bloc.dart';
import 'logic/automatic/automatic_bloc.dart';
import 'logic/manual/manual_bloc.dart';
import 'template/routes.dart';

void main() => runApp(SmartGreenhouse());

class SmartGreenhouse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShowRecordsBloc>(
          create: (BuildContext context) => ShowRecordsBloc(),
        ),
        BlocProvider<AutomaticIrrigationBloc>(
          create: (BuildContext context) => AutomaticIrrigationBloc(),
        ),
        BlocProvider<ManualIrrigationBloc>(
          create: (BuildContext context) => ManualIrrigationBloc(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("fa", "IR"),
        ],
        locale: Locale("fa", "IR"),
        onGenerateRoute: (settings) => navigate(settings),
      ),
    );
  }
}
