import 'package:alo_moves/data_layer/models/series_model.dart';
import 'package:alo_moves/data_layer/services/series_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'series_state.dart';

class SeriesBloc extends Cubit<SeriesState> {
  SeriesBloc() : super(SeriesInitial());

  SeriesService seriesService = SeriesService();

  getSeries() async {
    await seriesService.getSeries();
    emit(UpdateSeries(seriesService.series));
  }

  getSeriesById(String id) {
    debugPrint("getBy id = $id");
    var value = seriesService.getSeriesById(id);
    debugPrint("value.name = ${value!.name}");
    emit(ShowSeries(value));
  }
}
