import 'package:flutter_bloc/flutter_bloc.dart';

class CountCubit extends Cubit<int> {
  CountCubit() : super(0);

  void increment() {
    emit(state + 1);
  }
}
