import 'package:darfy_app/src/core/router.dart';
import 'package:flutter/cupertino.dart';

class DarfyApp extends StatelessWidget {
  const DarfyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      title: 'Darfy',
      theme: const CupertinoThemeData(brightness: Brightness.light),
      routerConfig: router,
    );
  }
}
