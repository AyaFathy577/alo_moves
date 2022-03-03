import 'package:alo_moves/data_layer/models/series_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'series_state.dart';

class SeriesBloc extends Cubit<SeriesState> {
  SeriesBloc() : super(SeriesInitial());

  updateSeries(List<SeriesModel> value) {
    emit(UpdateSeries(value));
  }
}