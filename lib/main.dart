import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gifting_app/routes/routes.dart';

import 'binding/home_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Color(0xffFFFAF8),
              scrolledUnderElevation: 0,
            ),
            scaffoldBackgroundColor: Color(0xffFFFAF8),
          ),
          initialRoute: RoutePages.splashScreen,
          getPages: pages,
          initialBinding: HomeBinding(),
        );
      },
    );
  }
}
