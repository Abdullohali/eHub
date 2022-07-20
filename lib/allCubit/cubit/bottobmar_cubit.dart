import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottobmar_state.dart';

class BottombarCubit extends Cubit<BottobmarState> {
  BottombarCubit() : super(BottobmarInitial());
  int _currentPageIndex = 0;

  void onBottomBarChanged(int index) {
    _currentPageIndex = index;
    emit(BottobmarInitial());
  }

  int get currentPageIndex => _currentPageIndex;
}
