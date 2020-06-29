import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'manual_services.dart';

// events
abstract class ManualIrrigationEvent extends Equatable {}

class StartIrrigationEvent extends ManualIrrigationEvent {
  @override
  List<Object> get props => [];
}

class EndIrrigationEvent extends ManualIrrigationEvent {
  @override
  List<Object> get props => [];
}

// bloc
class ManualIrrigationBloc extends Bloc<ManualIrrigationEvent, Toggle> {
  @override
  Toggle get initialState => Toggle(toggle: false, title: 'شروع');

  @override
  Stream<Toggle> mapEventToState(
    ManualIrrigationEvent event,
  ) async* {
    if (event is StartIrrigationEvent) {
      Toggle toggle = await Toggle.updateToggle(true);
      yield toggle;
    } else if (event is EndIrrigationEvent) {
      Toggle toggle = await Toggle.updateToggle(false);
      yield toggle;
    }
  }
}
