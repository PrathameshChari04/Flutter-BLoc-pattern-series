import 'dart:async';
import 'dart:developer';

import 'package:bloc_first/counter_event.dart';

class BlocCounter {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;

  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CountEvent>();

  Sink<CountEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {

    _counterEventController.stream.listen(_mapEventToState);
    
  }
    
      
    
    
  void _mapEventToState(CountEvent event) {

    if (event is IncrementEvent)
      _counter++;
    else
      _counter--;
    
    _inCounter.add(_counter);

    
  }

  void dispose() {

    _counterStateController.close();
    _counterEventController.close();
  }
}