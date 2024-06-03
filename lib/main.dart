import 'package:flutter/material.dart';
import 'package:myinstagram/providers/user_provider.dart';
import 'package:myinstagram/responsive/mobile_screen_layout.dart';
import 'package:myinstagram/responsive/responsive_layout_screen.dart';
import 'package:myinstagram/responsive/web_screen_layout.dart';
import 'package:myinstagram/screens/login_screen.dart';
import 'package:myinstagram/screens/signup_screen.dart';
import 'package:myinstagram/utils/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx){
          return UserProvider();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: /*ResponsiveLayout(
          webScreenLayout: WebScreenLayout(),
          mobileScreenLayout: MobileScreenLayout(),
        )*/MobileScreenLayout(),
      ),
    );
  }
}
