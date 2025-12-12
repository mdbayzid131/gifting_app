// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../core/constants/image_paths.dart';
// import 'custom_appbar.dart';
// import 'custom_wishList_card.dart';
//
// class CustomWishListPage extends StatelessWidget {
//   final String appBarTitle;
//   final Widget avatarImage;
//   final String userName;
//   final List<Map<String, dynamic>> itemList;
//   final Widget fundImage;
//
//   const CustomWishListPage({
//     super.key,
//     required this.appBarTitle,
//     required this.avatarImage,
//     required this.itemList, required this.fundImage, required this.userName,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomWidgets.customAppBar(title: appBarTitle),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: Column(
//           children: [
//             SizedBox(height: 20.h),
//
//             /// Avatar
//             Center(
//               child: Container(
//                 width: 102.w,
//                 height: 102.h,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.white, width: 3.w),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withValues(alpha: 0.2),
//                       spreadRadius: 5.r,
//                       blurRadius: 7.r,
//                       offset: Offset(0, 3.h),
//                     ),
//                   ],
//                 ),
//                 child: ClipOval(
//                   child: avatarImage,
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 20.h),
//
//             /// Greeting
//             Text(
//               userName,
//               style: TextStyle(
//                 fontSize: 32.sp,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffFD7839),
//               ),
//             ),
//
//             SizedBox(height: 24.h),
//
//
//             /// ------------------- Decoration images -------------------
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         fundImage
//                       ],
//                     ),
//
//                     Image.asset(
//                       ImagePaths.rewardFund,
//                       width: 46.w,
//                       height: 46.h,
//                     ),
//
//                     SizedBox(height: 24.h),
//
//             /// Wish List Items
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: itemList.length,
//               itemBuilder: (context, index) {
//                 final item = itemList[index];
//
//                 return Padding(
//                   padding: EdgeInsets.only(bottom: 12.h),
//
//                   child: WishListItemCard(cardImage: item["image"], description: item["description"], price: item["price"], contributeOnPressed: () {  },),
//
//                 );
//               },
//             ),
//
//             SizedBox(height: 16.h),
//
//             /// Add Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: addItemOnpress,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xffE2C1F3),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.r),
//                   ),
//                 ),
//                 child: Text(
//                   "+ Add Item",
//                   style: TextStyle(fontSize: 16.sp, color: Colors.black),
//                 ),
//               ),
//             ),
//
//             SizedBox(height: 30.h),
//           ],
//         ),
//       ),
//     );
//   }
// }
