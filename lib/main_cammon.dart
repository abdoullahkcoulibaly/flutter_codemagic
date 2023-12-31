import 'package:flutter/material.dart';
import 'package:flutter_codemagic/app_widget.dart';
import 'package:flutter_codemagic/config_reader.dart';
import 'package:flutter_codemagic/environment.dart';
import 'package:provider/provider.dart';

Future<void> mainCommon(String env) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();
  // Load the JSON config into memory 
  await ConfigReader.initialize();

  late Color primaryColor;
  switch (env) {
    case Environment.dev:
      primaryColor = Colors.blue;
      break;
    case Environment.prod:
      primaryColor = Colors.red;
      break;
  }

  runApp(
    Provider.value(
      value: primaryColor,
      child: const MyApp(),
    ),
  );
}