class ClassModel {
  final String name;
  final String videoUrl;
  final String duration;
  final String description;

  ClassModel({
    required this.name,
    required this.videoUrl,
    required this.duration,
    required this.description,
  });

  ClassModel.fromJson(Map<String, dynamic> data)
      : name = data['name'],
        description = data['description'],
        duration = data['duration'],
        videoUrl = data['video_url'];
}
