class UserModel {
  final String id;
  final String name;
  final String image;

  UserModel({required this.id, required this.name, required this.image});

  UserModel.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        image = data['image'];
}
