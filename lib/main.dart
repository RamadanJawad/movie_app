import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/config/constants.dart';
import 'package:movie_app/config/dependency_injection.dart';
import 'package:movie_app/core/locale/locales.dart';
import 'package:movie_app/core/resources/manager_assets.dart';
import 'package:movie_app/core/resources/manager_colors.dart';
import 'package:movie_app/routes/routes.dart';

void main() async {
  await initModule();
  runApp(
    EasyLocalization(
      supportedLocales: localeSettings.locales,
      path: ManagerTranslations.translationPath,
      fallbackLocale: localeSettings.defaultLocale,
      startLocale: localeSettings.defaultLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(
        Constants.deviceWidth,
        Constants.deviceHeight,
      ),
      builder: (context, widget) {
        return GetMaterialApp(
          theme: ThemeData(
            primaryColor: ManagerColors.vulcan,
            scaffoldBackgroundColor: ManagerColors.vulcan,
            appBarTheme:
                const AppBarTheme(color: ManagerColors.vulcan, elevation: 0),
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.homeView,
        );
      },
    );
  }
}
