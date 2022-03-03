import 'package:alo_moves/data_layer/models/user_model.dart';

class CoachModel {
  final UserModel userModel;
  final String overview;

  CoachModel({required this.userModel, required this.overview});

  CoachModel.fromJson(Map<String, dynamic> data)
      : userModel = UserModel.fromJson(data['user']),
        overview = data['overview'];
}
