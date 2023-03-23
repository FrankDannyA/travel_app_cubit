import 'package:bloc/bloc.dart';
import 'package:travel_app_cubit/cubit/app_cubit.dart';
import 'package:travel_app_cubit/models/data_models.dart';
import 'package:travel_app_cubit/pages/detail_page.dart';
import 'package:travel_app_cubit/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  final DataServices data;
  late final places;

  AppCubits({
    required this.data,
  }) : super(InitialState()) {
    emit(WelcomeState());
  }

  getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (error) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
