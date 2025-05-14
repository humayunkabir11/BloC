import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event__event.dart';
part 'counter_event__state.dart';

class CounterEventBloc extends Bloc<CounterEventEvent, CounterEventState> {
  CounterEventBloc() : super(CounterEventInitial()) {
    on<CounterEventEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
