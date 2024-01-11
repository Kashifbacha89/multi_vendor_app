import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_vendor_app/view/buyers/auth/register_screen.dart';
import 'package:multi_vendor_app/view/buyers/main_screen.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff00adb5),),
        useMaterial3: true,
        fontFamily: 'Brand-Bold',
    buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xff00adb5),
      )),
      home:  UserRegistrationScreen(),
    );
  }
}
