import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotlight_news/style/AppStyle.dart';
import 'package:spotlight_news/ui/home/home_screen.dart';
import 'package:spotlight_news/ui/search_screen/SearchScreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppStyle.lightTheme,
          routes: {
            HomeScreen.routeName:(_)=>HomeScreen(),
            SearchScreen.routeName:(_)=>SearchScreen(selectedWidget: null,)
          },
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}
