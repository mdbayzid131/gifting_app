import 'package:flutter/material.dart';

class FaqTile extends StatelessWidget {
  final String question;
  final String answer;

  const FaqTile({super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffFFFAF8),
      elevation: 2,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        childrenPadding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10)),
        // Question Row
        title: Text(
          question,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff333333),
          ),
        ),

        // Answer Text
        children: [
          Text(
            answer,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 1.4,
              color: Color(0xff333333),
            ),
          ),
        ],
      ),
    );
  }
}
