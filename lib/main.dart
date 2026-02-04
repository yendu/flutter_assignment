import 'package:flutter/material.dart';
import 'package:flutter_assignment/homepage/ui/homepage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/dependency_injection/dependency_injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: ProviderScope(child: Homepage()),
    );
  }
}

