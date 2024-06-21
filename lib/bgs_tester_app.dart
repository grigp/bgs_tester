import 'package:flutter/material.dart';
import 'package:bgs_tester/theme/theme.dart';
import 'package:bgs_tester/router/router.dart';

class BgsTesterApp extends StatelessWidget {
  const BgsTesterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BGS tester',
      theme: darkTheme,
      routes: routes,
    );
  }
}
