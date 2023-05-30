import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/adapters.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  await Hive.initFlutter();
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
