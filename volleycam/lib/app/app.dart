import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

class VolleyCamApp extends StatelessWidget {
  const VolleyCamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'VolleyCam',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routerConfig: router,
    );
  }
}