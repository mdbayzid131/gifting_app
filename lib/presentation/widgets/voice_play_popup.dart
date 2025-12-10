import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

import '../../core/constants/image_paths.dart';

class PlayVoicePopup extends StatefulWidget {
  final String path;
  final String name;

  const PlayVoicePopup({super.key, required this.path, required this.name});

  @override
  State<PlayVoicePopup> createState() => _PlayVoicePopupState();
}

class _PlayVoicePopupState extends State<PlayVoicePopup> {
  final player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    setupPlayer();
  }

  Future<void> setupPlayer() async {
    await player.setFilePath(widget.path);

    duration = await player.load() ?? Duration.zero;

    player.positionStream.listen((p) {
      setState(() => position = p);
    });
    player.durationStream.listen((d) {
      setState(() => duration = d ?? Duration.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(color: Colors.black.withOpacity(0.4)),
        ),
        Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 330,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    GestureDetector(onTap: (){Navigator.pop(context);}, child: const Icon(Icons.close, size: 20, color: Colors.red)),
                  ],),
                  Text(
                    "Voice Note from ${widget.name}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  SvgPicture.asset(ImagePaths.voice,),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text("${position.inSeconds}"),
                      const Spacer(),
                      Text("${duration.inSeconds - position.inSeconds}"),
                    ],
                  ),
                  Slider(
                    value: position.inSeconds.toDouble(),
                    max: duration.inSeconds.toDouble(),
                    onChanged: (value) {
                      player.seek(Duration(seconds: value.toInt()));
                    },
                  ),

                  const SizedBox(height: 15),

                  InkWell(
                    onTap: () => player.playing ? player.pause() : player.play(),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.orange,
                      child: Icon(
                        player.playing ? Icons.pause : Icons.play_arrow,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
