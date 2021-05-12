import 'package:flutter/material.dart';
import 'cart.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFEBEAEF),
      statusBarIconBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
        fontFamily: "Nunito",
        primarySwatch: Colors.blue,
      ),
      home: CartScreen(),
    );
  }
}
