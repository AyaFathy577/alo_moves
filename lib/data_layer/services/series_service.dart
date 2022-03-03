import 'dart:convert';
import 'package:alo_moves/data_layer/models/class_model.dart';
import 'package:alo_moves/data_layer/models/coach_model.dart';
import 'package:alo_moves/data_layer/models/post_model.dart';
import 'package:alo_moves/data_layer/models/series_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SeriesService {
  List<SeriesModel> _series = [];

  List<SeriesModel> get series => _series;

  Future getSeries() async {
    final String response = await rootBundle.loadString('assets/files/data.json');
    final extractedData = await json.decode(response)['series'] as List<dynamic>;
    final List<SeriesModel> loadedSeries = [];
    final List<CoachModel> loadedCoaches = [];
    final List<PostModel> loadedPosts = [];
    final List<ClassModel> loadedClasses = [];
    final List<String> loadedComments = [];
    for (var element in extractedData) {
      element['coaches'].forEach((coach) {
        loadedCoaches.add(CoachModel.fromJson(coach));
      });
      element['posts'].forEach((post) {
        post['comments'].forEach((comment) {
          loadedComments.add(comment);
        });
        loadedPosts.add(PostModel.fromJson(post, loadedComments));
      });
      element['classes'].forEach((classElement) {
        loadedClasses.add(ClassModel.fromJson(classElement));
      });
      loadedSeries.add(SeriesModel.fromJson(element,
          classesList: loadedClasses, coachesList: loadedCoaches, postsList: loadedPosts));
    }
    _series = loadedSeries;
  }

  SeriesModel? getSeriesById(String id) {
    SeriesModel? seriesModel;
    debugPrint(_series.length.toString());
    try {
      seriesModel = _series.firstWhere((element) => element.id == id);
    } catch (err) {
      seriesModel = null;
    }
    return seriesModel;
  }
}
