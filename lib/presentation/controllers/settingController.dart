import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SettingController extends GetxController {
 RxList<Map<String, String>> fqa = [
    {
      "question": "Q1. How Do I Send A Gift?",
      "answer":
          "A1. Choose Send Gift, select a recipient and gift, complete payment, and we’ll notify the recipient.",
    },
    {
      "question": "Q2. How Do I Send A Gift?",
      "answer":
      "A2. Choose Send Gift, select a recipient and gift, complete payment, and we’ll notify the recipient.",
    },
    {
      "question": "Q3. How Do I Send A Gift?",
      "answer":
      "A3. Choose Send Gift, select a recipient and gift, complete payment, and we’ll notify the recipient.",
    },
  ].obs;
}
