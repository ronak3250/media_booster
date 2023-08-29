
import 'package:flutter/material.dart';
import 'package:muscape/MusicHomeScreen/controller/MusicHomeScreenProvider.dart';
import 'package:muscape/MusicHomeScreen/view/video_details_screen.dart';
import 'package:provider/provider.dart';

import 'MusicHomeScreen/view/HomePage.dart';
void main()
{
  runApp(
MultiProvider(providers:[ChangeNotifierProvider<HomeScreenProvider>(create: (context) => HomeScreenProvider())],

child:     MaterialApp(
  debugShowCheckedModeBanner: false,
  theme:ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white.withOpacity(0.5)),

  ),
  home: HomePage(),),)
);
}
