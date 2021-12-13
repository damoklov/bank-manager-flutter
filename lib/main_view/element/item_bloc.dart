import 'dart:math';

import 'package:bank_manager/service/api_firebase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Increment {
  Increment(this._id, this._value);

  final String _id;
  final double _value;

  String get id => _id;

  double get value => _value;
}

class ItemBloc extends Bloc<Increment, String> {
  ItemBloc(String initialState) : super(initialState);

  @override
  Stream<String> mapEventToState(Increment event) async* {
    if (event is Increment) {
      API(documentId: event.id).updateData(double.parse(
          (event.value + (Random().nextInt(1000) * Random().nextDouble()))
              .toStringAsFixed(2)));
      print(event.id);
    } else {
      print("object");
    }
  }
}
