import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dropdown_state.dart';

class DropdownCubit extends Cubit<DropdownState> {
  DropdownCubit() : super(DropdownInitial());

  String value1 = "Мужской";

  void changeValue(String value) {
    value1 = value;
    emit(DropdownInitial());
  }
}
