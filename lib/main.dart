import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:loadmore/data/datasources/local/shared_pref.dart';
import 'package:loadmore/presentation/routes/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:loadmore/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppPreferences.instance.init();
  await Supabase.initialize(
    url: 'https://fmsuiqlwskrsvtuucnoi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZtc3VpcWx3c2tyc3Z0dXVjbm9pIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTg1MjU0MTAsImV4cCI6MjA3NDEwMTQxMH0.mQZ6TnkL7MHuzhSHHxOKo51IDQ-6ofYHTYbgGttW74E',
  );
  await di.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('vi')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // iPhone 13
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          title: 'Movie App',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            useMaterial3: true,
            fontFamily: 'Roboto',
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          routerConfig: AppRouter.router,
          builder: (context, child) {
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              behavior: HitTestBehavior.translucent,
              child: child!,
            );
          },
        );
      },
    );
  }
}
