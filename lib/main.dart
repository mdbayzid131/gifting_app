import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gifting_app/presentation/controllers/auth_controller.dart';
import 'package:gifting_app/routes/routes.dart';

import 'binding/home_binding.dart';
import 'data/repo/auth_repo.dart';
import 'data/services/api_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiClient.init();

  runApp(MyApp());
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
