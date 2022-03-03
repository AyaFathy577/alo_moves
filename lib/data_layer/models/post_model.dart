import 'package:alo_moves/data_layer/models/user_model.dart';

class PostModel {
  final UserModel userModel;
  final String time;
  final String body;
  final List<String> comments;

  PostModel({
    required this.userModel,
    required this.time,
    required this.body,
    required this.comments,
  });

  PostModel.fromJson(Map<String, dynamic> data, List<String> commentsList)
      : userModel = UserModel.fromJson(data['user']),
        time = data['time'],
        body = data['body'],
        comments = commentsList;
}
