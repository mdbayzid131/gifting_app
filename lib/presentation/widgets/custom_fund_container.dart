import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomFundContainer extends StatelessWidget {
  final String title;
  final Widget image;
  final VoidCallback viewOnPressed;
  final VoidCallback? addOnPressed;
  final bool? isMyProfile;

  const CustomFundContainer({super.key, required this.title, required this.image, required this.viewOnPressed,  this.addOnPressed, this.isMyProfile=true});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(10),

      // height: 240.h,
       height: isMyProfile==true ? 240.h : 180.h,
      width: 102.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffE2C1F3), Color(0xffFFFDEB)],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xffF2F2F2), // outline color
          width: 1, // outline thickness
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff101828),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Expanded(child: image),
          SizedBox(height: 20),
           ElevatedButton(
            onPressed: viewOnPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(82.w, 36.h),
              backgroundColor: Color(0xffFFEC54),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text("View"),
          ),
          SizedBox(height: 4),
          isMyProfile == true ?ElevatedButton(
            onPressed: addOnPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(82.w, 36.h),
              backgroundColor: Color(0xffE2C1F3),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text("Add"),
          ) : Container(),
        ],
      ),
    );
  }
}
