import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:initial_project/Pages/cart_page.dart';
import 'package:initial_project/Pages/home_page.dart';
import 'package:initial_project/core/store.dart';
import 'package:initial_project/routes/route.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Pages/login_page.dart';
import './widgets/themes.dart';
import './core/store.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      themeMode:  ThemeMode.light,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),

      // initialRoute: MyRoutes.homeroute,
      routes: {
        '/' : (context) => LoginPage(),
        MyRoutes.homeroute : (context) => HomePage(),
        MyRoutes.cartRoute : (context) => CartPage(),
      },
    );
  }
}
