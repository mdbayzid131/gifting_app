import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

import '../../core/constants/image_paths.dart';

class PlayVoicePopup extends StatefulWidget {
  final String path;
  final String name;

  const PlayVoicePopup({
    super.key,
    required this.path,
    required this.name,
  });

  @override
  State<PlayVoicePopup> createState() => _PlayVoicePopupState();
}

class _PlayVoicePopupState extends State<PlayVoicePopup> {
  late final AudioPlayer _player;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isLoading = true;
  bool _isPlaying = false;

  ///<=============== INIT ==================>///
  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _setupPlayer();
  }

  ///<=============== AUDIO SETUP ==================>///
  Future<void> _setupPlayer() async {
    try {
      await _player.setFilePath(widget.path);

      ///<=============== POSITION LISTENER ==================>///
      _player.positionStream.listen((position) {
        if (!mounted) return;
        setState(() => _position = position);
      });

      ///<=============== DURATION LISTENER ==================>///
      _player.durationStream.listen((duration) {
        if (!mounted) return;
        setState(() {
          _duration = duration ?? Duration.zero;
          _isLoading = false;
        });
      });

      ///<=============== PLAYER STATE LISTENER ==================>///
      _player.playerStateStream.listen((state) {
        if (!mounted) return;

        if (state.processingState == ProcessingState.completed) {
          /// 🔥 Audio finished → reset
          _player.seek(Duration.zero);
          _player.pause();

          setState(() {
            _position = Duration.zero;
            _isPlaying = false;
          });
        } else {
          setState(() {
            _isPlaying = state.playing;
          });
        }
      });
    } catch (e) {
      debugPrint("Audio error: $e");
      _isLoading = false;
    }
  }

  ///<=============== FORMAT TIME ==================>///
  String _formatTime(Duration duration) {
    final min = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final sec = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$min:$sec";
  }

  ///<=============== DISPOSE ==================>///
  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  ///<=============== UI ==================>///
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///<=============== BLUR BACKGROUND ==================>///
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(color: Colors.black.withOpacity(0.4)),
        ),

        ///<=============== POPUP CARD ==================>///
        Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 330.w,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: _isLoading
                  ? SizedBox(
                height: 150.h,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
                  : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///<=============== CLOSE BUTTON ==================>///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _player.stop();
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: 22.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  ///<=============== TITLE ==================>///
                  Text(
                    "Voice Note from ${widget.name}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20.h),

                  ///<=============== VOICE ICON ==================>///
                  SvgPicture.asset(
                    ImagePaths.voice,
                    height: 60.h,
                  ),

                  SizedBox(height: 20.h),

                  ///<=============== TIME LABEL ==================>///
                  Row(
                    children: [
                      Text(
                        _formatTime(_position),
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      const Spacer(),
                      Text(
                        _formatTime(_duration - _position),
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ],
                  ),

                  ///<=============== SLIDER ==================>///
                  Slider(
                    value: _position.inSeconds
                        .toDouble()
                        .clamp(0, _duration.inSeconds.toDouble()),
                    max: _duration.inSeconds
                        .toDouble()
                        .clamp(1, double.infinity),
                    onChanged: (value) {
                      _player.seek(
                        Duration(seconds: value.toInt()),
                      );
                    },
                  ),

                  SizedBox(height: 15.h),

                  ///<=============== PLAY / PAUSE BUTTON ==================>///
                  InkWell(
                    borderRadius: BorderRadius.circular(50.r),
                    onTap: () {
                      _isPlaying
                          ? _player.pause()
                          : _player.play();
                    },
                    child: CircleAvatar(
                      radius: 35.r,
                      backgroundColor: Colors.orange,
                      child: Icon(
                        _isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 40.sp,
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
