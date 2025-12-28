import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_appbar.dart';

class FollowersPage extends StatelessWidget {
  const FollowersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final totalFollowers = 100;
    final followers = [
      {
        "name": "Emma Jhonson",
        "username": "@Emma_92",
        "image": "https://i.pravatar.cc/150?img=1",
      },
      {
        "name": "Emma Jhonson",
        "username": "@Emma_92",
        "image": "https://i.pravatar.cc/150?img=1",
      },
      {
        "name": "Emma Jhonson",
        "username": "@Emma_92",
        "image": "https://i.pravatar.cc/150?img=1",
      },
      {
        "name": "Emma Jhonson",
        "username": "@Emma_92",
        "image": "https://i.pravatar.cc/150?img=1",
      },
      {
        "name": "Emma Jhonson",
        "username": "@Emma_92",
        "image": "https://i.pravatar.cc/150?img=1",
      },
      {
        "name": "Emma Jhonson",
        "username": "@Emma_92",
        "image": "https://i.pravatar.cc/150?img=1",
      },
      {
        "name": "Michael Brown",
        "username": "@Emich_b92",
        "image": "https://i.pravatar.cc/150?img=2",
      },
      {
        "name": "James Harris",
        "username": "@Adjms_smith92",
        "image": "https://i.pravatar.cc/150?img=3",
      },
      {
        "name": "William",
        "username": "@Adjms_smith92",
        "image": "https://i.pravatar.cc/150?img=4",
      },
      {
        "name": "Sophia Moore",
        "username": "@Ava_smith92",
        "image": "https://i.pravatar.cc/150?img=5",
      },
      {
        "name": "James Harris",
        "username": "@Adjms_smith92",
        "image": "https://i.pravatar.cc/150?img=6",
      },
      {
        "name": "William",
        "username": "@Adjms_smith92",
        "image": "https://i.pravatar.cc/150?img=7",
      },
    ];

    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: "Followers"),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  'Followers',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text('($totalFollowers)',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400)),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: followers.length,
                          separatorBuilder: (_, __) =>
                              Divider(height: 1, color: Colors.grey.shade200),
                          itemBuilder: (context, index) {
                            final item = followers[index];
                            return GestureDetector(
                              onTap: () {
                                // Handle item tap
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.h,
                                  horizontal: 12.w,
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 26.r,
                                      backgroundImage: NetworkImage(item["image"]!),
                                    ),
                                    SizedBox(width: 12.w),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item["name"]!,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          item["username"]!,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
