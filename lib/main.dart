import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zytronic_whatsapp_task/app.dart';
import 'package:zytronic_whatsapp_task/di/injection.dart';
import 'package:zytronic_whatsapp_task/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: false);
  configureDependencies();
  await Hive.initFlutter();
  runApp(const MyApp());
}
