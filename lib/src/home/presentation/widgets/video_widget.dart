import 'dart:io';

import 'package:app/core/decorations/decorations.dart';
import 'package:app/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoWidget extends StatefulWidget {
  final String url;
  final bool autoPlay;
  VideoPlayerController? controller;

  VideoWidget({super.key, required this.url, this.autoPlay = true, this.controller});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  // late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // widget.controller = VideoPlayerController.networkUrl(Uri.parse(widget.url));
    //
    // widget.controller?.initialize().then((_) {
    //   // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //   setState(() {
    //     widget.controller!.setLooping(true);
    //   });
    // });
    // widget.autoPlay ? widget.controller?.play() : widget.controller?.pause();
    widget.controller?.play();
    // widget.controller!.value.isInitialized ? widget.controller?.play() : widget.controller?.pause();
    // widget.controller!.initialize();
    print('VideoWidget: ${widget.controller!.value.isInitialized}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 5.paddingHoriz,
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      decoration: Decorations.shapeDecorationShadow(color: const Color(0xFFF0F1F2)),
      child: FutureBuilder(
          future: widget.controller!.position,
          builder: (context, snapshot) {
            bool isPlaying = widget.controller!.value.isPlaying;
          return Stack(
            alignment: isPlaying
                ? AlignmentDirectional.bottomEnd
                : AlignmentDirectional.center,
            children: [
              widget.controller!.value.isPlaying || snapshot.hasData
                  ?
            VideoPlayer(widget.controller!,)
                  : Image.asset(
                      'assets/images/loading.gif',
                      fit: BoxFit.cover,
                    ),
              IconButton(
                  icon: Icon(isPlaying ? Icons.pause_circle : Icons.play_circle),
                  color: Colors.white,
                  padding: 10.paddingAll,
                  onPressed: () {
                    if (widget.autoPlay) {
                      setState(() {
                        widget.controller!.value.isPlaying
                            ? widget.controller!.pause()
                            : widget.controller!.play();
                      });
                    }
                  }),
            ],
          );
        }
      ),
    );
  }
}
