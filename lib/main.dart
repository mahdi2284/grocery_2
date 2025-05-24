import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery/api/api_services.dart';
import 'package:grocery/models/category_model.dart';
import 'package:grocery/pages/dashboard/dashboard_page.dart';

Widget _defaultHome = DashboardPage();
void main() {
  runApp(const MyApp());
}
final String appName = 'Grocery App';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{'/': (context) => _defaultHome},
    );
  }
}
