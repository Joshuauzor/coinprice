import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/app/index.dart';
import 'package:todo/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupsl();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then(
    (_) => {
      runApp(
        DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => const MyApp(),
        ),
      )
    },
  );
}
