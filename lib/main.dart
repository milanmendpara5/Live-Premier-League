import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_interview/dashboardpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        backgroundColor: const Color(0XFF1E1E1E),
        primarySwatch: Colors.blue,
      ),
      home: const DashBoardPage(),
    );
  }
}
