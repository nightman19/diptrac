import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'ui/widgets/app.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const DiptracApp(),
  );
}