import 'package:flutter/material.dart';
import 'package:recipes_app/page/home_page.dart';
import 'package:recipes_app/page/login_page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipes Book',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w400
          )
        )
      ),
      // home: LoginPage(),
      initialRoute: "/login",
      routes: {
        "/login":(context)=>LoginPage(),
        "/home":(context)=>HomePage(),
      },
    );
  }

}
