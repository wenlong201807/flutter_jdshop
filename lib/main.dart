import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'routers/router.dart';

// 引入provider
import 'package:provider/provider.dart';
import 'provider/CheckOut.dart';
import 'provider/Cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334), //配置设计稿的宽度高度
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CheckOut()),
            ChangeNotifierProvider(create: (_) => Cart()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: onGenerateRoute,
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
          ),
        );

      },
    );
  }
}
