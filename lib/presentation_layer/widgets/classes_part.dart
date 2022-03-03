import 'package:alo_moves/data_layer/models/class_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ClassesPart extends StatefulWidget {
  final List<ClassModel> classes;

  const ClassesPart({Key? key, required this.classes}) : super(key: key);

  @override
  State<ClassesPart> createState() => _ClassesPartState();
}

class _ClassesPartState extends State<ClassesPart> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.classes.length,
      itemBuilder: (context, index) => Column(
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
          InkWell(
            onTap: () {
              setState(() {
                _controller.value.isPlaying ? _controller.pause() : _controller.play();
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          )
        ],
      ),
    );
  }
}
