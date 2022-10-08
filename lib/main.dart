import 'package:bot_toast/bot_toast.dart';
import 'package:demolocaldatabase/constant/color_constant.dart';
import 'package:demolocaldatabase/login/login_page.dart';
import 'package:demolocaldatabase/providers/login_provider.dart';
import 'package:demolocaldatabase/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
    ChangeNotifierProvider<RegisterProvider>(create: (context) => RegisterProvider()),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorConstant.appWhite,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        home: const LoginPage(),
        builder: BotToastInit(),
        navigatorObservers: <NavigatorObserver>[BotToastNavigatorObserver()],
        theme: ThemeData(scaffoldBackgroundColor: ColorConstant.appWhite),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
