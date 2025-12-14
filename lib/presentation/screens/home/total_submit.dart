import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_appbar.dart';

class TotalSubmitPage extends StatelessWidget {
  TotalSubmitPage({super.key});

  final List<Map<String, Object>> itemList = [
    {'relation': 'Father', 'name': 'Jhon', 'item': 'Bear', 'type': 'dream'},
    {'relation': 'Father', 'name': 'Jhon', 'item': 'Bear', 'type': 'Reward'},
    {'relation': 'Father', 'name': 'Jhon', 'item': 'Bear', 'type': 'wishlist'},
    {'relation': 'Father', 'name': 'Jhon', 'item': 'Bear', 'type': 'dream'},
    {'relation': 'Father', 'name': 'Jhon', 'item': 'Bear', 'type': 'Reward'},
    {'relation': 'Father', 'name': 'Jhon', 'item': 'Bear', 'type': 'Reward'},
    {'relation': 'Father', 'name': 'Jhon', 'item': 'Bear', 'type': 'Reward'},
    {'relation': 'Father', 'name': 'Jhon', 'item': 'Bear', 'type': 'Reward'},
    {'relation': 'Father', 'name': 'Jhon', 'item': 'Bear', 'type': 'Reward'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF7F2),
      appBar: CustomWidgets.customAppBar(title: "Total Submit"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            _tableHeader(),
            ListView.builder(
              itemCount: itemList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final Map<String, Object> item = itemList[index];
                final typeStr = item["type"].toString().toLowerCase();

                return _tableRow(
                  relation: "${item["relation"]}",
                  name: "${item["name"]}",
                  item: "${item["item"]}",
                  type: "${item["type"]}",
                  amount: "${item["relation"]}", // as before, behavior unchanged
                  typeColor: typeStr == "reward"
                      ? Colors.blue
                      : typeStr == "wishlist"
                      ? Colors.purple
                      : Colors.green,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 🔶 Table Header
  Widget _tableHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: const Color(0xffFD7839),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      child: Row(
        children: const [
          _HeaderText("Relation"),
          _HeaderText("Name"),
          _HeaderText("Item Name"),
          _HeaderText("Fund type"),
          _HeaderText("Amount"),
        ],
      ),
    );
  }

  /// 🔹 Table Row
  Widget _tableRow({
    required String relation,
    required String name,
    required String item,
    required String type,
    required String amount,
    required Color typeColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          _CellText(relation),
          _CellText(name),
          _CellText(item),
          _fundType(type, typeColor),
          _CellText(amount),
        ],
      ),
    );
  }

  /// 🟡 Fund Type Chip
  Widget _fundType(String text, Color color) {
    return Expanded(
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: color,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

/// 🔸 Header Text Widget
class _HeaderText extends StatelessWidget {
  final String text;
  const _HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

/// 🔹 Cell Text Widget
class _CellText extends StatelessWidget {
  final String text;
  const _CellText(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, color: Color(0xff101828)),
        ),
      ),
    );
  }
}
