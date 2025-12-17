import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gifting_app/presentation/screens/find_profile/other_profile_screen.dart';
import 'package:gifting_app/presentation/widgets/custom_text_field.dart';

import '../../../core/constants/navigator.dart';
import '../../widgets/custom_appbar.dart';

class FindProfile extends StatefulWidget {
  const FindProfile({super.key});

  @override
  State<FindProfile> createState() => _FindProfileState();
}

class _FindProfileState extends State<FindProfile> {
  ///<================= PROFILE LIST =========================>///
  final List<Map<String, dynamic>> profiles = [
    {'name': 'Zara hhhh', 'imageUrl': null, 'ringColor': Colors.pink},
    {'name': 'Ziyan', 'imageUrl': null, 'ringColor': Colors.orange},
    {'name': 'Jisan', 'imageUrl': null, 'ringColor': Colors.blue},
    {'name': 'Zoe', 'imageUrl': null, 'ringColor': Colors.green},
    {'name': 'Ehan', 'imageUrl': null, 'ringColor': Colors.purple},
    {'name': 'Mahi', 'imageUrl': null, 'ringColor': Colors.teal},
    {'name': 'Rafi', 'imageUrl': null, 'ringColor': Colors.red},
    {'name': 'Nora', 'imageUrl': null, 'ringColor': Colors.black},
    {'name': 'Sami', 'imageUrl': null, 'ringColor': Colors.brown},
    {'name': 'Lina', 'imageUrl': null, 'ringColor': Colors.indigo},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: "Find Profile"),

      ///<================= BODY =========================>///
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),

            ///<================= SEARCH FIELD =========================>///
            CustomTextField(
              hintText: 'Search Profile...',
              label: '',
              isLabelVisible: false,
              suffixIcon: Icon(Icons.search_outlined, size: 22.sp),
            ),

            SizedBox(height: 20.h),

            ///<================= RECENT SEARCH TITLE =========================>///
            Text(
              'Recent search',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff222222),
              ),
            ),

            SizedBox(height: 12.h),

            ///<================= PROFILE GRID =========================>///
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: profiles.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.w,
                childAspectRatio: 0.7, // ⭐ cell height বাড়ানো হলো
              ),

              itemBuilder: (context, index) {
                final profile = profiles[index];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///<================= PROFILE AVATAR =========================>///
                    GestureDetector(
                      onTap: () {
                        navigateTo(context, const OtherProfileScreen());
                      },
                      child: Container(
                        width: 52.w,
                        height: 52.w, // width == height (perfect circle)
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: profile['ringColor'],
                            width: 2.w,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: profile['imageUrl'] != null
                              ? Image.asset(
                                  profile['imageUrl'],
                                  fit: BoxFit.cover,
                                )
                              : Icon(
                                  Icons.person,
                                  size: 26.sp,
                                  color: Colors.grey.shade600,
                                ),
                        ),
                      ),
                    ),

                    SizedBox(height: 6.h),

                    ///<================= PROFILE NAME =========================>///
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        profile['name'].toString().split(" ").first,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
