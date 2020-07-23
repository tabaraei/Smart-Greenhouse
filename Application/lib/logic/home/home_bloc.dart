import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'home_services.dart';

// events
abstract class ShowRecordsEvent extends Equatable {}

class NewRecordEvent extends ShowRecordsEvent {
  @override
  List<Object> get props => [];
}

// bloc
class ShowRecordsBloc extends Bloc<ShowRecordsEvent, Record> {
  String soilMoistureValue, temperatureValue, humidityValue;

  @override
  Record get initialState => Record(
        soilMoisture: 30,
        temperature: 25,
        humidity: 70,
      );

  @override
  Stream<Record> mapEventToState(
    ShowRecordsEvent event,
  ) async* {
    // new record added
    if (event is NewRecordEvent) {
      var newRecord = await Record.getLastNRecord(1);
      yield Record(
        soilMoisture: newRecord.soilMoisture,
        temperature: newRecord.temperature,
        humidity: newRecord.humidity,
      );
    }
  }
}
