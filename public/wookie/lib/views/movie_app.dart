import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wookie/app_provider.dart';
import 'package:wookie/views/home/pages/home_screen.dart';
import 'package:wookie/views/themes/app_color.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.allProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
            primaryColor: AppColor.lightgray,
            scaffoldBackgroundColor: AppColor.lightgray,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            // textTheme: ThemeText.getTextTheme(),
            appBarTheme: const AppBarTheme(elevation: 0)),
        home: HomeScreen(),
      ),
    );
  }
}
