import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';

class SendVoicePopup extends StatefulWidget {
  const SendVoicePopup({super.key});

  @override
  State<SendVoicePopup> createState() => _SendVoicePopupState();
}

class _SendVoicePopupState extends State<SendVoicePopup> {
  final record = AudioRecorder();
  String? filePath;

  Future<void> startRecording() async {
    if (await record.hasPermission()) {
      final directory = await getApplicationDocumentsDirectory();
      filePath =
          '${directory.path}/voice_${DateTime.now().millisecondsSinceEpoch}.m4a';

      await record.start(const RecordConfig(), path: filePath.toString());
      setState(() {});
    }
  }

  Future<void> stopRecording() async {
    await record.stop();
    Navigator.pop(context, filePath); // return file path
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(color: Colors.black.withOpacity(0.4)),
        ),
        Center(
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Send a Voice Note 🎤",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Press the microphone to start recording",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                InkWell(
                  onTap: () async {
                    await startRecording();
                    await Future.delayed(
                      const Duration(seconds: 4),
                    ); // auto stop
                    await stopRecording();
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.orange,
                    child: const Icon(Icons.mic, size: 40, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () => stopRecording(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text("Send"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
