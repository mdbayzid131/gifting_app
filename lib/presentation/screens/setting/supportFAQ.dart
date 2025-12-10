import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../controllers/settingController.dart';
import '../../widgets/CustomFqaTile.dart';
import '../../widgets/custom_appbar.dart';

class SupportFaq extends StatefulWidget {
  const SupportFaq({super.key});

  @override
  State<SupportFaq> createState() => _SupportFaqState();
}

class _SupportFaqState extends State<SupportFaq> {
  final SettingController _controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: "FQA"),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: Text(
                'Welcome to our FAQ page.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333),
                ),
              ),
            ),
            SizedBox(height: 24),
            Obx(
              ()=> ListView.builder(
                shrinkWrap: true,
                itemCount: _controller.fqa.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      FaqTile(
                        question: _controller.fqa[index]['question']!,
                        answer:_controller.fqa[index]['answer']!,
                      ),
                      SizedBox(height: 12),

                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
