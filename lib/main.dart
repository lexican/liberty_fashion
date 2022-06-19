import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:liberty_fashion/src/app.dart';
import 'package:liberty_fashion/src/core/services/locator/locator.dart';
import 'package:liberty_fashion/src/features/tab_view/tab_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    runApp(const LibertyFashionApp());
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}



