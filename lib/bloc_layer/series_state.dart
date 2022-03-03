part of 'series_bloc.dart';

@immutable
abstract class SeriesState {}

class SeriesInitial extends SeriesState {}

class UpdateSeries extends SeriesState {
  final List<SeriesModel> series;

  UpdateSeries(this.series);
}
