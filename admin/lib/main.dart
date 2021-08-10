import 'package:admin/lang/LocalizationService.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:load/load.dart';

import 'routes/app_pages.dart';

void main() {
  PdfView.platform = SurfaceAndroidPdfViewer();
  runApp(MaterialApp(
    home: LoadingProvider(
      child: MyApp(),
      themeData: LoadingThemeData(
          // tapDismiss: false,
          ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: Locale("en", "US"),
      fallbackLocale: LocalizationService.fallBackLocale,
      translations: LocalizationService(),
    );
  }
}
