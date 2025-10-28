import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zytronic_whatsapp_task/app.dart';
import 'package:zytronic_whatsapp_task/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Hive.initFlutter();
  runApp(const MyApp());
}
