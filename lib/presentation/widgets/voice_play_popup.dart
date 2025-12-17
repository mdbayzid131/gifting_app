import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
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
  late final AudioPlayer _player;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  bool _isLoading = true;
  bool _isPlaying = false;
  bool _hasError = false;

  /// ================= INIT ================= ///
  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _setupPlayer();
  }

  /// ================= AUDIO SETUP ================= ///
  Future<void> _setupPlayer() async {
    try {
      await _player.setFilePath(
        '/data/user/0/com.example.gifting_app/app_flutter/voice_1765933820218.m4a',
      );

      /// Position listener
      _player.positionStream.listen((position) {
        if (!mounted) return;
        setState(() => _position = position);
      });

      /// Duration listener
      _player.durationStream.listen((duration) {
        if (!mounted) return;
        setState(() {
          _duration = duration ?? Duration.zero;
          _isLoading = false;
        });
      });

      /// Player state listener
      _player.playerStateStream.listen((state) {
        if (!mounted) return;

        if (state.processingState == ProcessingState.completed) {
          _player.seek(Duration.zero);
          _player.pause();

          setState(() {
            _position = Duration.zero;
            _isPlaying = false;
          });
        } else {
          setState(() => _isPlaying = state.playing);
        }
      });
    } catch (e) {
      debugPrint("Audio error: $e");
      if (!mounted) return;
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  /// ================= FORMAT TIME ================= ///
  String _formatTime(Duration duration) {
    final min = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final sec = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$min:$sec";
  }

  /// ================= DISPOSE ================= ///
  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  /// ================= UI ================= ///
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// ===== Blur Background ===== ///
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(color: Colors.black.withOpacity(0.4)),
        ),

        /// ===== Popup ===== ///
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
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.close,
                          size: 20.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  _buildBody(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// ================= BODY ================= ///
  Widget _buildBody() {
    if (_isLoading) {
      return SizedBox(
        height: 160.h,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_hasError) {
      return SizedBox(
        height: 160.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red),
            SizedBox(height: 10.h),
            const Text("Failed to load audio"),
          ],
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// ===== Close Button ===== ///
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              _player.stop();
              Navigator.pop(context);
            },
            child: Icon(Icons.close, size: 22.sp),
          ),
        ),

        /// ===== Title ===== ///
        Text(
          "Voice Note from ${widget.name}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 20.h),

        /// ===== Icon ===== ///
        SvgPicture.asset(ImagePaths.voice, height: 60.h),

        SizedBox(height: 20.h),

        /// ===== Time ===== ///
        Row(
          children: [
            Text(_formatTime(_position,), style: TextStyle(fontSize: 12.sp,color: Color(0xff828779))),
            const Spacer(),
            Text(
              _formatTime(_duration - _position),
              style: TextStyle(fontSize: 12.sp,color: Color(0xff828779)),
            ),
          ],
        ),

        SizedBox(height: 15.h),

        /// ===== Play / Pause ===== ///
        InkWell(
          borderRadius: BorderRadius.circular(50.r),
          onTap: () {
            _isPlaying ? _player.pause() : _player.play();
          },
          child: CircleAvatar(
            radius: 35.r,
            backgroundColor: Color(0xffFD7839),
            child: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              size: 40.sp,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 15.h),

        /// ===== Slider ===== ///
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 6.5.h,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.r),
            // ⭐ thumb size
            overlayShape: RoundSliderOverlayShape(overlayRadius: 16.r),
          ),
          // ⭐ touch ripple ),,
          child: Slider(
            value: _position.inSeconds.toDouble().clamp(
              0,
              _duration.inSeconds.toDouble(),
            ),
            max: _duration.inSeconds.toDouble().clamp(1, double.infinity),
            onChanged: (value) {
              _player.seek(Duration(seconds: value.toInt()));
            },
            activeColor: Color(0xffFD7839),
            inactiveColor: Color(0xffE5E7EB),
          ),
        ),
      ],
    );
  }
}
