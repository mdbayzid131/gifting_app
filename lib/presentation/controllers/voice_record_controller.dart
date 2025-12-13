import 'dart:async';
import 'package:get/get.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class VoiceRecordController extends GetxController {
  final AudioRecorder _recorder = AudioRecorder();

  final isRecording = false.obs;
  final seconds = 0.obs;

  String? filePath;
  Timer? _timer;

  /// ---------------- Permission ----------------
  Future<bool> _checkPermission() async {
    return await _recorder.hasPermission();
  }

  /// ---------------- Start Recording ----------------
  Future<void> startRecording() async {
    final hasPermission = await _checkPermission();
    if (!hasPermission) {
      Get.snackbar("Permission", "Microphone permission denied");
      return;
    }

    final dir = await getApplicationDocumentsDirectory();
    filePath =
    '${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.m4a';

    await _recorder.start(
      const RecordConfig(encoder: AudioEncoder.aacLc),
      path: filePath!,
    );

    _startTimer();
    isRecording.value = true;
  }

  /// ---------------- Stop Recording ----------------
  Future<void> stopRecording({bool send = false}) async {
    if (!isRecording.value) return;

    await _recorder.stop();
    _stopTimer();
    isRecording.value = false;

    if (send) {
      Get.back(result: filePath);
    }
  }

  /// ---------------- Timer ----------------
  void _startTimer() {
    seconds.value = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      seconds.value++;
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  String get formattedTime {
    final m = (seconds.value ~/ 60).toString().padLeft(2, '0');
    final s = (seconds.value % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  void onClose() {
    _recorder.dispose();
    _stopTimer();
    super.onClose();
  }
}
