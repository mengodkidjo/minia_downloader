import 'package:flutter/material.dart';
import 'package:minia_downloader/styles/app_theme.dart';
import 'package:minia_downloader/views/home/home_view.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Minia Donwloader',
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.dark,
        theme: AppTheme.light,
        initialRoute: HomeView.homeRoute,
        // routes: {
        //   '/': (context) => const HomeView(),
        // },
        home: const HomeView(),
      );
    });
  }
}
