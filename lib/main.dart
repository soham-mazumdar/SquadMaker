import 'package:flutter/material.dart';
import 'package:squad_maker/app/app.dart';
import 'package:squad_maker/app/di/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(const App());
}
