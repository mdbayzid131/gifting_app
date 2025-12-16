import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:gifting_app/presentation/screens/find_profile/other_profile_screen.dart';
import 'package:gifting_app/presentation/widgets/custom_text_field.dart';

import '../../../core/constants/image_paths.dart';
import '../../../core/constants/navigator.dart';
import '../../../routes/routes.dart';
import '../../widgets/custom_appbar.dart';
import '../home/wish_list_view.dart';

class FindProfile extends StatefulWidget {
  const FindProfile({super.key});

  @override
  State<FindProfile> createState() => _FindProfileState();
}

class _FindProfileState extends State<FindProfile> {
  final List<Map<String, dynamic>> profiles =[
    {'name': 'Zara', 'imageUrl': null, 'ringColor': Colors.pink},
    {'name': 'Ziyan', 'imageUrl': null, 'ringColor': Colors.orange},
    {'name': 'Jisan', 'imageUrl': null, 'ringColor': Colors.blue},
    {'name': 'Zoe', 'imageUrl': null, 'ringColor': Colors.green},
    {'name': 'Ehan', 'imageUrl': null, 'ringColor': Colors.purple},
    {'name': 'Ehan', 'imageUrl': null, 'ringColor': Colors.purple},
    {'name': 'Ehan', 'imageUrl': null, 'ringColor': Colors.purple},
    {'name': 'Ehan', 'imageUrl': null, 'ringColor': Colors.black},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.customAppBar(title: "Find Profile"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),

            CustomTextField(
              hintText: 'Search Profile...',
              label: '',
              isLabelVisible: false,
              suffixIcon: Icon(Icons.search_outlined),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Recent search',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff222222),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: profiles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final p = profiles[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle profile tap
                          navigateTo(context, OtherProfileScreen());
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors
                                  .blue, //
                              width: 2, // border thickness
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(
                                  0,
                                  3,
                                ), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: p['imageUrl'] != null
                                       ? Image.asset(p['imageUrl']!)
                                      : Icon(Icons.person, color: Colors.grey.shade600, size: 24),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        p['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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