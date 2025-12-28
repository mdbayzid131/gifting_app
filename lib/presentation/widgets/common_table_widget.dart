import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget commonTable({
  required List<Map<String, String>> items,
  required String fundLabel,
  required Color fundColor,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      children: [
        // Header
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: const BoxDecoration(
            color: Color(0xFFFF7A2F),
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: const Row(
            children: [

              Expanded(
                child: Center(
                  child: Text(
                    'Item Name',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              Expanded(
                child: Center(
                  child: Text(' Current Amount', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),

        // Body
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                child: Row(
                  children: [

                    Expanded(child: Center(child: Text(item['item']!))),
                    Expanded(child: Center(child: Text(item['amount']!))),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
