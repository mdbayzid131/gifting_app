import 'package:get/get.dart';

class ContributeController extends GetxController {
  RxString selectedRelation = ''.obs;

  // Example country list
  final List<String> relations = [
    "Mother",
    "Father",
    "Sister",
    "Brother",
    "Grandmother",
    "Grandfather",
    "Aunt",
    "Uncle",
    "Cousin",
    "Niece",
    "Nephew",
    "Friend",
    "Other",
  ];

  String? aamountValidate(String? value, {double minAmount = 1}) {
    if (value == null || value.trim().isEmpty) {
      return "Amount cannot be empty";
    }

    // Only digits + decimal allowed
    if (!RegExp(r'^[0-9]+(\.[0-9]+)?$').hasMatch(value.trim())) {
      return "Enter a valid amount";
    }

    final amount = double.tryParse(value.trim()) ?? 0;

    if (amount < minAmount) {
      return "Minimum amount is $minAmount";
    }

    return null;
  }

  String? amountValidate(String? value, {double minAmount = 1}) {
    if (value == null || value.trim().isEmpty) {
      return "Amount cannot be empty";
    }

    String input = value.trim();

    // Reject input like ".", ".5", "5.", "..", "5..0"
    if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(input)) {
      return "Enter a valid amount";
    }

    // Parse safely
    final amount = double.tryParse(input);
    if (amount == null) {
      return "Invalid amount format";
    }

    // Minimum amount rule
    if (amount < minAmount) {
      return "Minimum amount is $minAmount";
    }

    return null;
  }

  String? validLink(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Link cannot be empty";
    }
    return null;
  }
}
