import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/router.dart';
import 'package:reddit_clone/themes/pallete.dart';
import 'package:routemaster/routemaster.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Reddit Tutorial',
      theme: Pallete.darkModeAppTheme,
      routerDelegate:
          RoutemasterDelegate(routesBuilder: (context) => loggedOutRoute),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
