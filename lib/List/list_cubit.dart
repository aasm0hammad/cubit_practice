import 'package:cubit_practice/List/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListState(mData: []));

  ///Add list
  addList(Map<String, dynamic> value) {
    List<Map<String, dynamic>> currentState = state.mData;

    currentState.add(value);

    emit(ListState(mData: currentState));
  }

  ///update List
  updateList(Map<String, dynamic> updateValue, int index) {
    state.mData[index] = updateValue;
    emit(ListState(mData: state.mData));
  }

  ///delete List

  deleteList(int index) {
    state.mData.removeAt(index);
    List<Map<String, dynamic>> currentState = state.mData;
    emit(ListState(mData: currentState));
  }
}
