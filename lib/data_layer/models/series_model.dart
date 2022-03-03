import 'package:alo_moves/data_layer/models/post_model.dart';
import 'package:alo_moves/data_layer/models/class_model.dart';
import 'package:alo_moves/data_layer/models/coach_model.dart';

class SeriesModel {
  final String id;
  final String name;
  final String image;
  final List<CoachModel> coaches;
  final String description;
  final String videoUrl;
  final int videosNumber;
  final String totalTime;
  final String difficulty;
  final String intensity;
  final List<ClassModel> classes;
  final List<PostModel> posts;

  SeriesModel({
    required this.id,
    required this.name,
    required this.image,
    required this.coaches,
    required this.description,
    required this.videoUrl,
    required this.videosNumber,
    required this.totalTime,
    required this.difficulty,
    required this.intensity,
    required this.classes,
    required this.posts,
  });

  SeriesModel.fromJson(Map<String, dynamic> data,
      {required List<CoachModel> coachesList,
      required List<PostModel> postsList,
      required List<ClassModel> classesList})
      : id = data['id'],
        name = data['name'],
        image = data['image'],
        coaches = coachesList,
        description = data['description'],
        videoUrl = data['video_url'],
        videosNumber = data['videos_number'],
        totalTime = data['total_time'],
        difficulty = data['difficulty'],
        intensity = data['intensity'],
        classes = classesList,
        posts = postsList;
}
