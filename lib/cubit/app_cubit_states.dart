import 'package:bloc/bloc.dart';
import 'package:travel_app_cubit/cubit/app_cubit.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
  }
}
