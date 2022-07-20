import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'arias_state.dart';

class AriasCubit extends Cubit<AriasState> {
  AriasCubit() : super(AriasInitial());

  List indexList = List.generate(65, (index) => true);

  void changeValue(int index) {
    indexList[index] = !indexList[index];
    emit(AriasInitial());
  }
}
