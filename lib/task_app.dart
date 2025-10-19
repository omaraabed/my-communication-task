import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/keys.dart';
import 'core/utils/navigation/app_router.dart';
import 'core/utils/navigation/router_path.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: Keys.redHatDisplay),
          initialRoute: RouterPath.splash,
          onGenerateRoute: AppRouter().generateRoute,
        );
      },
    );
  }
}
