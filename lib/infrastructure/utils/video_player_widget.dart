import 'package:flutter/material.dart';
import 'package:sapad_v3/infrastructure/utils/basic_overlay_widget.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? Center(
            child: Container(alignment: Alignment.center, child: buildVideo()))
        : Container(
            height: 200, child: Center(child: CircularProgressIndicator()));
  }

  Widget buildVideo() => Stack(children: [
        buildVideoPlayer(),
        Positioned.fill(child: BasicOverlayWidget(controller: controller))
      ]);

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));
}
